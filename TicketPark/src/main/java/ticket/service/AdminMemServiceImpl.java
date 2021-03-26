package ticket.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ticket.dao.AdminMemDAO;

@Service("adminmemService")
public class AdminMemServiceImpl implements AdminMemService{

	@Resource(name="adminmemDAO")
	private AdminMemDAO adminmemDAO;
	
	@Override
	public List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminmemDAO.selectMemberList(map);
	}

	@Override
	public void updateMemberBan(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminmemDAO.updateMemberBan(map);
	}

	@Override
	public List<Map<String, Object>> selectBanList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminmemDAO.selectBanList(map);
	}

	@Override
	public List<Map<String, Object>> selectMemberSearchList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
		return adminmemDAO.selectMemberSearchList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectBanSearchList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
		return adminmemDAO.selectBanSearchList(map);
	}
}
