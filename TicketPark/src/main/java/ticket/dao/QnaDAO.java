package ticket.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ticket.common.AbstractDAO;

@Repository("qnaDAO")
public class QnaDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectQnaList(Map<String,Object> map) throws Exception {
		return (List<Map<String,Object>>)selectPagingList("ticket_query.selectQnaList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectMyQnaList(Map<String,Object> map) throws Exception {
		return (List<Map<String,Object>>)selectPagingList("ticket_query.selectMyQnaList", map);
	}
	
	public void insertQna(Map<String, Object> map) throws Exception{
		insert("ticket_query.insertQna", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectQnaDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("ticket_query.selectQnaDetail", map);
	}
	
	public void updateQna(Map<String, Object> map) throws Exception{
		update("ticket_query.updateQna", map);
	}
	
	public void deleteQna(Map<String, Object> map) throws Exception{
		update("ticket_query.deleteQna", map);
	}
	
	public void insertReQna(Map<String, Object> map) throws Exception {
		insert("ticket_query.insertReQna", map);
	}
	
	public void updateReMark(Map<String, Object> map) throws Exception {
		update("ticket_query.updateReMark", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectQnaSearchList(Map<String,Object> map) throws Exception {
		return (List<Map<String,Object>>)selectPagingList("ticket_query.selectQnaSearchList", map);
	}
	

}
