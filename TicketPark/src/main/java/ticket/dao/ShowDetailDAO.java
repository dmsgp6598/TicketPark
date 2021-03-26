package ticket.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ticket.common.AbstractDAO;

@Repository("showDetailDAO")
public class ShowDetailDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectShow(Map<String,Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("ticket_query.selectShow", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectReviewList(Map<String,Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("ticket_query.selectReviewList", map);
	}
	
	public void insertReview(Map<String, Object> map ) throws Exception{
		insert("ticket_query.insertReview", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectReview(Map<String,Object> map) throws Exception{
		return (Map<String, Object>)selectOne("ticket_query.selectReview", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> checkRes(Map<String,Object> map) throws Exception{
		return (Map<String, Object>)selectOne("ticket_query.checkRes", map);
	}
	
	public void deleteReview(Map<String, Object> map) throws Exception{
		update("ticket_query.deleteReview", map);
	}
	
	public void updateStack(Map<String, Object> map) throws Exception{
		update("ticket_query.updateStack", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> checkLike(Map<String,Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("ticket_query.checkLike", map);
	}
	
	public void insertLike(Map<String, Object> map) throws Exception{
		insert("ticket_query.insertLike", map);
	}
	
	public void deleteLike(Map<String, Object> map) throws Exception{
		delete("ticket_query.deleteLike", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectStack(Map<String,Object> map) throws Exception{
		return (Map<String, Object>)selectOne("ticket_query.selectStack", map);
	}

}
