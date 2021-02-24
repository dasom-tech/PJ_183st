package com.bc.order.model.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.cart.model.dao.CartDAO;

public class OrderOneCommand implements OrderCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("id");
		String productno = request.getParameter("productno");
		String c_amount = request.getParameter("c_amount");
		
		// 제품번호, 수량 체크
		//System.out.println("productno = " + productno + ", c_amount = " + c_amount);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("productno", productno);
		map.put("c_amount", c_amount);
		map.put("cartid", "");
		
		int result = CartDAO.insertOneItem(map);
		
		//System.out.println("카트 번호 : " + map.get("cartid"));
		String cartid = map.get("cartid");
		
		return "OrderController?type=orderMove&cartid=" + cartid;
	}
	
}
