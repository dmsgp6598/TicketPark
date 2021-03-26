package ticket.service;

import java.util.List;
import java.util.Map;

public interface CosService {
	
	List<Map<String,Object>> selectNoticeList(Map<String,Object> map) throws Exception;
	
	void insertNotice(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectNoticeDetail(Map<String,Object> map) throws Exception;
	
	List<Map<String,Object>> selectFaqList(Map<String,Object> map) throws Exception;
	
	Map<String, Object> selectFaqDetail(Map<String,Object> map) throws Exception;
	
	void updateNotice(Map<String, Object> map) throws Exception;
	
	void deleteNotice(Map<String, Object> map) throws Exception;
	
	void insertFaq(Map<String, Object> map) throws Exception;
	
	void updateFaq(Map<String, Object> map) throws Exception;
	
	void deleteFaq(Map<String, Object> map) throws Exception;

}
