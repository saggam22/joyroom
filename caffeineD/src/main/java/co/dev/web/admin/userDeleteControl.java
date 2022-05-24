package co.dev.web.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dev.dao.UserDAO;
import co.dev.service.UserService;
import co.dev.web.Controller;

public class userDeleteControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("id");
		
		UserService service = new UserDAO();
		service.deleteUser(userId);
		
		response.sendRedirect("user.do");
	}

}
