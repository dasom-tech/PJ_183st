package com.bc.order.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.order.model.dao.OrderDAO;
import com.bc.order.model.vo.OrderInfoVO;

public class OrderProcCommand implements OrderCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String phone = request.getParameter("phone_head") + request.getParameter("phone_1") + request.getParameter("phone_2");
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		int usedPoint = Integer.parseInt(request.getParameter("usedPoint"));
		
		// 결제 총 금액, 사용한 포인트 값 출력 테스트
		//System.out.println("totalPrice : " + totalPrice);
		//System.out.println("userPoint : " + usedPoint);
		
		String []cartid = request.getParameterValues("cartid");
		
		OrderInfoVO orderinfo = new OrderInfoVO();
		orderinfo.setId(id);
		orderinfo.setName(name);
		orderinfo.setAddr(addr);
		orderinfo.setPhone(phone);
		orderinfo.setPoint("" + usedPoint);
		orderinfo.setTotalprice("" + totalPrice);
		
		int result = OrderDAO.insertOrderInfo(orderinfo);
		System.out.println("주문 처리 건수 : " + result);
		
		// OrderDetail에 삽입하기 위한 키 값을 받아옴
		String orderid = null;
		
		
		// 주문정보 출력 테스트
		//System.out.println("orderinfo : " + orderinfo.toString());
		
		// OrderDetail VO 생성 및 삽입 처리
		for (String cid : cartid) {
			//System.out.println("cartid : " + cid);
			
			
		}
		
		return "CartController?type=cart";
	}
	
}
