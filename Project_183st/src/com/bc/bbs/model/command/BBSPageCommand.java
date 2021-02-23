package com.bc.bbs.model.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.bbs.model.dao.BBSDAO;
import com.bc.bbs.vo.QnAListVO;
import com.bc.common.mybatis.Page;

public class BBSPageCommand implements Command {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Page p = new Page();
		
		//전체 게시물의 수
		p.setTotalRecord(BBSDAO.getTotalCount());
		p.setTotalPage();
		
		//현재 페이지
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
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", p.getBegin());
		map.put("end", p.getEnd());
		
		//DB에서 현제페이지 표시할 게시글 조회
		List<QnAListVO> list = BBSDAO.getList(map);
		
		request.setAttribute("list", list);
		request.setAttribute("page", p); //페이지 정보를 담고 있는 VO
		request.setAttribute("cPage", cPage);
		
		return "bbs/bbs.jsp";
	}
}
