package com.bc.bbs.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.bbs.model.dao.BBSDAO;
import com.bc.bbs.vo.QnAListVO;

public class BBSDetailCommand implements Command {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String bbs_no = request.getParameter("bbs_no");
		String cPage = request.getParameter("cPage");
		
		QnAListVO vo = BBSDAO.selectOne(bbs_no);
		System.out.println("detail vo : " + vo);
		
		request.setAttribute("bbs_no", bbs_no);
		request.setAttribute("vo", vo);
		request.setAttribute("cPage", cPage);
		System.out.println("cPage : " + cPage);
		
		return "bbs/detail.jsp";
	}

}
