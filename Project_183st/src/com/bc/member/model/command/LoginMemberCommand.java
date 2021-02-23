package com.bc.member.model.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.member.model.dao.MemberDao;
import com.bc.member.model.vo.MemberVo;

public class LoginMemberCommand implements MemberCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		
		MemberVo member = MemberDao.loginMember(map);
		
		if(member == null || !pwd.equals(member.getPwd())) {
			return "Member/loginError.jsp";
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("id", member.getId());
		session.setAttribute("pwd", member.getPwd());
		
		// id, pw 확인을 따로 처리하는 경우의 방법
		//int result = MemberDao.loginValidation(map);
		
		/*if(result == -1) {
			request.setAttribute("code", -1);
			return "Member/loginError.jsp";
		}
		else if(result == -2) {
			request.setAttribute("code", -2);
			return "Member/loginError.jsp";
		}
		else if(result == 1) {
			// 로그인 성공 시 사용자 정보를 세션 객체에 저장
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			session.setAttribute("pwd", pwd);
		}*/
		
		return "shop183st.jsp";
	}
	
}
