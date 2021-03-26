package ticket.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ticket.common.AbstractDAO;

@Repository("cosDAO")
public class CosDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("ticket_query.selectNoticeList", map);
	}
	
	public void insertNotice(Map<String, Object> map) throws Exception{
		insert("ticket_query.insertNotice", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectNoticeDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("ticket_query.selectNoticeDetail", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFaqList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("ticket_query.selectFaqList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectFaqDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("ticket_query.selectFaqDetail", map);
	}
	
	public void updateNotice(Map<String, Object> map) throws Exception{
		update("ticket_query.updateNotice", map);
	}
	
	public void deleteNotice(Map<String, Object> map) throws Exception{
		delete("ticket_query.deleteNotice", map);
	}
	
	public void insertFaq(Map<String, Object> map) throws Exception{
		insert("ticket_query.insertFaq", map);
	}
	
	public void updateFaq(Map<String, Object> map) throws Exception{
		update("ticket_query.updateFaq", map);
	}
	
	public void deleteFaq(Map<String, Object> map) throws Exception{
		delete("ticket_query.deleteFaq", map);
	}

}
