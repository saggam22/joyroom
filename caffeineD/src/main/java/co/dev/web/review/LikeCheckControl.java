package co.dev.web.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dev.service.ReviewService;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class LikeCheckControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		response.setContentType("text/json;charset=utf-8");
		
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("user");
		
		if(vo == null) {
			return;
		}
		
		String userId = vo.getId();
		int reviewNo = Integer.valueOf(request.getParameter("reviewNo"));
				
		ReviewService service = new ReviewService();
		boolean likeCheck = service.likeInfoSelect(userId, reviewNo);
		
		if (likeCheck) {
			response.getWriter().print("{\"likeCheck\" : \"true\"}");
		} else {
			response.getWriter().print("{\"likeCheck\" : \"false\"}");
		}

	}

}
