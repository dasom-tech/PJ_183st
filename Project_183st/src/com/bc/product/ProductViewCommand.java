package com.bc.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.product.ProductDAO;
import com.bc.product.ProductVO;
import com.bc.review.model.dao.ReviewDAO;
import com.bc.review.vo.ReviewListVO;

public class ProductViewCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(">>> ProductViewCommand.execute() 실행~~");
		//1. DB연결하고 데이터 가져오기
		String productno = request.getParameter("productno");
		ProductVO productInfo = ProductDAO.selectProductInfo(productno);
		
		//리뷰 값 가져오기
		List<ReviewListVO> reviewVO = ReviewDAO.getRivewList(productno);
		System.out.println("reviewVO : " + reviewVO);
		
		//2. 응답페이지(list.jsp)에 데이터 전달(request 객체에 속성값으로 전달)
		request.setAttribute("info", productInfo);
		request.setAttribute("reviewVO", reviewVO);
		
		return "productDetailView.jsp";
	}
	

}
