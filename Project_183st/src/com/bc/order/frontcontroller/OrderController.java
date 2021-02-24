package com.bc.order.frontcontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.order.model.command.OrderChkListCommand;
import com.bc.order.model.command.OrderCommand;
import com.bc.order.model.command.OrderDetailViewCommand;
import com.bc.order.model.command.OrderOneCommand;
import com.bc.order.model.command.OrderProcCommand;
import com.bc.order.move.OrderMoveCommand;

@WebServlet("/OrderController")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		
		OrderCommand command = null;
		
		switch (type) {
		case "orderMove":
			command = new OrderMoveCommand();
			break;
		case "orderProc":
			command = new OrderProcCommand();
			break;
		case "orderList":
			command = new OrderChkListCommand();
			break;
		case "orderDetail":
			command = new OrderDetailViewCommand();
			break;
		case "orderOne":
			command = new OrderOneCommand();
			break;
		}
		String path = command.execute(request, response);
		request.getRequestDispatcher(path).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
