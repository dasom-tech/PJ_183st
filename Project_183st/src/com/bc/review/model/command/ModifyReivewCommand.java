package com.bc.review.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.bbs.model.command.Command;
import com.bc.review.model.dao.ReviewDAO;
import com.bc.review.vo.ReviewListVO;

public class ModifyReivewCommand implements Command {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String productno = request.getParameter("productno");
		String reviewId = request.getParameter("reviewId");
		System.out.println("productno : " + productno);
		System.out.println("reviewId : " + reviewId);
		
		ReviewListVO one = ReviewDAO.selectOne(reviewId);
		System.out.println("selectOne vo : " + one);
		
		return "product_controller?viewType=info&productno=" + productno;
	}

}
