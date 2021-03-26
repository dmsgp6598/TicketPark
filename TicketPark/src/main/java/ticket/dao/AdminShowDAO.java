package ticket.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ticket.common.AbstractDAO;

@Repository("adminShowDAO")
public class AdminShowDAO extends AbstractDAO{
	
	public void insertShow(Map<String, Object> map) throws Exception{
		insert("ticket_query.insertShow", map);
	}
	
	public void insertShowDate(Map<String, Object> map) throws Exception{
		insert("ticket_query.insertShowDate", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectShowList(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectPagingList("ticket_query.selectShowList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectShow(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("ticket_query.selectShow", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectResMemberList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("ticket_query.selectResMemberList", map);
	}
	
	public void deleteShow(Map<String, Object> map) throws Exception{
		update("ticket_query.deleteShow", map);
	}

}
