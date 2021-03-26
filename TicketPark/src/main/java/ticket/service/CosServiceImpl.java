package ticket.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ticket.dao.CosDAO;

@Service("cosService")
public class CosServiceImpl implements CosService {
	
	@Resource(name="cosDAO")
	private CosDAO cosDAO;

	@Override
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return cosDAO.selectNoticeList(map);
	}

	@Override
	public Map<String, Object> selectNoticeDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return cosDAO.selectNoticeDetail(map);
	}

	@Override
	public List<Map<String, Object>> selectFaqList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return cosDAO.selectFaqList(map);
	}

	@Override
	public Map<String, Object> selectFaqDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return cosDAO.selectFaqDetail(map);
	}

	@Override
	public void insertNotice(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		cosDAO.insertNotice(map);		
	}

	@Override
	public void updateNotice(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		cosDAO.updateNotice(map);
	}

	@Override
	public void deleteNotice(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		cosDAO.deleteNotice(map);
	}

	@Override
	public void insertFaq(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		cosDAO.insertFaq(map);
	}

	@Override
	public void updateFaq(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		cosDAO.updateFaq(map);
	}

	@Override
	public void deleteFaq(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		cosDAO.deleteFaq(map);
	}

}
