package com.bc.cart.model.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.cart.model.dao.CartDAO;

public class DeleteCheckedItems implements CartCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//HttpSession session = request.getSession();
		String []cartids = request.getParameterValues("cartid[]");
		int result = 0;
		PrintWriter out = response.getWriter();
		
		for (String cartid : cartids) {
			System.out.println("cartid : " + cartid);
			result = CartDAO.deleteItem("" + cartid);
			System.out.println("삭제 건 수 : " + result);
		}
		
		out.print(result);
		
		return null;
	}
	
}
