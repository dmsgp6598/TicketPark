package ticket.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ticket.common.AbstractDAO;

@Repository("mainDAO")
public class MainDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBest(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("ticket_query.selectBest", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectGenre(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("ticket_query.selectNewShowList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNewShowList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("ticket_query.selectNewShowList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectHotShowList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("ticket_query.selectHotShowList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSearchList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("ticket_query.selectSearchList", map);
	}
}
