package ticket.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ticket.dao.ShowDetailDAO;

@Service("showDetailService")
public class ShowDetailServiceImpl implements ShowDetailService {
	
	@Resource(name="showDetailDAO")
	private ShowDetailDAO showDetailDAO;

	@Override
	public List<Map<String, Object>> selectShow(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return showDetailDAO.selectShow(map);
	}

	@Override
	public List<Map<String, Object>> split(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		List<Map<String, Object>> splitList = new ArrayList<Map<String, Object>>();
		
		List<Map<String, Object>> list= showDetailDAO.selectShow(map);
		if(list.get(0).get("SHOW_OPTION1") != null) {
			String option1 = (String)list.get(0).get("SHOW_OPTION1");
			String option2 = (String)list.get(0).get("SHOW_OPTION2");
			String[] options1 = option1.split(",");
			String[] options2 = option2.split(",");
			for(int i=0; i<options1.length; i++) {
				Map<String,Object> splitMap = new HashMap<String, Object>();
				splitMap.put("SHOW_OPTION1", options1[i]);
				splitMap.put("SHOW_OPTION2", options2[i]);
				splitList.add(splitMap);
			}
		}else {
			
		}
		return splitList;
	}

	@Override
	public List<Map<String, Object>> selectReviewList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
		return showDetailDAO.selectReviewList(map);
	}

	@Override
	public void insertReview(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		showDetailDAO.insertReview(map);
	}

	@Override
	public Map<String, Object> selectReview(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return showDetailDAO.selectReview(map);
	}

	@Override
	public Map<String, Object> checkRes(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return showDetailDAO.checkRes(map);
	}

	@Override
	public void deleteReview(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		showDetailDAO.deleteReview(map);
	}

	@Override
	public void updateStack(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		showDetailDAO.updateStack(map);
	}

	@Override
	public List<Map<String, Object>> checkLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)showDetailDAO.checkLike(map);
	}

	@Override
	public void insertLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		showDetailDAO.insertLike(map);
	}

	@Override
	public void deleteLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		showDetailDAO.deleteLike(map);
	}
	
	@Override
	public Map<String, Object> selectStack(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return showDetailDAO.selectStack(map);
	}

}
