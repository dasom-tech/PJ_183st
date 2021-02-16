package com.bc.cart.model.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.cart.model.dao.CartDAO;

public class ChangeAmountCommand implements CartCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String cartid = request.getParameter("cid");
		String amount = request.getParameter("amount");
		
		boolean isOvered = CartDAO.chkStock(cartid, Integer.parseInt(amount));
		
		if(isOvered == false) {
			return "Cart/amountError.jsp";
		}
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("cartid", cartid);
		map.put("amount", amount);
		
		int result = CartDAO.changeAmount(map);
		System.out.println("처리 건 수 : " + result);
		
		session.removeAttribute("UserCart");
		session.removeAttribute("total");
		
		return "CartController?type=cart";
		
		/*
		 * session.setAttribute("total", total); session.setAttribute("UserCart", list);
		 */
		
	}
	
}
