package ticket.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import ticket.common.DateTokenize;
import ticket.common.FileUtils;
import ticket.dao.AdminShowDAO;

@Service("adminShowService")
public class AdminShowServiceImpl implements AdminShowService {
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource(name="dateTokenize")
	private DateTokenize dateTokenize;
	
	@Resource(name="adminShowDAO")
	private AdminShowDAO adminShowDAO;

	@Override
	public void insertShow(Map<String, Object> map, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);
		map.put("SHOW_IMAGE", list.get(0).get("IMAGE_NAME"));
		map.put("SHOW_DETAIL", list.get(1).get("IMAGE_NAME"));
		adminShowDAO.insertShow(map);
		List<Map<String, Object>> list1 = dateTokenize.dateTokenize(map);
		for(int i=0; i<list1.size(); i++) {
			adminShowDAO.insertShowDate(list1.get(i));
		}
	}

	@Override
	public List<Map<String, Object>> selectShowList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminShowDAO.selectShowList(map);
	}

	@Override
	public List<Map<String, Object>> selectShow(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminShowDAO.selectShow(map);
	}

	@Override
	public List<Map<String, Object>> selectResMemberList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminShowDAO.selectResMemberList(map);
	}

	@Override
	public void deleteShow(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminShowDAO.deleteShow(map);
	}
	
	

}
