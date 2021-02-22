package com.bc.order.move;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.member.model.vo.MemberVo;
import com.bc.order.model.command.OrderCommand;
import com.bc.order.model.dao.OrderDAO;
import com.bc.order.model.vo.OrderItemVO;

public class OrderMoveCommand implements OrderCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		MemberVo orderedMember = OrderDAO.orderMemberInfo(id);
		
		String []cartidArr = request.getParameterValues("cartid");
		List<OrderItemVO> list = new ArrayList<OrderItemVO>();
		int total = 0;
		
		for (String cartid : cartidArr) {
			//System.out.println("cartid : " + cartid);
			list.add(OrderDAO.orderInfo(cartid));
		}
		
		for (OrderItemVO vo : list) {
			//System.out.println("orderitem : " + vo.toString());
			total += Integer.parseInt(vo.getPrice()) * Integer.parseInt(vo.getC_amount());
		}
		//System.out.println("주문 합계 금액 : " + total);
		System.out.println("주문한 회원의 정보 : " + orderedMember.toString());
		System.out.println("회원의 포인트 : " + orderedMember.getPoint());
		
		request.setAttribute("orderItems", list);
		request.setAttribute("total", total);
		request.setAttribute("orderedMember", orderedMember);
		
		return "Order/order.jsp";
	}
	
}
