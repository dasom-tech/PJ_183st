package com.bc.cart.model.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.cart.model.dao.CartDAO;

public class InsertItemCommand implements CartCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String productno = request.getParameter("productno");
		String amount = request.getParameter("amount");
		System.out.println("처리 건 수 : " + productno +"amount: "+ amount);
		Map<String, String> map = new HashMap<String, String>();
		map.put("productno", productno);
		map.put("id", id);
		map.put("c_amount", amount);
		
		int result = CartDAO.insertItem(map);
		System.out.println("처리 건 수 : " + result);
		
		if(id == null || "".equals(id)) {
			return "Member/login.jsp";
		} else {
			return "addCartAlert.jsp";
		}
	}
}
