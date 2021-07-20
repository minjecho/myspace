package orders.model.service;

import static common.JDBCTemp.*;

import java.sql.Connection;
import java.util.ArrayList;

import orders.model.vo.Orders;
import orders.model.dao.OrdersDao;

public class OrdersService {
	// DI
	private OrdersDao odao = new OrdersDao();
	
	// Method
	// 해당 주문 번호의 정보 출력용 메소드
	public ArrayList<Orders> selectOrdersList(int startRow, int endRow){
		Connection conn = getConnection();
		ArrayList<Orders> list = odao.selectOrdersList(conn, startRow, endRow);
		close(conn);
		
		return list;
	}
	
	// 새 주문용 메소드
	
	// 주문 취소용 메소드
	
	// 배송현황 갱신용 메소드
	
	// 배송지 변경용 메소드
	
	// 전체 주문목록 갯수 출력용 메소드
	public int getOrdersListCount() {
		Connection conn = getConnection();
		int ordersListCount = odao.getOrdersListCount(conn);
		close(conn);
		
		return ordersListCount;
	}
}
