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
		
		ReviewDAO.reviewDelete(reviewId);
		
		
		return null;
	}

}
