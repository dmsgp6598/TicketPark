package ticket.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ticket.common.CommandMap;
import ticket.service.MyPageService;

@Controller
public class MyPageController {
	
	@Resource(name = "mypageService")
	private MyPageService mypageService;
	
	@RequestMapping(value="/mypage/resList")
	public ModelAndView NowReslist(CommandMap commandMap,HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/mypage/resList");
		
		HttpSession session = request.getSession();
		Map mm = (Map)session.getAttribute("session_MEM_INFO");
		
		commandMap.put("MEM_NUM", mm.get("MEM_NUM"));
		
		
		List<Map<String, Object>> nowRes = mypageService.selectNowResList(commandMap.getMap());

		for(int i=0; i<nowRes.size(); i++) {
			DateFormat dateFormat = new SimpleDateFormat("yy/MM/dd hh:mm:ss");
			Date Date = dateFormat.parse((String) nowRes.get(i).get("RES_TIME"));
			Date now = new Date();
			
			
			int compare = Date.compareTo(now);
			
			System.out.println(compare);
			if(compare<0) {
				commandMap.put("RES_NUM", nowRes.get(i).get("RES_NUM"));
				mypageService.updateExpire(commandMap.getMap());
			}
		}
		return mv;
	}
	
	@RequestMapping(value="/mypage/selectNowResList")
	public ModelAndView selectNowReslist(CommandMap commandMap,HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		HttpSession session = request.getSession();
		Map mm = (Map)session.getAttribute("session_MEM_INFO");
		
		commandMap.put("MEM_NUM", mm.get("MEM_NUM"));
	
		
		List<Map<String, Object>> nowRes = mypageService.selectNowResList(commandMap.getMap());
		mv.addObject("nowRes", nowRes);
		if (nowRes.size() > 0) {
			mv.addObject("TOTAL", nowRes.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}
	
	@RequestMapping(value="/mypage/selectPastResList")
	public ModelAndView selectPastReslist(CommandMap commandMap,HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		HttpSession session = request.getSession();
		Map mm = (Map)session.getAttribute("session_MEM_INFO");
		
		commandMap.put("MEM_NUM", mm.get("MEM_NUM"));
		
		List<Map<String, Object>> nowRes = mypageService.selectPastResList(commandMap.getMap());
		mv.addObject("pastRes", nowRes);
		if (nowRes.size() > 0) {
			mv.addObject("TOTAL", nowRes.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}
	
	@RequestMapping(value = "/mypage/memDetail")
	public ModelAndView memDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/mypage/memDetail");
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID", session.getAttribute("session_MEM_INFO.MEM_ID"));
		Map<String,Object> map = mypageService.selectMember(commandMap.getMap());	
		mv.addObject("map",map);
		return mv;
	}

	@RequestMapping(value = "/mypage/memberModifyForm")
	public ModelAndView memModifyForm(CommandMap commandMap,HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/mypage/memberModifyForm");
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID", session.getAttribute("session_MEM_INFO.MEM_ID"));
		Map<String,Object> map = mypageService.selectMember(commandMap.getMap());	
		mv.addObject("map",map);
	
		return mv;
	}
	
	@RequestMapping(value = "/mypage/memberModify")
	public ModelAndView memModify(CommandMap commandMap,HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID", session.getAttribute("session_MEM_INFO.MEM_ID"));
		
		System.out.println(commandMap.getMap());
		
		mypageService.updateMember(commandMap.getMap());
		ModelAndView mv = new ModelAndView("redirect:/mypage/resList");
		Map<String,Object> map = mypageService.selectMember(commandMap.getMap());	
		mv.addObject("map",map);
		return mv;
	}
	
	
	@RequestMapping(value="/mypage/memberDeleteForm")
	public ModelAndView memDeleteForm(CommandMap commandMap) throws Exception{
	ModelAndView mv = new ModelAndView("/mypage/memberDeleteForm");
	return mv;
	}
	
	
	@RequestMapping(value="/mypage/memberDelete")
	public ModelAndView memDelete(CommandMap commandMap, HttpServletRequest request)throws Exception{	
	ModelAndView mv=new ModelAndView("/mypage/memberDelete");	
	System.out.println(commandMap.getMap().get("MEM_PWD"));
	HttpSession session = request.getSession();
	System.out.println(session.getAttribute("session_MEM_INFO"));
	String message="";
	
	Map mm = (Map)session.getAttribute("session_MEM_INFO");
	if((commandMap.getMap().get("MEM_PWD")).equals(mm.get("MEM_PWD"))) {
		mypageService.deleteMember(commandMap.getMap());
		session.invalidate();	
	} else {
		message="비밀번호가 맞지 않습니다.";
	}
	mv.addObject("message",message);
	
	return mv;
	}
	
	@RequestMapping(value="/mypage/likeList")
	public ModelAndView likeList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/mypage/likeList");

		return mv;
	}
	
	@RequestMapping(value="/mypage/selectLikeList")
	public ModelAndView selectLikeList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<Map<String, Object>> like = mypageService.selectLikeList(commandMap.getMap());
		mv.addObject("like", like);
		if (like.size() > 0) {
			mv.addObject("TOTAL", like.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}
	
	@RequestMapping(value="/mypage/reviewList")
	public ModelAndView reviewList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/mypage/reviewList");

		return mv;
	}
	
	@RequestMapping(value="/mypage/selectReviewList")
	public ModelAndView selectReviewList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<Map<String, Object>> review = mypageService.selectMyReviewList(commandMap.getMap());
		System.out.println(review);
		mv.addObject("review", review);
		if (review.size() > 0) {
			mv.addObject("TOTAL", review.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}
}
