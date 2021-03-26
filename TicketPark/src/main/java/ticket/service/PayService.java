package ticket.service;

import java.util.Map;

public interface PayService {
	
	public void insertReservation(Map<String, Object> map ) throws Exception;
	
	public void updateSeat(Map<String, Object> map) throws Exception;
	
	public void updateRank(Map<String, Object> map) throws Exception;

}
