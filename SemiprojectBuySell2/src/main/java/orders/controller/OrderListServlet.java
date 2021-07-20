package orders.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import orders.model.service.OrdersService;
import orders.model.vo.Orders;

/**
 * Servlet implementation class OrderListServlet
 */
@WebServlet("/orderlist")
public class OrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 페이지별로 출력되는 주문 상품 조회용 컨트롤러
		
				// 출력할 페이지 지정
				int currentPage = 1;
				
				// 전송 온 페이지 값이 있다면 추출
				if(request.getParameter("page") != null) {
					currentPage = Integer.parseInt(request.getParameter("page"));
				}
				
				// 한 페이지당 출력할 갯수 설정
				int pageLimit = 10;
				
				// 총 페이지 수 계산을 위한 목록 조회
				OrdersService oservice = new OrdersService();
				int orderListCount = oservice.getOrdersListCount();
				
				// 요청한 페이지의 행번호 계산
				int startRow = (currentPage - 1) * pageLimit + 1;
				int endRow = startRow + pageLimit - 1;
				
				// 서비스로 해당 페이지에 출력할 제품들만 조회
				ArrayList<Orders> list = oservice.selectOrdersList(startRow, endRow);
				
				// 출력할 페이지 관련 숫자 처리
				int maxPage = (int)((double)orderListCount / pageLimit + 0.9);
				
				// 출력할 페이지 그룹의 시작 페이지 지정
				int startPage = ((int)((double)currentPage / pageLimit + 0.9) - 1) * pageLimit + 1;
				int endPage = startPage + pageLimit - 1;
				
				// 총 페이지수와 마지막 페이지 조정
				if(maxPage < endPage) {
					endPage = maxPage;
				}
				
				// 화면에 출력
				RequestDispatcher view = null;
				if(list.size() > 0) {
					view = request.getRequestDispatcher("나중에 주문 목록 보기 jsp 파일의 상대경로를 작성해주세요.");
					request.setAttribute("list", list);
					request.setAttribute("currentPage", currentPage);
					request.setAttribute("maxPage", maxPage);
					request.setAttribute("startPage", startPage);
					request.setAttribute("endPage", endPage);
					request.setAttribute("regListCount", orderListCount);
				} else {
					view = request.getRequestDispatcher("나중에 에러 페이지 jsp 파일의 상대경로를 작성해주세요.");
					request.setAttribute("message", currentPage + " 페이지에 대한 목록 조회 실패");
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
