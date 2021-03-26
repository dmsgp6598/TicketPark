package ticket.service;

import java.util.List;
import java.util.Map;

public interface ShowDetailService {
	
	List<Map<String, Object>> selectShow(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> split(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectReviewList(Map<String, Object> map) throws Exception;
	
	void insertReview(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectReview(Map<String, Object> map) throws Exception;
	
	Map<String, Object> checkRes(Map<String, Object> map) throws Exception;
	
	void deleteReview(Map<String, Object> map) throws Exception;
	
	void updateStack(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> checkLike(Map<String, Object> map) throws Exception;
	
	void insertLike(Map<String, Object> map) throws Exception;
	
	void deleteLike(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectStack(Map<String, Object> map) throws Exception;

}
