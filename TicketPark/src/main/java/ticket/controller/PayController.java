package ticket.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ticket.common.CommandMap;
import ticket.service.PayService;

@Controller
public class PayController {
	
	@Resource(name="payService")
	private PayService payService;

	@RequestMapping(value="/pay/resForm")
	public ModelAndView resForm(CommandMap commandMap) throws Exception {
	      ModelAndView mv = new ModelAndView("/pay/resForm");
	      ModelAndView mv1 = new ModelAndView("redirect:/showDetail");
	      String[] splitDate = (commandMap.get("date").toString()).split(",");
	      String seat = "기본 좌석";
	      String extraPrice = "0";
	      String[] splitExtraPrice = null;
	      int amount = 1 ;
	      
	      if(commandMap.get("extraPrice") != "") {
	    	 splitExtraPrice = (commandMap.get("extraPrice").toString()).split(",");
	    	 seat = splitExtraPrice[0];
	    	 extraPrice = splitExtraPrice[1];
	         //seat = (commandMap.get("extraPrice").toString()).substring(0, 1);
	         //extraPrice = (commandMap.get("extraPrice").toString()).substring(2);
	      }
	      
	      if(commandMap.get("amount") != "") {
	         amount = Integer.parseInt(commandMap.get("amount").toString());
	      }
	      
	      int price =(Integer.parseInt(extraPrice) + Integer.parseInt(commandMap.get("price").toString()))*amount;
	      
	      int checkSeat = Integer.parseInt(splitDate[2].toString()) - amount;
	      if(checkSeat < 0) {
	    	  mv1.addObject("SHOW_NUM", commandMap.get("SHOW_NUM"));
	    	  mv1.addObject("msg", 2);
	    	  return mv1;
	      }
	      
	      mv.addObject("SHOWDATE_NUM", splitDate[0]);
	      mv.addObject("datetime", splitDate[1]);
	      mv.addObject("SHOW_SEAT", splitDate[2]);
	      mv.addObject("seat", seat);
	      mv.addObject("price", price);
	      mv.addObject("amount", amount);
	      mv.addObject("SHOW_NUM", commandMap.get("SHOW_NUM"));
	      mv.addObject("rank", commandMap.get("rank"));
	      mv.addObject("SHOW_NAME", commandMap.get("SHOW_NAME"));
	      
	      return mv;
	   }
	
	@RequestMapping(value="/pay/result")
	public ModelAndView result(CommandMap commandMap) throws Exception{
		System.out.println(commandMap.getMap());
		ModelAndView mv = new ModelAndView("/pay/result");
		int amount = Integer.parseInt(commandMap.get("RES_AMOUNT").toString());
		int updateseat = Integer.parseInt(commandMap.get("SHOW_SEAT").toString()) - amount;
		int showrank = Integer.parseInt((commandMap.get("rank").toString())) + amount;
		String UPDATE_SEAT = Integer.toString(updateseat);
		commandMap.put("UPDATE_SEAT", UPDATE_SEAT);
		commandMap.put("SHOW_RANK", showrank);
		System.out.println(commandMap.getMap());
		payService.updateSeat(commandMap.getMap());
		payService.updateRank(commandMap.getMap());
		payService.insertReservation(commandMap.getMap());
		Map<String, Object> map = commandMap.getMap();
		mv.addObject("map", map);
		
		return mv;
	}
}
