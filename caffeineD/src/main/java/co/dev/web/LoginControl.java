package co.dev.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dev.service.CfnService;
import co.dev.vo.UserVO;

public class LoginControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("id");
		String userPwd = request.getParameter("pwd");
		
		CfnService service = new CfnService();
		boolean whoRU = service.userLogin(userId, userPwd);
				
		HttpSession session = request.getSession();
		String path = "";
		
		if(whoRU) {
			UserVO vo = service.userSelect(userId);
			session.setAttribute("user", vo);
			session.setAttribute("success", "로그인 성공!");
			
			path = "index.jsp";
			
		} else {
			session.setAttribute("error", "잘못된 아이디 혹은 비밀번호를 입력하셨습니다.");
			
			path = "view/user/login.jsp";
		}

		
		response.sendRedirect(path);

	}

}
