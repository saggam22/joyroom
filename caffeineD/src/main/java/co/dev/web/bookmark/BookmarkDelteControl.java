package co.dev.web.bookmark;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dev.web.Controller;

public class BookmarkDelteControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cafeNo = request.getParameter("cafeNo");
		String userId = request.getParameter("userId");
		
		
		
	}

}
