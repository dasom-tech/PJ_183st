package com.bc.product;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.common.mybatis.Page;

public class ProductListCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
				Page p = new Page();
				String producttype = request.getParameter("producttype");				
				String image_s = request.getParameter("image_s");
				
				HashMap<String,Object> paramMap = new HashMap<String,Object>();
				if(producttype != null && !"".equals(producttype)) {
					paramMap.put("producttype", producttype);
				}
				
				int productCnt = ProductDAO.getCntProductListByType(paramMap);
				p.setTotalRecord(productCnt);
				p.setPageSize(10);
				p.setTotalPage();
				
				String cPage = request.getParameter("cPage");
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
				
				//현재 페이지 기준으로 게시글 가져오기
				//시작글번호, 끝글번호 저장용 Map 생성(파라미터 값으로 전달)
				paramMap.put("strNum", p.getBegin());
				paramMap.put("endNum", p.getEnd());
				

				System.out.println(">  : "+ p.getBegin()+", "+p.getEnd()+", "+p.getNowPage()+", "+p.getTotalPage()+", "+p.getPageSize());
				
				
				//3. 조회된 데이터를 응답페이지(productList.jsp)에서 사용할 수 있게 저장
				List<ProductVO> list = ProductDAO.getProductListByType(paramMap);
				request.setAttribute("list", list);
				request.setAttribute("producttype", producttype);
				request.setAttribute("image_s", image_s);
				request.setAttribute("totalPage", p.getTotalPage());
				request.setAttribute("cPage", cPage);
				
				return "productList.jsp";
	}

}
