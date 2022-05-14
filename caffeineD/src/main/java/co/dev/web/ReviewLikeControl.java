package co.dev.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dev.service.CfnService;

public class ReviewLikeControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/json;charset=utf-8");
		
		CfnService service = new CfnService();
		
		String job = request.getParameter("job");
		String user = request.getParameter("id");
		int reviewNo = Integer.valueOf(request.getParameter("reviewNo"));

		
		if (job.equals("like")) {
			service.likeCountPlus(reviewNo); // 리뷰 테이블에 like 수 추가
			service.likeInfoInsert(user, reviewNo); 		 // 좋아요 테이블에 유저, 리뷰 정보 추가
			
		} else if (job.equals("unlike")) {
			service.likeCountMinus(reviewNo);
			service.likeInfoDelete(user, reviewNo);
		}

	}

}
