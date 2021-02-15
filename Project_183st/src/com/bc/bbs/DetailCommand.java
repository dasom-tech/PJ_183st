package com.bc.bbs;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.bbs.vo.QnAListVO;

public class DetailCommand implements Command {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String bbs_no = request.getParameter("bbs_no");
		String cPage = request.getParameter("cPage");
		
		QnAListVO vo = BBSDAO.selectOne(bbs_no);
		
		request.setAttribute("bbs_no", bbs_no);
		request.setAttribute("vo", vo);
		request.setAttribute("cPage", cPage);
		
		System.out.println("bbs_no : " + bbs_no);
		System.out.println("vo : " + vo);
		
		return "detail.jsp";
	}

}
