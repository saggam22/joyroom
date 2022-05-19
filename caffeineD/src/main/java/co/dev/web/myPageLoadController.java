package co.dev.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dev.dao.UserDAO;
import co.dev.vo.UserVO;

public class myPageLoadController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

//		request.setAttribute("uVO", uVO);
		request.getRequestDispatcher("myPage.jsp").forward(request, response);
	}

}
