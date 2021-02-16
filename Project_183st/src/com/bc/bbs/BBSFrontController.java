package com.bc.bbs;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/bbsController")
public class BBSFrontController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		System.out.println("controller 호출");
		Command command = null;
		if ("bbs".equals(type)) {
			command = new BBSPageCommand();
		} else if ("detail".equals(type)) {
			command = new BBSDetailCommand();
		} else if ("write".equals(type)) {
			command = new BBSWriteCommand();
		} else if ("writeResult".equals(type)) {
			command = new BBSWriteResultCommand();
		} else if ("modify".equals(type)) {
			command = new BBSModifyCommand();
		} else if ("modifyResult".equals(type)) {
			command = new BBSModifyResultCommand();
		} else if ("delete".equals(type)) {
			command = new BBSDeleteCommand();
		} else if ("deleteResult".equals(type)) {
			command = new BBSDeleteResultCommand();
		}
		
		String path = command.execute(request, response);
		request.getRequestDispatcher(path).forward(request, response);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}
