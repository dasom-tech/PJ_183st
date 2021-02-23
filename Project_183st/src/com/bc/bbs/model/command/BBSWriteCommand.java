package com.bc.bbs.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.bbs.model.dao.BBSDAO;

public class BBSWriteCommand implements Command {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cPage = "1";
		System.out.println("cPage : " + cPage);
		
		List<String> plist = BBSDAO.prono();
		
		request.setAttribute("cPage", cPage);
		request.setAttribute("plist", plist);
		
		return "bbs/write.jsp";
	}
}
