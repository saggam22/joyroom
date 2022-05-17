package co.dev.web.bookmark;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dev.dao.UserDAO;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class BookmarkInsertControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cafeNo = Integer.parseInt(request.getParameter("cafeNo"));
		String userId = request.getParameter("userId");
		
		UserDAO service = new UserDAO();
		service.insertBookmark(cafeNo, userId);
		
		request.getRequestDispatcher("result/userInsertOutput.jsp").forward(request, response);

	}

}
