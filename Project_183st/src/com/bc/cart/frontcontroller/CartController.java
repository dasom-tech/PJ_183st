package com.bc.cart.frontcontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.cart.model.command.CartChkCommand;
import com.bc.cart.model.command.CartCommand;
import com.bc.cart.model.command.ChangeAmountCommand;
import com.bc.cart.model.command.DeleteCheckedItems;
import com.bc.cart.model.command.DeleteItemCommand;
import com.bc.cart.model.command.InsertItemCommand;
import com.bc.cart.move.CartMove;

@WebServlet("/CartController")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type = request.getParameter("type");
		System.out.println(">> type : " + type);
		
		CartCommand command = null;
		
		switch (type) {
		case "cart":
			command = new CartMove();
			execute(command.execute(request, response), request, response);
			break;
		case "modAmount":
			command = new ChangeAmountCommand();
			execute(command.execute(request, response), request, response);
			break;
		case "deleteItem":
			command = new DeleteItemCommand();
			execute(command.execute(request, response), request, response);
			break;
		case "insertItem":
			command = new InsertItemCommand();
			execute(command.execute(request, response), request, response);
			break;
		case "deleteChkItems":
			command = new DeleteCheckedItems();
			command.execute(request, response);
			break;
		case "selectCartItem":
			command = new CartChkCommand();
			command.execute(request, response);
			break;
		}
		//String path = command.execute(request, response);
		//request.getRequestDispatcher(path).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
	private void execute(String path, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher(path).forward(request, response);
	}

}
