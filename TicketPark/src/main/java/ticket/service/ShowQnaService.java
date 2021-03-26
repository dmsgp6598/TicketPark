package ticket.service;

import java.util.List;
import java.util.Map;

public interface ShowQnaService {
	List<Map<String, Object>> selectShowQnaList(Map<String, Object> map) throws Exception;
	
	void insertShowQna(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectShowQnaDetail(Map<String,Object> map) throws Exception;
	
	void updateShowQna(Map<String, Object> map) throws Exception;
	
	void deleteShowQna(Map<String, Object> map) throws Exception;
	
	void insertReshowQna(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectshowQnaSearchList(Map<String, Object> map) throws Exception;
}
