package co.dev.web.review;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dev.service.ReviewService;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class ReviewLikeControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/json;charset=utf-8");
		
		ReviewService service = new ReviewService();
		
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("user");
		
		String userId = vo.getId();
		String job = request.getParameter("job");
		int reviewNo = Integer.valueOf(request.getParameter("reviewNo"));

		
		if (job.equals("like")) {
			service.likeCountPlus(reviewNo); 				 // 리뷰 테이블에 like 수 추가
			service.likeInfoInsert(userId, reviewNo); 		 // 좋아요 테이블에 유저, 리뷰 정보 추가
			
		} else if (job.equals("unlike")) {
			service.likeCountMinus(reviewNo);
			service.likeInfoDelete(userId, reviewNo);
		}

	}

}
