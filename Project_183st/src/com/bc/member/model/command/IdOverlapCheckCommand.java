package com.bc.member.model.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.member.model.dao.MemberDao;

public class IdOverlapCheckCommand implements MemberCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		
		String id = request.getParameter("id");
		
		List<String> list = MemberDao.overlapChk();
		
		for (String string : list) {
			System.out.println(string);
		}
		
		PrintWriter out = response.getWriter();
		String result = "{\"result\":\"false\"}";
		
		for (String getId : list) {
			if(getId.equals(id)) {
				result = "{\"result\":\"true\"}";
				break;
			}
		}
		
		out.print(result);
		
		return null;
	}
	
}
