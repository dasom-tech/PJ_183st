package com.bc.review.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.bbs.model.command.Command;
import com.bc.review.model.dao.ReviewDAO;

public class DeleteReivewCommand implements Command{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String reviewId = request.getParameter("reviewId");
		String productno = request.getParameter("productno");
		System.out.println("reviewId : " + reviewId);
		System.out.println("productno : " + productno);
		
		//아이디가 일치할 경우만 삭제 (미구현)
		
		
		ReviewDAO.reviewDelete(reviewId);
		
		return "product_controller?viewType=info&productno=" + productno;
	}

}
