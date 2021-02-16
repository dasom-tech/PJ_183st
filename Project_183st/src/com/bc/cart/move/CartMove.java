package com.bc.cart.move;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.cart.model.command.CartCommand;
import com.bc.cart.model.dao.CartDAO;
import com.bc.cart.model.vo.CartVO;

public class CartMove implements CartCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		List<CartVO> list = CartDAO.cartList(id);
		//System.out.println(">> list : " + list);
		
		int total = 0;
		
		for (CartVO vo : list) {
			total += Integer.parseInt(vo.getC_amount()) * Integer.parseInt(vo.getPrice());
		}
		
		session.setAttribute("total", total);
		session.setAttribute("UserCart", list);
		
		return "Cart/cart.jsp";
	}
	
}
