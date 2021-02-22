package com.bc.member.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.member.model.dao.MemberDao;

public class DeleteMemberCommand implements MemberCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String pwd = (String)session.getAttribute("pwd");
		System.out.println("pwd : " + pwd);
		String pwdchk = request.getParameter("pwdchk");
		System.out.println("pwdchk : " + pwdchk);
		if(!pwd.equals(pwdchk)) {
			return "Member/leaveFail.jsp";
		}
		
		MemberDao.deleteMember((String)session.getAttribute("id"));
		session.removeAttribute("id");
		session.removeAttribute("pwd");
		
		return "shop183st.jsp";
	}
	
}
