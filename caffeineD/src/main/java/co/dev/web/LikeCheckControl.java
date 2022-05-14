package co.dev.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dev.service.CfnService;

public class LikeCheckControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		response.setContentType("text/json;charset=utf-8");
		
		//String id = request.getParameter("id");
		String user = "wlqls12@naver.com";
		int reviewNo = Integer.valueOf(request.getParameter("reviewNo"));
				
		CfnService service = new CfnService();
		boolean likeCheck = service.likeInfoSelect(user, reviewNo);
		
		if (likeCheck) {
			response.getWriter().print("{\"likeCheck\" : \"true\"}");
		} else {
			response.getWriter().print("{\"likeCheck\" : \"false\"}");
		}

	}

}
