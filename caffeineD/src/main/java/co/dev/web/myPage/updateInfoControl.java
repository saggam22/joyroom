package co.dev.web.myPage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dev.dao.UserDAO;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class updateInfoControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String user_pwd = request.getParameter("user_pwd");
		String user_nickname = request.getParameter("user_nickname");
		String user_tel = request.getParameter("user_tel");
		
		UserVO service = new UserVO();
		service.setPwd(user_pwd);
		service.setNickname(user_nickname);
		service.setTel(user_tel);
		UserDAO dao = new UserDAO();
		dao.updateInfo(service);
	
		
		response.sendRedirect("view/myPage/updateInfo.tiles");

		//request.getRequestDispatcher("view/myPage/updateInfo.tiles").forward(request, response);
	}

}

