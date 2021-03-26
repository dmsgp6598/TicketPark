package ticket.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AdminShowService {
	
	void insertShow(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	List<Map<String, Object>> selectShowList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectShow(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectResMemberList(Map<String, Object> map) throws Exception;
	
	void deleteShow(Map<String, Object> map) throws Exception;

}
