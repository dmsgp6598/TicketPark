package ticket.controller;

import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ticket.common.CommandMap;
import ticket.service.LoginService;
import ticket.service.MailService;

@Controller
public class LoginController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "mailService")
	private MailService mailService;
	
	@Resource(name = "loginService")
	private LoginService loginService;
	
	@Inject
	private JavaMailSender mailSender;
	
	
	@RequestMapping(value = "/logon/loginForm") 
	public ModelAndView loginForm() throws Exception {
		ModelAndView mv = new ModelAndView("loginForm");
		return mv;
	}

	@RequestMapping(value = "/logon/login", method = RequestMethod.POST)
	public ModelAndView login(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/member/login");
		String message = "";
		HttpSession session = request.getSession();
		
		Map<String, Object> chk = loginService.loginCheck(commandMap.getMap());
		
		if (chk==null) { 
			message = "해당 아이디가 존재하지 않습니다.";
		} else {
			if (chk.get("MEM_PWD").equals(commandMap.get("MEM_PWD"))) {
				if(chk.get("MEM_VERIFY").equals("Y")) {
				session.setAttribute("session_MEM_INFO", chk);
			} else { 
				message = "이메일 인증을 완료해주세요.";
			}
		} else { // 비밀번호가 일치하지 않을 때
				message = "비밀번호가 맞지 않습니다.";
			}
		}
		//System.out.println(chk);
		mv.addObject("message",message);
		return mv;
	}
	
	@RequestMapping(value = "/logon/logout") 
	   public ModelAndView logout(HttpServletRequest request, CommandMap commandMap) throws Exception {
	      HttpSession session = request.getSession(false);
	      if (session != null)
	         session.invalidate();
	      ModelAndView mv = new ModelAndView("logout");
	      return mv;
	   }
	
	@RequestMapping(value = "/logon/findIdForm") // 아이디 찾기 폼을 보여주는 메소드
	public ModelAndView findIdForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/findIdForm");
		int ran = new Random().nextInt(900000) + 100000;
		
		mv.addObject("random",ran);
		
		return mv;
	}

	@RequestMapping(value = "/logon/findId", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String findId(CommandMap commandMap) throws Exception {
		String id = String.valueOf(loginService.findId(commandMap.getMap()));
		
		if(id.equals("1")) {
			String findId = (String)(loginService.selectId(commandMap.getMap()).get("MEM_ID"));
			System.out.println(findId);
			return findId;
			
		}else {
			return id;
		}
	}
	
	@RequestMapping(value = "/logon/findpwForm") // 비밀번호 찾기 폼을 보여주는 메소드
	public ModelAndView findpwForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/findIdForm");
		int ran = new Random().nextInt(900000) + 100000;
		
		mv.addObject("random",ran);
		
		return mv;
	}
	
	@RequestMapping(value = "/logon/findPw", method=RequestMethod.GET) //비밀번호 찾기
	@ResponseBody
	public boolean findPwEmail(CommandMap commandMap,@RequestParam String MEM_ID, @RequestParam String MEM_EMAIL, @RequestParam int random, HttpServletRequest req) throws Exception {
			
		String emailCheck = String.valueOf(loginService.findPw(commandMap.getMap()));
		System.out.println(emailCheck);
		if(emailCheck.equals("1")) {
			int ran = new Random().nextInt(900000) + 100000;
			   HttpSession session = req.getSession(true);
			   String authCode = String.valueOf(ran);
			   session.setAttribute("authCode", authCode);
			   session.setAttribute("random", random);
			   String subject = "TicketPark 비밀번호 변경 코드 안내 입니다.";
			   StringBuilder sb = new StringBuilder();
			   sb.append("귀하의 임시 비밀번호는 " + authCode + "입니다.");
			   
			   commandMap.put("MEM_ID", MEM_ID);
			   commandMap.put("MEM_EMAIL", MEM_EMAIL);
			   commandMap.put("authCode", authCode);
			   loginService.updatePw(commandMap.getMap());
			   return mailService.send(subject, sb.toString(),"dmsgp4388@gmail.com", MEM_EMAIL, null);
		}else {
			  return false;
		}
	}
	
	
	
	
	
}