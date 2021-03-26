package ticket.service;

import java.util.List;
import java.util.Map;

public interface AdminMemService {
	
	List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception;

	void updateMemberBan(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectBanList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectMemberSearchList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectBanSearchList(Map<String, Object> map) throws Exception;
}
