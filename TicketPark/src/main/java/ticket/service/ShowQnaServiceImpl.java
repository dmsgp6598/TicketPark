package ticket.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ticket.dao.ShowQnaDAO;

@Service("showqnaService")
public class ShowQnaServiceImpl implements ShowQnaService{
	
	@Resource(name="showqnaDAO")
	private ShowQnaDAO showqnaDAO;

	@Override
	public List<Map<String, Object>> selectShowQnaList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return showqnaDAO.selectShowQnaList(map);
	}

	@Override
	public void insertShowQna(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		showqnaDAO.insertshowQna(map);
	}

	@Override
	public Map<String, Object> selectShowQnaDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return showqnaDAO.selectShowQnaDetail(map);
	}

	@Override
	public void updateShowQna(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		showqnaDAO.updateShowQna(map);
	}

	@Override
	public void deleteShowQna(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		showqnaDAO.deleteshowQna(map);
	}

	@Override
	public void insertReshowQna(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		showqnaDAO.insertReshowQna(map);
	}

	@Override
	public List<Map<String, Object>> selectshowQnaSearchList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return showqnaDAO.selectshowQnaSearchList(map);
	}

}
