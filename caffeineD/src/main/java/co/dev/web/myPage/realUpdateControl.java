package co.dev.web.myPage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dev.service.MyPageService;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class realUpdateControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/json;charset=UTF-8");

		HttpSession session = request.getSession();
		UserVO vo = new UserVO();
		vo = (UserVO) session.getAttribute("user");
		String id = vo.getId(); // 로그인 사용자 ID
		String pwd = request.getParameter("pwd");
		String nick = request.getParameter("nickname");
		String tel = request.getParameter("tel");
	
		UserVO user = new UserVO();
		user.setId(id);
		user.setPwd(pwd);
		user.setNickname(nick);
		user.setTel(tel);		

		MyPageService service = new MyPageService();
		service.userUpdate(user);
		
		request.setAttribute("myInfo", user);
//		request.getSession().setAttribute("success", "정보 수정이 완료되었습니다.");

		//response.sendRedirect("myPage.do");

		request.getRequestDispatcher("myPage.do").forward(request, response);
	}
}
