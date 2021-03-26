package ticket.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ticket.common.AbstractDAO;

@Repository("mypageDAO")
public class MyPageDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNowResList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("ticket_query.selectNowResList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPastResList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("ticket_query.selectPastResList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMember(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("ticket_query.selectMember", map);
	}
	
	public void updateMember(Map<String, Object> map) throws Exception{
		update("ticket_query.updateMember", map);
	}
	
	public void deleteMember(Map<String, Object> map) throws Exception{
		delete("ticket_query.deleteMember", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectLikeList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("ticket_query.selectLikeList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMyReviewList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("ticket_query.selectMyReviewList", map);
	}
	
	public void updateExpire(Map<String, Object> map) throws Exception{
		update("ticket_query.updateExpire", map);
	}
	
	
}
