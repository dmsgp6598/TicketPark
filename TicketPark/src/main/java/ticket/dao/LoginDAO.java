package ticket.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import ticket.common.AbstractDAO;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectPw(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("ticket_query.selectpw", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectId(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("ticket_query.selectId", map);
	}
	
	public int findId(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)selectOne("ticket_query.findId", map);
	}
	
	public int findPw(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)selectOne("ticket_query.findPw", map);
	}

	public void updatePw(Map<String,Object> map) throws Exception {
		// TODO Auto-generated method stub
		update("ticket_query.updatePw",map);
	}
}
