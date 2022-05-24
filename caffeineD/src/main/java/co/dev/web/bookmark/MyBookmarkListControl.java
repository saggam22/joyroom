package co.dev.web.bookmark;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dev.dao.UserDAO;
import co.dev.service.UserService;
import co.dev.vo.CafeVO;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class MyBookmarkListControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("user");
		
		String userId = vo.getId();
		
		UserService service = new UserDAO();
		List<CafeVO> list = service.myBookmark(userId);
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/view/myPage/myBookmark.tiles").forward(request, response);
		
	}

}
