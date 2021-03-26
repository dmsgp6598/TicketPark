package ticket.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ticket.common.CommandMap;
import ticket.service.CosService;

@Controller
public class CosController {
	
	@Resource(name="cosService")
	private CosService cosService;
	
	@RequestMapping(value="/cos/noticeList")
	public ModelAndView noticeList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/cos/noticeList");
		
		return mv;
	}
	
	@RequestMapping(value="/cos/noticeWriteForm")
	public ModelAndView noticeWriteForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/cos/noticeWriteForm");
		
		return mv;
	}
	
	@RequestMapping(value="/cos/noticeWrite")
	public ModelAndView noticeWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/cos/noticeList");
		cosService.insertNotice(commandMap.getMap());
		return mv;
	}
	
	@RequestMapping(value="/cos/selectNoticeList")
	public ModelAndView selectNoticeList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String,Object>> list = cosService.selectNoticeList(commandMap.getMap());
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}
		return mv;
	}
	
	@RequestMapping(value="/cos/noticeDetail")
	public ModelAndView noticeDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/cos/noticeDetail");
		
		Map<String, Object> map = cosService.selectNoticeDetail(commandMap.getMap());
		mv.addObject("map", map);
		return mv;
	}
	
	@RequestMapping(value="/cos/faqList")
	public ModelAndView faqList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/cos/faqList");
		
		return mv;
	}
	
	@RequestMapping(value="/cos/selectFaqList")
	public ModelAndView selectFaqList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String,Object>> list = cosService.selectFaqList(commandMap.getMap());
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}
		return mv;
	}
	
	@RequestMapping(value="/cos/faqDetail")
	public ModelAndView faqDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/cos/faqDetail");
		
		Map<String, Object> map = cosService.selectFaqDetail(commandMap.getMap());
		mv.addObject("map", map);
		return mv;
	}
	
	@RequestMapping(value="/cos/noticeModifyForm")
	public ModelAndView noticeModifyForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/cos/noticeModifyForm");
		Map<String, Object> map = cosService.selectNoticeDetail(commandMap.getMap());
		mv.addObject("map", map);
		return mv;
	}
	
	@RequestMapping(value="/cos/noticeModify")
	public ModelAndView noticeModify(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/cos/noticeList");
		cosService.updateNotice(commandMap.getMap());
		return mv;
	}
	
	@RequestMapping(value="/cos/noticeDelete")
	public ModelAndView noticeDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/cos/noticeList");
		cosService.deleteNotice(commandMap.getMap());
		return mv;
	}
	
	@RequestMapping(value="/cos/faqWriteForm")
	public ModelAndView faqWriteForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/cos/faqWriteForm");
		
		return mv;
	}
	
	@RequestMapping(value="/cos/faqWrite")
	public ModelAndView faqWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/cos/faqList");
		cosService.insertFaq(commandMap.getMap());
		return mv;
	}
	
	@RequestMapping(value="/cos/faqModifyForm")
	public ModelAndView faqModifyForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/cos/faqModifyForm");
		Map<String, Object> map = cosService.selectFaqDetail(commandMap.getMap());
		mv.addObject("map", map);
		return mv;
	}
	
	@RequestMapping(value="/cos/faqModify")
	public ModelAndView faqModify(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/cos/faqList");
		cosService.updateFaq(commandMap.getMap());
		return mv;
	}
	
	@RequestMapping(value="/cos/faqDelete")
	public ModelAndView faqDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/cos/faqList");
		cosService.deleteFaq(commandMap.getMap());
		return mv;
	}

}
