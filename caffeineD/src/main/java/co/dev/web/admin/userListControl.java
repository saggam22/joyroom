package co.dev.web.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dev.dao.UserDAO;
import co.dev.service.UserService;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class userListControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		UserService service = new UserDAO();
		List<UserVO> list = service.userList();

		request.setAttribute("list", list);
		request.getRequestDispatcher("view/admin/userList.jsp").forward(request, response);

	}
}
