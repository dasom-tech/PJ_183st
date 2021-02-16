package com.bc.bbs;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.bbs.vo.QnAListVO;

public class WriteCommand implements Command {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		QnAListVO vo = new QnAListVO();
		request.getParameter("subject");
		request.getParameter("category");
		request.getParameter("id");
		request.getParameter("content");
		
		
		int result = -1;
		
		if (result == -1) {
			return "write.jsp";
			
		} else if(result >= 1) {
			if(vo != null) {
				result = BBSDAO.insert(vo);
			}
			
		}
		
		return "bbs.jsp";
	}
}
