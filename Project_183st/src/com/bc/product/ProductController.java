package com.bc.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/product_controller")
public class ProductController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> ProductController.doGet() 실행~~");
		//파라미터 값 확인
		String viewType = request.getParameter("viewType");
		System.out.println("> viewType : "+ viewType);
		//String producttype = request.getParameter("producttype");
		//System.out.println("> producttype : "+ producttype);
		
		//작업 요청에 대한 처리
		Command command = null;
		if ("list".equals(viewType)) {
			command = new ProductListCommand();
		}else if ("info".equals(viewType)) {
			command = new ProductViewCommand();
		}
		String path = command.execute(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> ProductController.doPost() 실행~~");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}
