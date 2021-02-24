package com.bc.product;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.bbs.vo.QnAListVO;
import com.bc.common.mybatis.Page;
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
		
		//리뷰 갯수 가져오기
		int count = ReviewDAO.getTotalCount(productno);
		System.out.println("count : " + count);
		
		//리뷰 값 가져오기
		Page p = new Page();
		
		//전체 게시물의 수
		p.setTotalRecord(count);
		p.setTotalPage();
		
		//현재 페이지
		String cPage = request.getParameter("cPage");
		System.out.println("cPage : " + cPage);
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		
		//현재 페이지에 표시할 시작번호(begin), 끝번호(end)
		//현재 페이지 번호 * 페이지당 표시할 게시글 수
		p.setEnd(p.getNowPage() * p.getPageSize());
		p.setBegin(p.getEnd() - p.getPageSize() + 1);
		
		//끝 글번호가 데이터 수 보다 많은 경우 데이터 수와 일치
		if (p.getEnd() > p.getTotalRecord()) {
			p.setEnd(p.getTotalRecord());
		}
		
		//현재 페이지 번호를 통해 블록의 시작페이지, 끝페이지 구하기
		int newPage = p.getNowPage();
		int beginPage = (newPage - 1) / p.getPageUnit() * p.getPageUnit() + 1;
		p.setBeginPage(beginPage);
		p.setEndPage(p.getBeginPage() + p.getPageUnit() - 1);
		
		//끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
		//끝페이지 값을 전체 페이지 수로 변경
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
		System.out.println("p : " + p);
		//현재 페이지 기준으로 게시글 가져오기
		//시작글번호, 끝글번호 저장용 Map 생성(파라미터 값으로 전달)
		Map<String, Object> map = new HashMap<>();
		map.put("begin", p.getBegin());
		map.put("end", p.getEnd());
		map.put("productno", productno);
		
		//DB에서 현제페이지 표시할 게시글 조회
		List<ReviewListVO> reviewVO = ReviewDAO.reviewList(map);
		System.out.println("reviewVO : " +  reviewVO) ;
		
		//2. 응답페이지(list.jsp)에 데이터 전달(request 객체에 속성값으로 전달)
		request.setAttribute("info", productInfo);
		request.setAttribute("reviewVO", reviewVO);
		request.setAttribute("productno", productno);
		request.setAttribute("page", p);
		request.setAttribute("count", count);
		request.setAttribute("cPage", cPage);
		return "productDetailView.jsp";
	}
	

}
