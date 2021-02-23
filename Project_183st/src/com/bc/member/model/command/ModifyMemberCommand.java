package com.bc.member.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.member.model.dao.MemberDao;
import com.bc.member.model.vo.MemberVo;

public class ModifyMemberCommand implements MemberCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String addr = request.getParameter("addr");
		String phone = request.getParameter("phone");
		
		if(pwd == null || "".equals(pwd)) {
			pwd = (String)session.getAttribute("pwd");
		} else {
			session.setAttribute("pwd", pwd);
		}
		
		MemberVo vo = new MemberVo(id, pwd, name, email, addr, phone, 0);
		
		int result = MemberDao.modMember(vo);
		System.out.println(">> result : " + result);
		
		return "shop183st.jsp";
	}
	
}
