package ticket.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import ticket.common.AbstractDAO;

@Repository("payDAO")
public class PayDAO extends AbstractDAO{
	
	public void insertReservation(Map<String, Object> map) throws Exception{
		insert("ticket_query.insertReservation", map);
	}
	
	public void updateSeat(Map<String, Object> map) throws Exception{
		update("ticket_query.updateSeat", map);
	}
	
	public void updateRank(Map<String, Object> map) throws Exception{
		update("ticket_query.updateRank", map);
	}

}
