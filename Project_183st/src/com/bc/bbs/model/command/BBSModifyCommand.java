package com.bc.bbs.model.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.bbs.model.dao.BBSDAO;
import com.bc.bbs.vo.QnAListVO;

public class BBSModifyCommand implements Command {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String bbs_no = request.getParameter("bbs_no");
		String cPage = request.getParameter("cPage");
		System.out.println("bbs_no : " + bbs_no);
		System.out.println("cPage : " + cPage);
		
		QnAListVO vo = BBSDAO.selectOne(bbs_no);
		
		System.out.println("vo2 : " + vo);
		
//		request.setAttribute("productno", vo.getProductno());
//		request.setAttribute("subject", vo.getSubject());
//		request.setAttribute("id", vo.getId());
//		request.setAttribute("category", vo.getCategory());
//		request.setAttribute("contant", vo.getContact());
		
		request.setAttribute("vo", vo);
		request.setAttribute("bbs_no", bbs_no);
		request.setAttribute("cPage", cPage);
		
		return "bbs/modify.jsp";
	}
	
}
