package co.dev.web.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dev.service.BoardService;
import co.dev.web.Controller;

public class BoardDeleteControl implements Controller {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String board_no = request.getParameter("board_no");
		
		
		


		//response.sendRedirect("boardContents.do");
//		request.setAttribute("user", user);
		//request.getRequestDispatcher("result/deleteBoardOutput.jsp").forward(request, response);
	}

}
