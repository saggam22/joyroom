package co.dev.web.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dev.service.ReviewService;
import co.dev.web.Controller;

public class ReviewDeleteControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/json;charset=utf-8");
		
		int reviewNo = Integer.valueOf(request.getParameter("reviewNo"));

		ReviewService service = new ReviewService();
		
		
		if (service.reviewDelete(reviewNo)) {
			response.getWriter().print("{\"message\" : \"리뷰 삭제가 완료되었습니다.\"}");
		} else {
			response.getWriter().print("{\"message\" : \"정상적으로 처리되지 않았습니다.\"}");
		}

	}

}
