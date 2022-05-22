package co.dev.myPage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dev.service.MyPageService;
import co.dev.vo.BoardVO;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class myBoardControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserVO vo = new UserVO();
		vo = (UserVO) session.getAttribute("user");
		String user = request.getParameter("user");

		MyPageService service = new MyPageService();

		if (user.equals(vo.getId())) {
			List<BoardVO> list = service.myBoard();
			request.setAttribute("all", list);
		}

		request.getRequestDispatcher("view/myPage/myBoard.tiles").forward(request, response);
	}

}
