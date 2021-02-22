package com.bc.order.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.order.model.dao.OrderDAO;
import com.bc.order.model.vo.OrderDetailVO;
import com.bc.order.model.vo.OrderInfoVO;

public class OrderDetailViewCommand implements OrderCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String orderid = request.getParameter("orderid");
		
		List<OrderDetailVO> detailList = OrderDAO.getOrderDetail(orderid);
		
		/* OrderDetail 목록 확인 테스트
		for (OrderDetailVO orderDetailVO : detailList) {
			System.out.println("product : " + orderDetailVO.toString());
		}
		*/
		
		OrderInfoVO info = OrderDAO.getOrderInfo(orderid);
		
		// 주문 정보 확인 테스트
		//System.out.println("info : " + info.toString());
		
		request.setAttribute("OrderDetail", detailList);
		request.setAttribute("OrderInfo", info);
		
		return "Order/orderDetail.jsp";
	}
	
}
