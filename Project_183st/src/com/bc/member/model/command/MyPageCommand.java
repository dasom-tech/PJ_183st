package com.bc.member.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.member.model.dao.MemberDao;

public class MyPageCommand implements MemberCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		int OrderCount = MemberDao.getOrderCount(id);
		int ContactCount = MemberDao.getContactCount(id);
		int MemberPoint = MemberDao.getMemberPoint(id);
		
		request.setAttribute("OrderCount", OrderCount);
		request.setAttribute("ContactCount", ContactCount);
		request.setAttribute("MemberPoint", MemberPoint);
		
		return "Member/mypage.jsp";
	}
	
}
