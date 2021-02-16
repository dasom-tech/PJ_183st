package com.bc.member.move;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.member.model.command.MemberCommand;
import com.bc.member.model.dao.MemberDao;
import com.bc.member.model.vo.MemberVo;

public class ModifyMoveCommand implements MemberCommand  {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("id");
		String pwd = (String)session.getAttribute("pwd");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		
		MemberVo vo = MemberDao.modifyMember(map);
		
		request.setAttribute("member", vo);
		
		return "Member/modify.jsp";
	}

	
	
}
