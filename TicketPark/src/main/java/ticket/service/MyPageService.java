package ticket.service;

import java.util.List;
import java.util.Map;

public interface MyPageService {
	
	List<Map<String, Object>> selectNowResList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectPastResList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectMember(Map<String, Object> map) throws Exception;

	void updateMember(Map<String, Object> map) throws Exception;
	
	void deleteMember(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectLikeList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectMyReviewList(Map<String, Object> map) throws Exception;
	
	void updateExpire(Map<String, Object> map) throws Exception;
	
}
