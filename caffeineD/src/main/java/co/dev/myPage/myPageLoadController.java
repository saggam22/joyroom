package co.dev.myPage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dev.dao.UserDAO;
import co.dev.service.MyPageService;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class myPageLoadController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("user");
		UserVO user = new UserVO();

		if (vo == null) {
			session.setAttribute("error", "로그인이 필요합니다. 로그인 페이지로 이동합니다.");
			response.sendRedirect("view/user/login.jsp");
			return;
		}

		System.out.println("로그인유저 : " + vo.getId());
		MyPageService service = new MyPageService();

		user = service.userOne(vo.getId());
		
		request.setAttribute("user", user);
		request.getRequestDispatcher("myPage.jsp").forward(request, response);
	}

}
