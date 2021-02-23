package com.bc.bbs.model.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.bbs.model.dao.BBSDAO;
import com.bc.bbs.vo.QnAListVO;

public class BBSModifyResultCommand implements Command {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String bbs_no = request.getParameter("bbs_no");
		
		System.out.println("modify bbs_no : " + bbs_no);
		
		QnAListVO vo = new QnAListVO();
		
		vo.setBbs_no(bbs_no);
		vo.setProductno(request.getParameter("productno"));
		vo.setSubject(request.getParameter("subject"));
		vo.setId(request.getParameter("id"));
		vo.setCategory(request.getParameter("category"));
		vo.setContact(request.getParameter("contant"));
		
		System.out.println("modify vo : " + vo);
		BBSDAO.update(vo);
		
		request.setAttribute("vo", vo);
		request.setAttribute("bbs_no", bbs_no);
		
		return "bbsController?type=detail";
	}
}
