package ticket.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ticket.dao.MyPageDAO;

@Service("mypageService")
public class MyPageServiceImpl implements MyPageService{

	@Resource(name="mypageDAO")
	private MyPageDAO mypageDAO;

	@Override
	public List<Map<String, Object>> selectNowResList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return mypageDAO.selectNowResList(map);
	}

	@Override
	public List<Map<String, Object>> selectPastResList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return mypageDAO.selectPastResList(map);
	}
	
	@Override
	public void updateMember(Map<String, Object> map) throws Exception {
		mypageDAO.updateMember(map);
		
	}

	@Override 
	public Map<String, Object> selectMember(Map<String, Object> map) throws Exception {  
		return mypageDAO.selectMember(map); 
	}
	
	@Override
	public void deleteMember(Map<String, Object> map) throws Exception {
		mypageDAO.deleteMember(map);
		
	}

	@Override
	public List<Map<String, Object>> selectLikeList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return mypageDAO.selectLikeList(map);
	}

	@Override
	public List<Map<String, Object>> selectMyReviewList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return mypageDAO.selectMyReviewList(map);
	}

	@Override
	public void updateExpire(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		mypageDAO.updateExpire(map);
	}
	
	
}
