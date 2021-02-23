package com.bc.review.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.bbs.model.command.Command;
import com.bc.review.model.dao.ReviewDAO;
import com.bc.review.vo.ReviewListVO;

public class InsertReviewCommand implements Command{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("InsertReviewCommand 실행");
		
		String productno = request.getParameter("productno");
		System.out.println("productno : " + productno);
		
		ReviewListVO vo = new ReviewListVO();
		vo.setProductno(productno);
		vo.setId(request.getParameter("id"));
		vo.setReview(request.getParameter("review"));
		
		ReviewDAO.reviewInsert(vo);
		System.out.println("getReviewInsert(vo) : " + vo);
		
		return "product_controller?viewType=info&productno=" + productno;
	}

}
