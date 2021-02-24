package com.bc.cart.model.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.cart.model.dao.CartDAO;

public class CartChkCommand implements CartCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("id");
		String productno = request.getParameter("productno");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("productno", productno);
		
		String cartid = CartDAO.selectCartItem(map);
		String result = "{\"result\":\"false\"}";
		
		if(cartid != null) {
			result = "{\"result\":\"true\"}";
		}
		
		PrintWriter out = response.getWriter();
		
		out.print(result);
		
		return null;
	}
	
}
