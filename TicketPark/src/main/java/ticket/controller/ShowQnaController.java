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
import ticket.service.ShowQnaService;

@Controller
public class ShowQnaController {
	
	@Resource(name="showqnaService")
	private ShowQnaService showqnaService;
	
	@RequestMapping(value="/showDetail/qnaList")
	public ModelAndView showQnaList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/showDetail/qnaList");
		Map<String, Object> map = commandMap.getMap();
		System.out.println(map);
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value = "/showDetail/selectShowQnaList")
	public ModelAndView selectShowQnaList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		if(commandMap.get("COLUMN_NAME").equals("0")) {
			commandMap.put("COLUMN_NAME", "SHOWQNA_ID");
		}else if(commandMap.get("COLUMN_NAME").equals("1")) {
			commandMap.put("COLUMN_NAME", "SHOWQNA_TITLE");
		}
		
		List<Map<String,Object>> showqnaList = showqnaService.selectshowQnaSearchList(commandMap.getMap());	
		mv.addObject("showQna",showqnaList);

		if (showqnaList.size() > 0) {
			mv.addObject("TOTAL", showqnaList.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}
		return mv;
	}
	
	@RequestMapping(value="/showDetail/qnaWriteForm")
	public ModelAndView qnaWriteForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/showDetail/qnaWriteForm");
		
		mv.addObject("SHOWQNA_SHOWNUM", commandMap.get("SHOWQNA_SHOWNUM"));
		
		return mv;
	}
	
	@RequestMapping(value="/showDetail/qnaWrite")
	public ModelAndView qnaWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/showDetail");
		Map<String, Object> map = commandMap.getMap();
		mv.addObject("map", map);
		System.out.println(map);
		showqnaService.insertShowQna(commandMap.getMap());
		mv.addObject("SHOW_NUM", commandMap.get("SHOWQNA_SHOWNUM"));
		mv.addObject("mode", "3");
		return mv;
	}
	
	@RequestMapping(value="/showDetail/qnaDetail")
	public ModelAndView qnaDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/showDetail/qnaDetail");
		
		Map<String, Object> qna = showqnaService.selectShowQnaDetail(commandMap.getMap());
		mv.addObject("qna", qna);
		
		return mv;
	}
	
	@RequestMapping(value="/showDetail/qnaModifyForm")
	public ModelAndView qnaModifyForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/showDetail/qnaModifyForm");
		Map<String, Object> qna = showqnaService.selectShowQnaDetail(commandMap.getMap());
		mv.addObject("qna", qna);
		
		return mv;
	}
	
	@RequestMapping(value="/showDetail/qnaModify")
	public ModelAndView qnaModify(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/showDetail");
		Map<String, Object> map = commandMap.getMap();
		mv.addObject("map", map);
		showqnaService.updateShowQna(commandMap.getMap());
		mv.addObject("SHOW_NUM", commandMap.get("SHOWQNA_SHOWNUM"));
		mv.addObject("mode", "3");
		return mv;
	}
	
	@RequestMapping(value="/showDetail/qnaDelete")
	public ModelAndView qnaDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/showDetail");
		Map<String, Object> map = commandMap.getMap();
		mv.addObject("map", map);
		showqnaService.deleteShowQna(commandMap.getMap());
		mv.addObject("SHOW_NUM", commandMap.get("SHOWQNA_SHOWNUM"));
		mv.addObject("mode", "3");
		return mv;
	}
	
	@RequestMapping(value="/adminShow/qnaReWriteForm")
	public ModelAndView qnaReWriteForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/adminShow/qnaReWriteForm");
		
		Map<String, Object> qna = showqnaService.selectShowQnaDetail(commandMap.getMap());
		mv.addObject("qna", qna);
		
		return mv;
	}
	
	@RequestMapping(value="/adminShow/qnaReWrite")
	public ModelAndView qnaReWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/showDetail");
		Map<String, Object> map = commandMap.getMap();
		mv.addObject("map", map);
		System.out.println(map);
		showqnaService.insertReshowQna(map);
		mv.addObject("SHOW_NUM", commandMap.get("SHOWQNA_SHOWNUM"));
		mv.addObject("mode", "3");
		return mv;
	}
}
