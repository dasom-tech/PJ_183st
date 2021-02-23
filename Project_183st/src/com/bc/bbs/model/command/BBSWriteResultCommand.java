package com.bc.bbs.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.bbs.model.dao.BBSDAO;
import com.bc.bbs.vo.QnAListVO;

public class BBSWriteResultCommand implements Command {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cPage = request.getParameter("cPage");
		System.out.println("cPage : " + cPage);
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		QnAListVO vo = new QnAListVO();
		vo.setProductno(request.getParameter("productno"));
		vo.setSubject(request.getParameter("subject"));
		vo.setCategory(request.getParameter("category"));
		vo.setId(id);
		vo.setContact(request.getParameter("content"));
		System.out.println("vo : " + vo);
		
		BBSDAO.insert(vo);
		System.out.println("insert vo : " + vo);
		
		String bbs_no = vo.getBbs_no();
		
		request.setAttribute("vo", vo);
		request.setAttribute("bbs_no", bbs_no);
		request.setAttribute("cPage", cPage);
		
		return "bbs/detail.jsp";
	}

}
