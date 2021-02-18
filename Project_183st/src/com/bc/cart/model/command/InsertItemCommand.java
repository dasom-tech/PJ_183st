package com.bc.cart.model.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.cart.model.dao.CartDAO;
import com.bc.product.ProductVO;

public class InsertItemCommand implements CartCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String productno = request.getParameter("productno");
		String amount = request.getParameter("amount");
		System.out.println("처리 건 수 : " + productno +"amount: "+ amount);
		Map<String, String> map = new HashMap<String, String>();
		map.put("productno", productno);
		map.put("id", "dasom");
		map.put("c_amount", amount);
		
		int result = CartDAO.insertItem(map);
		System.out.println("처리 건 수 : " + result);
		
		return "testpage.jsp";
	}
	
}
