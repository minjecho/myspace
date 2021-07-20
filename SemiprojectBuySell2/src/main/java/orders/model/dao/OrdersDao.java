package orders.model.dao;

import static common.JDBCTemp.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import orders.model.vo.Orders;

public class OrdersDao {
	// 전체 주문 목록 조회용 메소드
	// 페이징 처리 적용(1페이지 당 10개의 주문만)
		public ArrayList<Orders> selectOrdersList(Connection conn, int startRow, int endRow){
			ArrayList<Orders> list = new ArrayList<Orders>();
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			String query = "select * from * ("
						 + "select rownum rnum, orders_no, user_no, item_no, user_id, pur_date, count, "
						 + "progress, price, address, shoes_size, phone, del_fee, payment "
						 + "from ("
						 + "select * from orders order by orders_no desc)) "
						 + "where rnum >= ? and rnum <= ?";
			
			try {
				ps = conn.prepareStatement(query);
				ps.setInt(1, startRow);
				ps.setInt(2, endRow);
				
				rs = ps.executeQuery();
				
				while(rs.next()) {
					Orders orders = new Orders();
					
					orders.setOrdersNo(rs.getInt("orderno"));
					orders.setUserNo(rs.getInt("userno"));
					orders.setItemNo(rs.getInt("itemno"));
					orders.setUserID(rs.getString("userid"));
					orders.setPurDate(rs.getDate("purdate"));
					orders.setCount(rs.getInt("count"));
					orders.setProgress(rs.getString("progress"));
					orders.setPrice(rs.getInt("price"));
					orders.setAddress(rs.getString("address"));
					orders.setSize(rs.getInt("size"));
					orders.setPhone(rs.getString("phone"));
					orders.setDelFee(rs.getInt("delfee"));
					orders.setPayment(rs.getString("payment"));
					
					list.add(orders);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(ps);
			}
			
			return list;
		}
	
	// 해당 주문 번호의 정보 출력용 메소드
	
	// 새 주문용 메소드
	
	// 주문 취소용 메소드
	
	// 배송현황 갱신용 메소드
	
	// 배송지 변경용 메소드
	
	// 전체 주문목록 갯수 출력용 메소드
	public int getOrdersListCount(Connection conn) {
		int ordersListCount = 0;
		Statement stm = null;
		ResultSet rs = null;
		
		String query = "select count(*) from orders";
		
		try {
			stm = conn.createStatement();
			rs = stm.executeQuery(query);
			
			if(rs.next()) {
				ordersListCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stm);
		}
		
		return ordersListCount;
	}
}
