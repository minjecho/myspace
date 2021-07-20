package itemregsta.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import itemregsta.model.service.ItemRegStaService;
import itemregsta.model.vo.ItemRegSta;

/**
 * Servlet implementation class RegInsertServlet
 */
@WebServlet("/reginsert")
public class RegInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 판매 상품 등록 처리용 컨트롤러
		
		// 1. item_reg_sta 테이블에 저장할 값 추출
		ItemRegSta reg = new ItemRegSta();
		
		reg.setUserNo(Integer.parseInt(request.getParameter("userno")));
		reg.setUserID(request.getParameter("userid"));
		reg.setItemNo(Integer.parseInt(request.getParameter("itemno")));
		reg.setSize(Integer.parseInt(request.getParameter("size")));
		reg.setPrice(Integer.parseInt(request.getParameter("price")));
		reg.setAddress(request.getParameter("address"));
		
		// 2. 서비스 메소드로 전달하고 결과받기
		int result = new ItemRegStaService().insertReg(reg);
		
		// 3. 받은 결과 가지고 성공|실패 페이지 출력
		RequestDispatcher view = null;
		if(result > 0) {
			// 이곳에는 성공 후 판매 등록 성공 페이지로 연결하는 코드가 작성됩니다.
		}else {
			// 에러 페이지로 연결
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "새 상품 등록 실패!");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
