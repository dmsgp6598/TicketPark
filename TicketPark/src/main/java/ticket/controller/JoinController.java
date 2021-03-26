package ticket.controller;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ticket.common.CommandMap;
import ticket.common.MailHandler;
import ticket.service.JoinService;
import ticket.service.MailService;

@Controller
public class JoinController {
	
	@Resource(name = "mailService")
	private MailService mailService;
	
	@Resource(name="joinService")
	private JoinService joinService;
	
	@Inject
	private JavaMailSender mailSender;
	
	@RequestMapping(value = "/join/joinForm")
	public ModelAndView joinForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("joinForm");		
		return mv;
	}
	
	@RequestMapping(value = "/join/emailAuth")
	public ModelAndView join(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/join/joinConfirm");
		System.out.println(commandMap.get("MEM_ID"));
		
		joinService.insertMember(commandMap.getMap(), request);
		System.out.println(commandMap);
		MailHandler sendMail = new MailHandler(mailSender);
		
		String url = request.getRequestURL().toString().replace(request.getRequestURI(),"/ticket/join/memberVerify?MEM_EMAIL=");
		sendMail.setSubject("이메일 인증 확인 메일입니다.");
		sendMail.setText(new StringBuffer()
				.append("<h3>메일인증</h3><br>")
				.append("<h3>아래링크를 눌러 이메일 인증을 해주세요</h3><br>")
				.append("<a href='http://localhost:9000/ticket/join/memberVerify?MEM_EMAIL=" + commandMap.getMap().get("MEM_EMAIL"))/* .toString() */
				.append("' target='_blenk'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("dmsgp6598@gmail.com","TicketPark");
		sendMail.setTo(commandMap.getMap().get("MEM_EMAIL").toString());
		sendMail.send();

		return mv;
	}
	
	 @RequestMapping(value = "/join/idCheck") //�븘�씠�뵒 以묐났�솗�씤
	  public @ResponseBody String idCheck(CommandMap commandMap) throws Exception {
	      
	     System.out.println(commandMap.getMap());
	      
	     String idCheck = String.valueOf(joinService.checkId(commandMap.getMap()));
	      
	     System.out.println(idCheck);

	      return idCheck;
	   }
	 
	 @RequestMapping(value="/join/memberVerify", method=RequestMethod.GET)
		//member table�뿉 verfiy而щ읆�쓽 媛믪쓣 諛붽퓭以��떎.
		public ModelAndView signSuccess(CommandMap commandMap) throws Exception{
			//�씠硫붿씪 �씤利앷린�뒫 泥섎━
			ModelAndView mv=new ModelAndView("/join/memberVerify");
			commandMap.getMap().get("MEM_EMAIL").toString();
			joinService.verifyMember(commandMap.getMap());
			
			return mv;
		}
	 
	 
	
}
