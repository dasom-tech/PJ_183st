package com.bc.member.frontcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.member.model.command.DeleteMemberCommand;
import com.bc.member.model.command.IdOverlapCheckCommand;
import com.bc.member.model.command.JoinMemberCommand;
import com.bc.member.model.command.LoginMemberCommand;
import com.bc.member.model.command.LogoutMemberCommand;
import com.bc.member.model.command.MemberCommand;
import com.bc.member.model.command.ModifyMemberCommand;
import com.bc.member.model.command.MyPageCommand;
import com.bc.member.move.DeleteMoveCommand;
import com.bc.member.move.JoinMoveCommand;
import com.bc.member.move.LoginMoveCommand;
import com.bc.member.move.ModifyMoveCommand;

@WebServlet("/memberController")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type = request.getParameter("type");
		//System.out.println(">> name : " + request.getParameter("name"));
		System.out.println(type);
		
		MemberCommand command = null;
		
		if("join".equals(type)) {
			command = new JoinMemberCommand();
			execute(command.execute(request, response), request, response);
		}
		else if("idOverlap".equals(type)) {
			command = new IdOverlapCheckCommand();
			command.execute(request, response);
		}
		if("joinMove".equals(type)) {
			command = new JoinMoveCommand();
			execute(command.execute(request, response), request, response);
		}
		else if("login".equals(type)) {
			command = new LoginMemberCommand();
			execute(command.execute(request, response), request, response);
		}
		else if("loginMove".equals(type)) {
			command = new LoginMoveCommand();
			execute(command.execute(request, response), request, response);
		}
		else if("logout".equals(type)) {
			command = new LogoutMemberCommand();
			execute(command.execute(request, response), request, response);
		}
		else if("modifyMove".equals(type)) {
			command = new ModifyMoveCommand();
			execute(command.execute(request, response), request, response);
		}
		else if("modify".equals(type)) {
			command = new ModifyMemberCommand();
			execute(command.execute(request, response), request, response);
		}
		else if("leave".equals(type)) {
			command = new DeleteMemberCommand();
			execute(command.execute(request, response), request, response);
		}
		else if("leaveMove".equals(type)) {
			command = new DeleteMoveCommand();
			execute(command.execute(request, response), request, response);
		}
		else if("myPage".equals(type)) {
			command = new MyPageCommand();
			execute(command.execute(request, response), request, response);
		}
		//String path = command.execute(request, response);
		//request.getRequestDispatcher(path).forward(request, response);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
	private void execute(String path, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher(path).forward(request, response);
	}
}
