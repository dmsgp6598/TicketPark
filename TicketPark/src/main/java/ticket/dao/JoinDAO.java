package ticket.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import ticket.common.AbstractDAO;

@Repository("joinDAO")
public class JoinDAO extends AbstractDAO{
	
	public void insertMember(Map<String, Object> map) throws Exception{
		insert("ticket_query.insertMember", map);
	}
	
	public int checkId(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (Integer)selectOne("ticket_query.checkId",map);
	}
	
	public void verifyMember(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		update("ticket_query.updateVerify",map);
	}


}
