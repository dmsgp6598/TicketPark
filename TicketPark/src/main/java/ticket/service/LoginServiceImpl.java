package ticket.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ticket.dao.LoginDAO;
import ticket.service.LoginService;

@Service("loginService")
public class LoginServiceImpl implements LoginService{
	
	@Resource(name="loginDAO")
	private LoginDAO loginDAO;

	@Override
	public Map<String, Object> loginCheck(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.selectPw(map);
	}
	
	@Override
	public Map<String, Object> selectId(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.selectId(map);
	}
	
	@Override
	public int findId(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.findId(map);
	}
	
	@Override
	public int findPw(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.findPw(map);
	}

	@Override
	public void updatePw(Map<String,Object> map) throws Exception {
		// TODO Auto-generated method stub
		loginDAO.updatePw(map);
	}
}
