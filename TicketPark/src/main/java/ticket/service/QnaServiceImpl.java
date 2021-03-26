package ticket.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ticket.dao.QnaDAO;

@Service("qnaService")
public class QnaServiceImpl implements QnaService{
	
	@Resource(name="qnaDAO")
	private QnaDAO qnaDAO;

	@Override
	public List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.selectQnaList(map);
	}

	@Override
	public List<Map<String, Object>> selectMyQnaList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.selectMyQnaList(map);
	}
	
	
	@Override
	public void insertQna(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		qnaDAO.insertQna(map);
	}

	@Override
	public Map<String, Object> selectQnaDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.selectQnaDetail(map);
	}

	@Override
	public void updateQna(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		qnaDAO.updateQna(map);
	}

	@Override
	public void deleteQna(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		qnaDAO.deleteQna(map);
	}
	
	@Override
	public List<Map<String, Object>> selectQnaSearchList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.selectQnaSearchList(map);
	}

	@Override
	public void insertReQna(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		qnaDAO.insertReQna(map);
	}

	@Override
	public void updateReMark(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		qnaDAO.updateReMark(map);
	}
	
	
}
