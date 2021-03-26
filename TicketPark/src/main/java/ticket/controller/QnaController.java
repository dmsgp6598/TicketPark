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
import ticket.service.QnaService;

@Controller
public class QnaController {

	@Resource(name="qnaService")
	private QnaService qnaService;
	
	@RequestMapping(value="/mypage/myQnaList")
	public ModelAndView myQnaList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/mypage/myQnaList");
		
		return mv;
	}
	
	@RequestMapping(value = "/mypage/selectMyQnaList")
	public ModelAndView selectMyQnaList(CommandMap commandMap,HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		HttpSession session = request.getSession();
		Map mm = (Map)session.getAttribute("session_MEM_INFO");
		
		commandMap.put("MEM_ID", mm.get("MEM_ID"));
		
		List<Map<String,Object>> myqnaList = qnaService.selectMyQnaList(commandMap.getMap());
		
		mv.addObject("myqna",myqnaList);
		

		if (myqnaList.size() > 0) {
			mv.addObject("TOTAL", myqnaList.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}
		return mv;
	}
	
	@RequestMapping(value="/mypage/qnaWriteForm")
	public ModelAndView qnaWriteForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/mypage/qnaWriteForm");
		
		return mv;
	}
	
	@RequestMapping(value="/mypage/qnaWrite")
	public ModelAndView qnaWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/mypage/myQnaList");
		qnaService.insertQna(commandMap.getMap());
		return mv;
	}
	
	@RequestMapping(value="/mypage/qnaDetail")
	public ModelAndView qnaDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/mypage/qnaDetail");
		
		Map<String, Object> qna = qnaService.selectQnaDetail(commandMap.getMap());
		mv.addObject("qna", qna);
		
		return mv;
	}
	
	@RequestMapping(value="/mypage/qnaModifyForm")
	public ModelAndView qnaModifyForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/mypage/qnaModifyForm");
		Map<String, Object> qna = qnaService.selectQnaDetail(commandMap.getMap());
		mv.addObject("qna", qna);
		
		return mv;
	}
	
	@RequestMapping(value="/mypage/qnaModify")
	public ModelAndView qnaModify(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/mypage/myQnaList");
		qnaService.updateQna(commandMap.getMap());
		return mv;
	}
	
	@RequestMapping(value="/mypage/qnaDelete")
	public ModelAndView qnaDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/mypage/myQnaList");
		qnaService.deleteQna(commandMap.getMap());
		
		return mv;
	}
	
	
	

	
	@RequestMapping(value="/adminMem/qnaList")
	public ModelAndView qnaList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/adminMem/qnaList");
		
		return mv;
	}
	
	@RequestMapping(value = "/adminMem/selectQnaList")
	public ModelAndView selectQnaList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<Map<String,Object>> qnaList = qnaService.selectQnaList(commandMap.getMap());
		mv.addObject("qna",qnaList);

		if (qnaList.size() > 0) {
			mv.addObject("TOTAL", qnaList.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}
		return mv;
	}
	
	@RequestMapping(value="/adminMem/qnaReForm")
	public ModelAndView qnaReForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/adminMem/qnaReForm");
		Map<String, Object> qna = qnaService.selectQnaDetail(commandMap.getMap());
		mv.addObject("qna", qna);
		
		return mv;
	}
	
	@RequestMapping(value="/adminMem/qnaRe")
	public ModelAndView qnaRe(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/adminMem/qnaList");
		qnaService.insertReQna(commandMap.getMap());
		qnaService.updateReMark(commandMap.getMap());
		
		return mv;
	}
	
	@RequestMapping(value="/adminMem/qnaDetail")
	public ModelAndView adminqnaDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/adminMem/qnaDetail");
		
		Map<String, Object> qna = qnaService.selectQnaDetail(commandMap.getMap());
		mv.addObject("qna", qna);
		
		return mv;
	}
	
	@RequestMapping(value="/adminMem/qnaDelete")
	public ModelAndView adminqnaDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/adminMem/qnaList");
		qnaService.deleteQna(commandMap.getMap());
		
		return mv;
	}
	
	@RequestMapping(value="/adminMem/qnaSearchList")
	public ModelAndView qnaSearchList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		if(commandMap.get("column_name").equals("0")) {
			commandMap.put("COLUMN_NAME", "QNA_ID");
		}else if(commandMap.get("column_name").equals("1")) {
			commandMap.put("COLUMN_NAME", "QNA_TITLE");
		}
		List<Map<String,Object>> qnaSearchList = qnaService.selectQnaSearchList(commandMap.getMap());
		mv.addObject("qna", qnaSearchList);
		
		if (qnaSearchList.size() > 0) {
			mv.addObject("TOTAL", qnaSearchList.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}
		return mv;
	}
	
	
}
