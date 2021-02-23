package com.bc.review.frontcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.bbs.model.command.BBSDeleteResultCommand;
import com.bc.bbs.model.command.BBSDetailCommand;
import com.bc.bbs.model.command.BBSModifyCommand;
import com.bc.bbs.model.command.BBSModifyResultCommand;
import com.bc.bbs.model.command.BBSPageCommand;
import com.bc.bbs.model.command.BBSWriteCommand;
import com.bc.bbs.model.command.BBSWriteResultCommand;
import com.bc.bbs.model.command.Command;
import com.bc.review.model.command.DeleteReivewCommand;
import com.bc.review.model.command.InsertReviewCommand;

@WebServlet("/reviewController")
public class ReviewFrontController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		System.out.println("controller 호출");
		Command command = null;
		if ("insertReview".equals(type)) {
			command = new InsertReviewCommand();
		} else if ("delReview".equals(type)) {
			command = new DeleteReivewCommand();
		} 
		
		String path = command.execute(request, response);
		response.sendRedirect(path);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost() 실행");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}
