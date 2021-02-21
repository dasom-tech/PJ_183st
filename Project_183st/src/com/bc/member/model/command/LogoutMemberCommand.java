package com.bc.member.model.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutMemberCommand implements MemberCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.removeAttribute("id");
		session.removeAttribute("pwd");
		session.invalidate();
		
		return "shop183st.jsp";
	}
	
}
