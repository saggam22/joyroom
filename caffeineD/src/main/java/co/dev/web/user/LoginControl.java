package co.dev.web.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dev.service.ReviewService;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class LoginControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("id");
		String userPwd = request.getParameter("pwd");
		
		ReviewService service = new ReviewService();
		boolean whoRU = service.userLogin(userId, userPwd);
				
		HttpSession session = request.getSession();
		String path = "";
		
		if(whoRU) {
			UserVO vo = service.userSelect(userId);
			session.setAttribute("user", vo);
			
			path = "index.jsp";
			
		} else {
			session.setAttribute("error", "잘못된 아이디 혹은 비밀번호를 입력하셨습니다.");
			
			path = "view/user/login.jsp";
		}

		
		response.sendRedirect(path);

	}

}
