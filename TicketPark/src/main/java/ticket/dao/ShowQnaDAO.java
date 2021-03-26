package ticket.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ticket.common.AbstractDAO;

@Repository("showqnaDAO")
public class ShowQnaDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectShowQnaList(Map<String,Object> map) throws Exception {
		return (List<Map<String,Object>>)selectPagingList("ticket_query.selectShowQnaList", map);
	}
	
	public void insertshowQna(Map<String, Object> map) throws Exception{
		insert("ticket_query.insertshowQna", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectShowQnaDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("ticket_query.selectShowQna", map);
	}
	
	public void updateShowQna(Map<String, Object> map) throws Exception{
		update("ticket_query.updateshowQna", map);
	}
	
	public void deleteshowQna(Map<String, Object> map) throws Exception{
		delete("ticket_query.deleteshowQna", map);
	}
	
	public void insertReshowQna(Map<String, Object> map) throws Exception{
		insert("ticket_query.insertReshowQna", map);
		update("ticket_query.updateShowQnaConfirm", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectshowQnaSearchList(Map<String,Object> map) throws Exception {
		return (List<Map<String,Object>>)selectPagingList("ticket_query.selectshowQnaSearchList", map);
	}
	
}
