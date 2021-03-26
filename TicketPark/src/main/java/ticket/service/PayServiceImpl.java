package ticket.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ticket.dao.PayDAO;

@Service("payService")
public class PayServiceImpl implements PayService{
	
	@Resource(name="payDAO")
	private PayDAO payDAO;

	@Override
	public void insertReservation(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		payDAO.insertReservation(map);
	}

	@Override
	public void updateSeat(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		payDAO.updateSeat(map);
	}

	@Override
	public void updateRank(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		payDAO.updateRank(map);
	}
	
}