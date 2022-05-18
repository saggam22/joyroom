package co.dev.web.bookmark;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dev.dao.UserDAO;
import co.dev.service.CfnService;
import co.dev.service.UserService;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class BookmarkCheckControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/json;charset=utf-8");
		
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("user");
		
		if(vo == null) {
			return;
		}
		
		String userId = vo.getId();
		int cafeNo = Integer.valueOf(request.getParameter("cafeNo"));
					
		UserService service = new UserDAO();
		boolean check = service.checkBookmark(cafeNo, userId);
	
		request.setAttribute("check", check);
		request.getRequestDispatcher("view/cafe/cafeinfo.jsp").forward(request, response);
	}

}
