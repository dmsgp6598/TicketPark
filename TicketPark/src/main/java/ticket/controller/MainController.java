package ticket.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ticket.common.CommandMap;
import ticket.service.MainService;

@Controller
public class MainController {

	@Resource(name = "mainService")
	private MainService mainService;

	@RequestMapping(value = "/main")
	public ModelAndView main(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("main");

		List<Map<String, Object>> best = mainService.selectBest(commandMap.getMap());
		commandMap.put("SHOW_CAT", 0);
		commandMap.put("START", 0);
		commandMap.put("END", 4);
		List<Map<String, Object>> musical = mainService.selectGenre(commandMap.getMap());
		commandMap.remove("SHOW_CAT");
		commandMap.put("SHOW_CAT", 1);
		List<Map<String, Object>> concert = mainService.selectGenre(commandMap.getMap());
		commandMap.remove("SHOW_CAT");
		commandMap.put("SHOW_CAT", 2);
		List<Map<String, Object>> exhibition = mainService.selectGenre(commandMap.getMap());
		commandMap.remove("SHOW_CAT");
		commandMap.put("SHOW_CAT", 3);
		List<Map<String, Object>> festival = mainService.selectGenre(commandMap.getMap());

		mv.addObject("best", best);
		mv.addObject("musical", musical);
		mv.addObject("concert", concert);
		mv.addObject("exhibition", exhibition);
		mv.addObject("festival", festival);

		return mv;
	}

	@RequestMapping(value = "/main/musical_hot")
	public ModelAndView musical_hot(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/main/musical_hot");

		return mv;
	}

	@RequestMapping(value = "/main/selectMusical_hot")
	public ModelAndView selectMusical_hot(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		commandMap.put("SHOW_CAT", 0);
		List<Map<String, Object>> list = mainService.selectHotShowList(commandMap.getMap());
		System.out.println(list);
		System.out.println(list.get(0).get("TOTAL_COUNT"));
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}
	
	@RequestMapping(value = "/main/musical_new")
	public ModelAndView musical_new(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/main/musical_new");

		return mv;
	}

	@RequestMapping(value = "/main/selectMusical_new")
	public ModelAndView selectMusical_new(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		commandMap.put("SHOW_CAT", 0);
		List<Map<String, Object>> list = mainService.selectNewShowList(commandMap.getMap());
		System.out.println(list);
		System.out.println(list.get(0).get("TOTAL_COUNT"));
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}
	
	@RequestMapping(value = "/main/concert_hot")
	public ModelAndView concert_hot(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/main/concert_hot");

		return mv;
	}

	@RequestMapping(value = "/main/selectConcert_hot")
	public ModelAndView selectConcert_hot(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		commandMap.put("SHOW_CAT", 1);
		List<Map<String, Object>> list = mainService.selectHotShowList(commandMap.getMap());
		System.out.println(list);
		System.out.println(list.get(0).get("TOTAL_COUNT"));
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}
	
	@RequestMapping(value = "/main/concert_new")
	public ModelAndView conert_new(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/main/concert_new");

		return mv;
	}

	@RequestMapping(value = "/main/selectConcert_new")
	public ModelAndView selectConcert_new(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		commandMap.put("SHOW_CAT", 1);
		List<Map<String, Object>> list = mainService.selectNewShowList(commandMap.getMap());
		System.out.println(list);
		System.out.println(list.get(0).get("TOTAL_COUNT"));
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}
	
	@RequestMapping(value = "/main/exhibition_hot")
	public ModelAndView exhibition_hot(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/main/exhibition_hot");

		return mv;
	}

	@RequestMapping(value = "/main/selectExhibition_hot")
	public ModelAndView selectExhibition_hot(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		commandMap.put("SHOW_CAT", 2);
		List<Map<String, Object>> list = mainService.selectHotShowList(commandMap.getMap());
		System.out.println(list);
		System.out.println(list.get(0).get("TOTAL_COUNT"));
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}
	
	@RequestMapping(value = "/main/exhibition_new")
	public ModelAndView exhibition_new(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/main/exhibition_new");

		return mv;
	}

	@RequestMapping(value = "/main/selectExhibition_new")
	public ModelAndView selectExhibition_new(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		commandMap.put("SHOW_CAT", 2);
		List<Map<String, Object>> list = mainService.selectNewShowList(commandMap.getMap());
		System.out.println(list);
		System.out.println(list.get(0).get("TOTAL_COUNT"));
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}
	
	@RequestMapping(value = "/main/festival_hot")
	public ModelAndView festival_hot(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/main/festival_hot");

		return mv;
	}

	@RequestMapping(value = "/main/selectFestival_hot")
	public ModelAndView selectFestival_hot(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		commandMap.put("SHOW_CAT", 3);
		List<Map<String, Object>> list = mainService.selectHotShowList(commandMap.getMap());
		System.out.println(list);
		System.out.println(list.get(0).get("TOTAL_COUNT"));
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}
	
	@RequestMapping(value = "/main/festival_new")
	public ModelAndView festival_new(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/main/festival_new");

		return mv;
	}

	@RequestMapping(value = "/main/selectFestival_new")
	public ModelAndView selectFestival_new(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		commandMap.put("SHOW_CAT", 3);
		List<Map<String, Object>> list = mainService.selectNewShowList(commandMap.getMap());
		System.out.println(list);
		System.out.println(list.get(0).get("TOTAL_COUNT"));
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}
	
	@RequestMapping(value = "/main/search")
	public ModelAndView searchList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/main/searchList");
		Map<String, Object> map = commandMap.getMap();
		mv.addObject("map", map);
		return mv;
	}
	
	@RequestMapping(value = "/main/selectSearchList")
	public ModelAndView selectSearchList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		List<Map<String, Object>> list = mainService.selectSearchList(commandMap.getMap());
		mv.addObject("list", list);
		
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}

}
