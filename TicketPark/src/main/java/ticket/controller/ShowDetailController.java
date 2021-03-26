package ticket.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ticket.common.CommandMap;
import ticket.service.AdminMemService;
import ticket.service.ShowDetailService;

@Controller
public class ShowDetailController {
	
	@Resource(name="adminmemService")
	private AdminMemService adminmemService;
	
	@Resource(name="showDetailService")
	private ShowDetailService showDetailService;
	
	@RequestMapping(value="/showDetail")
	public ModelAndView showDetail(CommandMap commandMap) throws Exception{
		String msg = null;
		System.out.println(commandMap.getMap());
		ModelAndView mv = new ModelAndView("/showDetail/showDetail");
		List<Map<String, Object>> showList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> show = showDetailService.selectShow(commandMap.getMap());
		List<Map<String, Object>> splitList = showDetailService.split(commandMap.getMap());
		System.out.println(splitList);
		mv.addObject("splitList", splitList);
		
		if(commandMap.get("msg") != null) {
			int msgcnt = Integer.parseInt(commandMap.get("msg").toString());
			switch(msgcnt) {
				case 1 : msg = "이미 작성한 리뷰가 있습니다.";
						 mv.addObject("msg", msg);
						 break;
				case 2 : msg = "남은 좌석 수가 부족합니다. 확인해주세요.";
						 mv.addObject("msg", msg);
						 break;
				case 3 : msg = "즐겨찾기 목록에서 삭제되었습니다.";
						 mv.addObject("msg", msg);
						 break;
				case 4 : msg = "즐겨찾기 목록에 추가되었습니다.";
						 mv.addObject("msg", msg);
						 break;
				default : msg = "에러입니다.";
						  mv.addObject("msg", msg);
						  break;
			}
		}
		if(commandMap.get("mode") == null) {
			String mode = "1";
			mv.addObject("mode", mode);
		}else {
			mv.addObject("mode", commandMap.get("mode"));
		}

		int a = show.size();
		for(int i=0; i<a; i++) {
			DateFormat dateFormat = new SimpleDateFormat("yy/MM/dd hh:mm:ss");
			String date = show.get(i).get("SHOW_DATE").toString() + " " + show.get(i).get("SHOW_TIME").toString();
			Date Date = dateFormat.parse(date);
			Date now = new Date();
			
			
			int compare = Date.compareTo(now);
			
			System.out.println(i);
			Map<String, Object> confirm = show.get(i);
			confirm.put("confirm", compare);
			showList.add(confirm);
		}
		mv.addObject("showList", showList);
		System.out.println(showList);
		return mv;
	}
	
	@RequestMapping(value="/showDetail/showDetail")
	public ModelAndView detail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/showDetail/detail");
		mv.addObject("SHOW_DETAIL", commandMap.get("SHOW_DETAIL"));
		
		return mv;
	}
	
	@RequestMapping(value="/showDetail/review")
	public ModelAndView review(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/showDetail/review");
		mv.addObject("SHOW_NUM", commandMap.get("SHOW_NUM"));
		mv.addObject("REVIEW_SHOWNAME", commandMap.get("REVIEW_SHOWNAME"));
		System.out.println(commandMap.getMap());
		return mv;
	}
	
	@RequestMapping(value="/showDetail/selectReviewList")
	public ModelAndView selectReviewList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String, Object>> list = showDetailService.selectReviewList(commandMap.getMap());
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}
		mv.addObject("MEM_ID", commandMap.get("MEM_ID"));
		mv.addObject("MEM_ADMIN", commandMap.get("MEM_ADMIN"));
		mv.addObject("SHOW_NUM", commandMap.get("SHOW_NUM"));
		return mv;
	}
	
	@RequestMapping(value="/showDetail/reviewWrite")
	public ModelAndView reviewWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/showDetail");
		Map<String, Object> IDcheck = showDetailService.selectReview(commandMap.getMap());
		Map<String, Object> Rescheck = showDetailService.checkRes(commandMap.getMap());
		String IDchecknum = String.valueOf(IDcheck.get("TOTAL_COUNT"));
		String Reschecknum = String.valueOf(Rescheck.get("TOTAL_COUNT"));
		if(IDchecknum.equals("0")) {
			if(Reschecknum.equals("0")) {
				commandMap.put("REVIEW_RES", 'N');
			}else {
				commandMap.put("REVIEW_RES", 'Y');
			}
			System.out.println(commandMap.getMap());
			showDetailService.insertReview(commandMap.getMap());
		}else {
			mv.addObject("msg", 1);
		}
		mv.addObject("SHOW_NUM", commandMap.get("SHOW_NUM"));
		mv.addObject("mode", "2");
		return mv;
	}
	
	@RequestMapping(value="/showDetail/reviewDelete")
	public ModelAndView reviewDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/showDetail");
		mv.addObject("SHOW_NUM", commandMap.get("SHOW_NUM"));
		String MEM_ADMIN = (String)commandMap.get("MEM_ADMIN");
		System.out.println(MEM_ADMIN);
		if(MEM_ADMIN.equals("A")) {
			showDetailService.updateStack(commandMap.getMap());
			
			Map<String, Object> stackCheck = showDetailService.selectStack(commandMap.getMap());

			if(Integer.parseInt( String.valueOf(stackCheck.get("MEM_STACK"))) >= 3) {
				commandMap.put("MEM_ID", commandMap.get("REVIEW_ID"));
				adminmemService.updateMemberBan(commandMap.getMap());
			}
		}
		showDetailService.deleteReview(commandMap.getMap());
		return mv;
	}
	
	@RequestMapping(value="/showDetail/like")
	public ModelAndView like(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/showDetail");
		int cnt = 0;
		List<Map<String, Object>> likeList = showDetailService.checkLike(commandMap.getMap());
		System.out.println(likeList);
		String num1 = String.valueOf(commandMap.get("SHOW_NUM"));
		for(int i=0; i<likeList.size(); i++) {
			String num2 = String.valueOf(likeList.get(i).get("SHOW_NUM"));
			if(num2.equals(num1)) {
				cnt++;
			}
		}
		System.out.println(cnt);
		if(cnt > 0) {
			showDetailService.deleteLike(commandMap.getMap());
			mv.addObject("msg", 3);
		}else {
			showDetailService.insertLike(commandMap.getMap());
			mv.addObject("msg", 4);
		}
		mv.addObject("SHOW_NUM", commandMap.get("SHOW_NUM"));
		return mv;
	}
}
