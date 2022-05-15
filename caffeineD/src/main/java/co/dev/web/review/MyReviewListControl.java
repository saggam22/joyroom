package co.dev.web.review;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dev.service.CfnService;
import co.dev.vo.ReviewVO;
import co.dev.web.Controller;

public class MyReviewListControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// String user = request.getParameter("id");
		String userId = "wlqls12@naver.com";

		CfnService service = new CfnService();
		List<ReviewVO> list = service.myReviewList(userId);

		request.setAttribute("myReviewList", list);

		request.getRequestDispatcher("view/myReview.jsp").forward(request, response);

	}

}
