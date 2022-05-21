package co.dev.web.review;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dev.service.ReviewService;
import co.dev.vo.CafeVO;
import co.dev.vo.ReviewVO;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class ReviewListControl implements Controller {

	String job;

	public ReviewListControl(String job) {
		this.job = job;
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");


		if (job.equals("review")) {

			CafeVO cvo = (CafeVO) request.getAttribute("cafeinfo");

			ReviewService service = new ReviewService();
			List<ReviewVO> reviewList = service.reviewList(cvo.getNo());

			if (reviewList != null) {

				request.setAttribute("cafeinfo", cvo);
				request.setAttribute("reviewList", reviewList);
				request.getRequestDispatcher("/view/cafe/cafeInfo.tiles").forward(request, response);
				return;

			} else {

				request.getRequestDispatcher("/view/cafe/cafeInfo.tiles").forward(request, response);
				return;

			}

		} else if (job.equals("myReview")) {

			HttpSession session = request.getSession();
			UserVO vo = (UserVO) session.getAttribute("user");

			String userId = vo.getId();

			ReviewService service = new ReviewService();
			List<ReviewVO> list = service.myReviewList(userId);

			request.setAttribute("myReviewList", list);

			request.getRequestDispatcher("/view/review/myReview.tiles").forward(request, response);

		}


	}

}
