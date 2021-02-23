package com.bc.order.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.order.model.dao.OrderDAO;
import com.bc.order.model.vo.OrderListVO;

public class OrderChkListCommand implements OrderCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		List<OrderListVO> list = OrderDAO.getOrderList(id);
		
		for (OrderListVO vo : list) {
			List<String> pname = OrderDAO.getOrderProductname(vo.getOrderid());
			System.out.println("orderid : " + vo.getOrderid());
			if(pname.size() > 1) {
				vo.setProductname(pname.get(0) + " 외" + (pname.size() - 1));
			} else {
				vo.setProductname(pname.get(0));
			}
		}
		
		// 주문 내역 내용 확인 테스트
		//System.out.println("list : " + list.toString());
		
		request.setAttribute("OrderList", list);
		
		
		return "Order/OrderChkList.jsp";
	}
	
}
