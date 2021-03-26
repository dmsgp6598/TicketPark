package ticket.service;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import ticket.dao.JoinDAO;

@Service("joinService")
public class JoinServiceImpl implements JoinService{

	
	@Resource(name="joinDAO")
	private JoinDAO joinDAO;

	@Override
	public void insertMember(Map<String, Object> map, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		joinDAO.insertMember(map);
		
	}
	
	@Override
	public int checkId(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return joinDAO.checkId(map);
	}
	
	@Override
	public void verifyMember(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		joinDAO.verifyMember(map);
	}

}
