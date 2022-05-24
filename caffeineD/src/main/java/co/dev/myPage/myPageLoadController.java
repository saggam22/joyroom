package co.dev.myPage;

import java.io.IOException;
import java.util.List;

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
		} else {
			System.out.println("로그인유저 : " + vo.getId());

			MyPageService service = new MyPageService();
			List<UserVO> list = service.userList();
			request.setAttribute("list", list);
//			user = service.userOne(vo.getId());

			// session.setAttribute("success", "댓글을 작성했습니다.");
			// response.sendRedirect("index.jsp");

//			request.setAttribute("user", user);
			request.getRequestDispatcher("view/myPage/myPage.tiles").forward(request, response);
		}

	}
}
