package ticket.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ticket.common.CommandMap;
import ticket.service.AdminMemService;

@Controller
public class AdminMemController {
	
	@Resource(name="adminmemService")
	private AdminMemService adminmemService;
	
	@RequestMapping(value = "/adminMem/memberList")
	public ModelAndView memberList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/adminMem/memberList");
		Map<String, Object> map = commandMap.getMap();
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value = "/adminMem/memberBan")
	public ModelAndView memberBan(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/adminMem/memberList");
		adminmemService.updateMemberBan(commandMap.getMap());
		return mv;
	}
	
	@RequestMapping(value = "/adminMem/banList")
	public ModelAndView banList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/adminMem/banList");
		Map<String, Object> map = commandMap.getMap();
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value="/adminMem/banSearchList")
	public ModelAndView banSearchList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<Map<String,Object>> banSearchList = adminmemService.selectBanSearchList(commandMap.getMap());
		mv.addObject("ban",banSearchList);
		
		if (banSearchList.size() > 0) {
			mv.addObject("TOTAL", banSearchList.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}
		return mv;
	}
	
	
	@RequestMapping(value = "/adminMem/selectBanList")
	public ModelAndView selectBanList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<Map<String,Object>> banList = adminmemService.selectBanList(commandMap.getMap());
		mv.addObject("ban",banList);

		if (banList.size() > 0) {
			mv.addObject("TOTAL", banList.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}
		return mv;
	}
	
	@RequestMapping(value = "/adminMem/banReturn")
	public ModelAndView banReturn(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/adminMem/banList");
		adminmemService.updateMemberBan(commandMap.getMap());
		return mv;
	}
	
	@RequestMapping(value="/adminMem/memberSearchList")
	public ModelAndView memberSearchList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<Map<String,Object>> memberSearchList = adminmemService.selectMemberSearchList(commandMap.getMap());
		mv.addObject("mem",memberSearchList);
		
		if (memberSearchList.size() > 0) {
			mv.addObject("TOTAL", memberSearchList.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}
		return mv;
	}
	
}
