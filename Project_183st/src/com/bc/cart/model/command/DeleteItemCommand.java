package com.bc.cart.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.cart.model.dao.CartDAO;

public class DeleteItemCommand implements CartCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cartid = request.getParameter("cid");
		
		int result = CartDAO.deleteItem(cartid);
		System.out.println("처리 건 수 : " + result);
		
		return "CartController?type=cart";
	}
	
}
