package ticket.service;

import java.util.Map;

public interface LoginService {

	public Map<String, Object> loginCheck(Map<String, Object> map) throws Exception;

	public Map<String, Object> selectId(Map<String, Object> map) throws Exception;

	public int findId(Map<String, Object> map) throws Exception;
	
	public int findPw(Map<String, Object> map) throws Exception;

	public void updatePw(Map<String,Object> map) throws Exception;

}
