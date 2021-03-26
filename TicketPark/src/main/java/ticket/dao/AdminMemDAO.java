package ticket.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ticket.common.AbstractDAO;

@Repository("adminmemDAO")
public class AdminMemDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("ticket_query.selectMemberList", map);
	}
	
	public void updateMemberBan(Map<String, Object> map) throws Exception{
		update("ticket_query.updateMemberBan", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBanList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("ticket_query.selectBanList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMemberSearchList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("ticket_query.selectMemberSearchList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBanSearchList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("ticket_query.selectBanSearchList", map);
	}
}
