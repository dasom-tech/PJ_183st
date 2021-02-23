package com.bc.bbs.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BBSWriteCommand implements Command {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cPage = "1";
		System.out.println("cPage : " + cPage);
		
		request.setAttribute("cPage", cPage);
		
		return "bbs/write.jsp";
	}
}
