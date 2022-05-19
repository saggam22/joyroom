package co.dev.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dev.service.MyPageService;
import co.dev.vo.UserVO;

public class updateInfoControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String nick = request.getParameter("nick");
		String tel = request.getParameter("tel");
		
		UserVO user = new UserVO();
		user.setId(id);
		user.setPwd(pwd);
		user.setNickname(nick);
		user.setTel(tel);

		MyPageService service = new MyPageService();
		service.userUpdate(user);

		request.setAttribute("id", id);

		request.getRequestDispatcher("updateOutput.jsp").forward(request, response);
	}

}
