package co.dev.web.myPage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.dev.dao.UserDAO;
import co.dev.service.UserService;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class myPageLoadController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("user");
		
		if (vo == null) {
			session.setAttribute("error", "로그인이 필요합니다. 로그인 페이지로 이동합니다.");
			response.sendRedirect("view/user/login.jsp");
			return;
		} else {
			System.out.println("로그인유저 : " + vo.getId());

			UserService service = new UserDAO();
			UserVO user = service.userOne(vo.getId());
			request.setAttribute("myInfo", user);

			request.getRequestDispatcher("view/myPage/myPage.tiles").forward(request, response);
		}

	}
}
