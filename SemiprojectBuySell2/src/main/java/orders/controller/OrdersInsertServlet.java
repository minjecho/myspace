package orders.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import orders.model.service.OrdersService;
import orders.model.vo.Orders;

/**
 * Servlet implementation class OrdersInsertServlet
 */
@WebServlet("/orderinsert")
public class OrdersInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrdersInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 상품 주문 처리용 컨트롤러
		
		// 1. orders 테이블에 저장할 값 추출
		Orders orders = new Orders();
		
		orders.setUserNo(Integer.parseInt(request.getParameter("userno")));
		orders.setItemNo(Integer.parseInt(request.getParameter("itemno")));
		orders.setUserID(request.getParameter("userid"));
		orders.setPrice(Integer.parseInt(request.getParameter("price")));
		orders.setAddress(request.getParameter("address") + " " + request.getParameter("detailaddress"));
		orders.setSize(Integer.parseInt(request.getParameter("size")));
		orders.setPhone(request.getParameter("phone"));
		orders.setPayment(request.getParameter("payment"));
		orders.setEtc(request.getParameter("etc"));
		
		// 2. 서비스 메소드로 전달하고 결과받기
		int result = new OrdersService().insertOrders(orders);
		
		// 3. 받은 결과 가지고 성공|실패 페이지 출력
		RequestDispatcher view = null;
		if(result > 0) {
			// 이곳에는 성공 후 주문 완료 페이지가 출력됩니다.
		}else {
			// 에러페이지로 연결
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "주문 실패!");
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
