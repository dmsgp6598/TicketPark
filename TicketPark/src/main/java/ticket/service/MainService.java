package ticket.service;

import java.util.List;
import java.util.Map;

public interface MainService {
	
	List<Map<String, Object>> selectBest(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectGenre(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectNewShowList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectHotShowList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectSearchList(Map<String, Object> map) throws Exception;

}
