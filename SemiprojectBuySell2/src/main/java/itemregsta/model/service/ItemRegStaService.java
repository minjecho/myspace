package itemregsta.model.service;

import static common.JDBCTemp.*;

import java.sql.Connection;
import java.util.ArrayList;

import itemregsta.model.dao.ItemRegStaDao;
import itemregsta.model.vo.ItemRegSta;

public class ItemRegStaService {
	// DI
	private ItemRegStaDao regdao = new ItemRegStaDao();
	
	// Method
	// 등록된 전체 상품 조회용 메소드
	public ArrayList<ItemRegSta> selectRegList(int startRow, int endRow){
		Connection conn = getConnection();
		ArrayList<ItemRegSta> list = regdao.selectRegList(conn, startRow, endRow);
		close(conn);
		
		return list;
	}

	// 해당 등록 번호의 상품 정보 조회용 메소드

	// 새 상품 등록용 메소드
	public int insertReg(ItemRegSta reg) {
		Connection conn = getConnection();
		int result = regdao.insertReg(conn, reg);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	// 상품 등록 삭제용(판매완료후) 메소드

	// 등록 상품 가격 변경 메소드

	// 등록 상품 사이즈 변경 메소드

	// 등록된 상품 총 갯수 출력용 메소드
	public int getRegListCount() {
		Connection conn = getConnection();
		int regListCount = regdao.getRegListCount(conn);
		close(conn);
		
		return regListCount;
	}
}
