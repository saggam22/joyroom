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
		
		CfnService service = new CfnService();
		
		String job = request.getParameter("job");
		int reviewNo = Integer.valueOf(request.getParameter("reviewNo"));
		int likeCount = 0;
		
		if (job.equals("like")) {
			likeCount = service.likeCountPlus(reviewNo); // 리뷰 테이블에 like 수 추가
			
		} else if (job.equals("unlike")) {
			likeCount = service.likeCountMinus(reviewNo);
		}
		
		request.setAttribute("likeCount", likeCount);
		
//		service.likeInfoInsert(); // 좋아요 테이블에 유저, 리뷰 정보 추가
		
		


	}

}
