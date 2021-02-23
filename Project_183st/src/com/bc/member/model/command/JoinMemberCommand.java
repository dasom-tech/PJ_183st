package com.bc.member.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.member.model.dao.MemberDao;
import com.bc.member.model.vo.MemberVo;

public class JoinMemberCommand implements MemberCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String addr = request.getParameter("addr");
		String phone = request.getParameter("phone_head") + "-" + request.getParameter("phone_1") + "-" + request.getParameter("phone_2");
		
		MemberVo vo = new MemberVo(id, pwd, name, email, addr, phone, 0);
		MemberDao.joinMember(vo);
		request.setAttribute("member", vo);
		
		return "shop183st.jsp";
	}
	
}
