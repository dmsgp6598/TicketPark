package ticket.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface JoinService {
	
	void insertMember(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	public int checkId(Map<String, Object> map) throws Exception;

	void verifyMember(Map<String, Object> map) throws Exception;
}
