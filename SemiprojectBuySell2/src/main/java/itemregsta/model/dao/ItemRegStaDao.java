package itemregsta.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import itemregsta.model.vo.ItemRegSta;
import static common.JDBCTemp.close;

public class ItemRegStaDao {
	// Method
	// 등록된 전체 상품 조회용 메소드
	// 페이징 처리 적용(1페이지 당 10개의 제품만)
	public ArrayList<ItemRegSta> selectRegList(Connection conn, int startRow, int endRow){
		ArrayList<ItemRegSta> list = new ArrayList<ItemRegSta>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String query = "select * from * ("
					 + "select rownum rnum, item_reg_sta_no, user_no, user_id, item_no, shoes_size, reg_date, price, address "
					 + "from ("
					 + "select * from item_reg_sta order by item_reg_sta_no desc)) "
					 + "where rnum >= ? and rnum <= ?";
		
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, startRow);
			ps.setInt(2, endRow);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ItemRegSta reg = new ItemRegSta();
				
				reg.setRegNo(rs.getInt("regno"));
				reg.setUserNo(rs.getInt("userno"));
				reg.setUserID(rs.getString("userid"));
				reg.setItemNo(rs.getInt("itemno"));
				reg.setSize(rs.getInt("size"));
				reg.setRegDate(rs.getDate("regdate"));
				reg.setPrice(rs.getInt("price"));
				reg.setAddress(rs.getString("address"));
				
				list.add(reg);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(ps);
		}
		
		return list;
	}

	// 해당 등록 번호의 상품 정보 조회용 메소드
	
	// 새 상품 등록용 메소드
	public int insertReg(Connection conn, ItemRegSta reg) {
		int result = 0;
		PreparedStatement ps = null;
		
		String query = "insert into item_reg_sta value("
						+ "reg_seq.nextval, ?, ?, ?, ?, sysdate, ?, ?)";
		
		try {
			ps = conn.prepareStatement(query);
			
			ps.setInt(1, reg.getUserNo());
			ps.setString(2, reg.getUserID());
			ps.setInt(3, reg.getItemNo());
			ps.setInt(4, reg.getSize());
			ps.setInt(5, reg.getPrice());
			ps.setString(6, reg.getAddress());
			
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(ps);
		}
		
		return result;
	}
	
	// 상품 등록 삭제용(판매완료후) 메소드
	
	// 등록 상품 가격 변경 메소드
	
	// 등록 상품 사이즈 변경 메소드
	
	// 등록된 상품 총 갯수 출력용 메소드
	public int getRegListCount(Connection conn) {
		int regListCount = 0;
		Statement stm = null;
		ResultSet rs = null;
		
		String query = "select count(*) from item_reg_sta";
		
		try {
			stm = conn.createStatement();
			rs = stm.executeQuery(query);
			
			if(rs.next()) {
				regListCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stm);
		}
		
		return regListCount;
	}
}
