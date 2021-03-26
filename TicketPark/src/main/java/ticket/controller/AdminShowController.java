package ticket.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ticket.common.CommandMap;
import ticket.service.AdminShowService;

@Controller
public class AdminShowController {
	
	@Resource(name="adminShowService")
	private AdminShowService adminShowService;
	
	@RequestMapping(value="/adminShow/showWriteForm")
	public ModelAndView showWriteForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/adminShow/showWriteForm");
		Map<String, Object> map = commandMap.getMap();
		if(map.size() == 0) {
			mv.addObject("SHOW_CAT", null);
		}
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value="/adminShow/showWrite")
	public ModelAndView showWrite(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/adminShow/showList");
		System.out.println(commandMap.getMap());
		List<String> list = new ArrayList<String>();
		List<String> list1 = new ArrayList<String>();
		String option1 = null;
		String option2 = null;
		for(int i=0; i<5; i++) {
			if(commandMap.get("option1_"+i).equals("") || commandMap.get("option1_"+i) == null) {
			}
			else {
				list.add((String)commandMap.get("option1_"+i));
			}
		}
		for(int i=0; i<5; i++) {
			if(commandMap.get("option2_"+i).equals("") || commandMap.get("option2_"+i) == null) {
			}
			else {
				list1.add((String)commandMap.get("option2_"+i));
			}
		}
		if(list.size() == list1.size()) {
			option1 = String.join(",", list);
			option2 = String.join(",", list1);
		}
		System.out.println(option1 + "   " + option2);
		commandMap.put("SHOW_OPTION1", option1);
		commandMap.put("SHOW_OPTION2", option2);
		
		
		
		adminShowService.insertShow(commandMap.getMap(), request);
		return mv;
	}
	
	@RequestMapping(value="/adminShow/showList")
	public ModelAndView showList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/adminShow/showList");
		
		return mv;
	}
	
	@RequestMapping(value="/adminShow/selectShowList")
	public ModelAndView selectShowList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String,Object>> list = adminShowService.selectShowList(commandMap.getMap());
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}
		return mv;
	}
	
	@RequestMapping(value="/adminShow/resMemberList")
	public ModelAndView resMemberList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/adminShow/resMemberList");
		List<Map<String, Object>> list = adminShowService.selectShow(commandMap.getMap());
		mv.addObject("showList", list);
		System.out.println(list);
		return mv;
	}
	
	@RequestMapping(value="/adminShow/selectResMemberList")
	public ModelAndView selectResMemberList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String,Object>> list = adminShowService.selectResMemberList(commandMap.getMap());
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}
		return mv;
	}
	
	@RequestMapping(value="/adminShow/showDelete")
	public ModelAndView showDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/adminShow/showList");
		adminShowService.deleteShow(commandMap.getMap());
		return mv;
	}
	
}
