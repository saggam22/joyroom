package co.dev.web.review;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dev.service.ReviewService;
import co.dev.vo.CafeVO;
import co.dev.vo.ReviewVO;
import co.dev.vo.MyReviewVO;
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

		ReviewService service = new ReviewService();

		if (job.equals("review")) {

			CafeVO cvo = (CafeVO) request.getAttribute("cafeinfo");
			String mybookmark = request.getParameter("mybookmark");

			List<ReviewVO> reviewList = service.reviewList(cvo.getNo());

			if(mybookmark != null) {
				request.setAttribute("mybookmark", "true");
			}
			
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

			List<ReviewVO> reviewList = service.myReviewList(userId);
			
			List<MyReviewVO> myList = new ArrayList<>();
			
			
			for (int i=0; i<reviewList.size(); i++) {
				
				
				MyReviewVO myVO = new MyReviewVO();
				
				if (service.likeInfoSelect(userId, reviewList.get(i).getNo())) {
					
					myVO.setLikeCheck("true");
					
				} else {
					
					myVO.setLikeCheck("false");
				}
				
				CafeVO cvo = service.cafeInfo(reviewList.get(i).getCafeNo());
				
				myVO.setUserId(reviewList.get(i).getUserId());
				myVO.setUserImg(reviewList.get(i).getUserImg());
				myVO.setUserNick(reviewList.get(i).getUserNick());
				myVO.setContent(reviewList.get(i).getContent());
				myVO.setDate(reviewList.get(i).getDate());
				myVO.setImg(reviewList.get(i).getImg());
				myVO.setLike(reviewList.get(i).getLike());
				myVO.setNo(reviewList.get(i).getNo());
				myVO.setStar(reviewList.get(i).getStar());
				myVO.setCafeNo(reviewList.get(i).getCafeNo());
				myVO.setCafeName(cvo.getName());
				myVO.setCafeImg(cvo.getImg());
				
				myList.add(myVO);
				
			}
			
			request.setAttribute("myReviewList", myList);
			request.getRequestDispatcher("/view/review/myReview.tiles").forward(request, response);

		}


	}

}
