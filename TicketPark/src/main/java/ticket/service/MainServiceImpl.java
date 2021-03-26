package ticket.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ticket.dao.MainDAO;

@Service("mainService")
public class MainServiceImpl implements MainService{
	
	@Resource(name="mainDAO")
	private MainDAO mainDAO;

	@Override
	public List<Map<String, Object>> selectBest(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectBest(map);
	}

	@Override
	public List<Map<String, Object>> selectGenre(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectGenre(map);
	}

	@Override
	public List<Map<String, Object>> selectNewShowList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectNewShowList(map);
	}

	@Override
	public List<Map<String, Object>> selectHotShowList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectHotShowList(map);
	}

	@Override
	public List<Map<String, Object>> selectSearchList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectSearchList(map);
	}
}
