package ticket.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component("dateTokenize")
public class DateTokenize {
	
	public List<Map<String,Object>> dateTokenize(Map<String,Object> map) throws Exception{
		String date = (String)map.get("datepick");
		String[] dates = date.split(",");
		System.out.println(map.get("showTime"));
		if(map.get("showTime") instanceof String) {
			String checkStr = (String)map.get("showTime");
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			Map<String, Object> listMap = null;
			
			String showNum = (String)map.get("SHOW_NUM");
			
			for(int i=0; i<dates.length; i++) {
					listMap = new HashMap<String,Object>();
					listMap.put("SHOW_NUM", showNum);
					listMap.put("SHOW_DATE", dates[i]);
					listMap.put("SHOW_TIME", checkStr);
					listMap.put("SHOW_SEAT", map.get("SHOW_SEAT"));
					list.add(listMap);
					
			}
			
			return list;
		}else {
			String[] check = (String[])map.get("showTime");
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			Map<String, Object> listMap = null;
			
			String showNum = (String)map.get("SHOW_NUM");
			
			for(int i=0; i<dates.length; i++) {
				for(int j=0; j<check.length; j++) {
					listMap = new HashMap<String,Object>();
					listMap.put("SHOW_NUM", showNum);
					listMap.put("SHOW_DATE", dates[i]);
					listMap.put("SHOW_TIME", check[j]);
					listMap.put("SHOW_SEAT", map.get("SHOW_SEAT"));
					list.add(listMap);
					
				}
			}
			
			return list;
		}
		
		
		/*
		 * List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		 * Map<String, Object> listMap = null;
		 * 
		 * String showNum = (String)map.get("SHOW_NUM");
		 * 
		 * for(int i=0; i<dates.length; i++) { for(int j=0; j<check.length; j++) {
		 * listMap = new HashMap<String,Object>(); listMap.put("SHOW_NUM", showNum);
		 * listMap.put("SHOW_DATE", dates[i]); listMap.put("SHOW_TIME", check[j]);
		 * listMap.put("SHOW_SEAT", map.get("SHOW_SEAT")); list.add(listMap);
		 * 
		 * } }
		 */
		
		
		
	}

}
