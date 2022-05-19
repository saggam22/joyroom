package co.dev.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dev.dao.UserDAO;
import co.dev.vo.UserVO;

public class UserInsertControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		String nickname = request.getParameter("nick");
		String pwd = request.getParameter("pwd");
		String tel = request.getParameter("tel");

		UserVO vo = new UserVO();
		vo.setId(id);
		vo.setNickname(nickname);
		vo.setPwd(pwd);
		vo.setTel(tel);
		UserDAO service = new UserDAO();
		service.userInsert(vo);

		request.setAttribute("id", id);
		request.getRequestDispatcher("result/userInsertOutput.jsp").forward(request, response);

	}

}
