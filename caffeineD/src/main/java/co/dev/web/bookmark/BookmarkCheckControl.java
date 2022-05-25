package co.dev.web.bookmark;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dev.dao.UserDAO;
import co.dev.service.UserService;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class BookmarkCheckControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/json;charset=utf-8");
		
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("user");

		
		if(vo == null) {
			return;
		}
		
		String userId = vo.getId();
		
		int cafeNo = Integer.valueOf(request.getParameter("cafeNo"));
		String dbChange = request.getParameter("change");
					
		UserService service = new UserDAO();
		boolean check = service.checkBookmark(cafeNo, userId);
		
		if (check) {
			response.getWriter().print("{\"bookmarkCheck\" : \"true\"}");
			if(dbChange != null) {				
				service.deleteBookmark(cafeNo, userId);
			}
		} else {
			response.getWriter().print("{\"bookmarkCheck\" : \"false\"}");
			if(dbChange != null) {				
				service.insertBookmark(cafeNo, userId);
			}
		}
	}

}
