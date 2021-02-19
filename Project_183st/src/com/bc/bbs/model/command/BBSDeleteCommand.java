package com.bc.bbs.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.bbs.vo.QnAListVO;

public class BBSDeleteCommand implements Command {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String bbs_no = request.getParameter("bbs_no");
		String cPage = request.getParameter("cPage");
		System.out.println("bbs_no : " + bbs_no);
		System.out.println("cPage : " + cPage);
		
		request.setAttribute("bbs_no", bbs_no);
		request.setAttribute("cPage", cPage);

		return "bbs/delete.jsp";
	}

}
