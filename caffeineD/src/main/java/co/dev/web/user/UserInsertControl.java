package co.dev.web.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dev.dao.UserDAO;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

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

		request.getSession().setAttribute("userInsert", "회원가입이 완료되었습니다. 로그인해주세요");
		response.sendRedirect("view/user/login.tiles");

	}

}
