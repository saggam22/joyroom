package co.dev.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dev.web.review.LikeCheckControl;
import co.dev.web.review.ReviewListControl;
import co.dev.web.review.ReviewDeleteControl;
import co.dev.web.review.ReviewInsertControl;
import co.dev.web.review.ReviewLikeControl;
import co.dev.web.review.ReviewSelectControl;
import co.dev.web.review.ReviewUpdateControl;

@WebServlet("/FrontController")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Map<String, Controller> map;

	public FrontController() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {


		map = new HashMap<String, Controller>();
		
		// login
		map.put("/login.do", new LoginControl());
		map.put("/logout.do", new LogoutControl());

		// review
		map.put("/review.do", new ReviewListControl("review"));			// 리뷰 리스트
		map.put("/myReview.do", new ReviewListControl("myReview"));		// 내 리뷰 리스트
		map.put("/reviewSelect.do", new ReviewSelectControl()); 		// 수정할 리뷰 조회
		map.put("/reviewInsert.do", new ReviewInsertControl()); 		// 리뷰 등록
		map.put("/reviewUpdate.do", new ReviewUpdateControl()); 		// 리뷰 수정
		map.put("/reviewDelete.do", new ReviewDeleteControl());			// 리뷰 삭제
		map.put("/reviewLike.do", new ReviewLikeControl());				// 좋아요 +-
		map.put("/likeCheck.do", new LikeCheckControl());				// 좋아요 조회

	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		String url = request.getRequestURI(); 					
		String context = request.getContextPath();				
		String path = url.substring(context.length());
		System.out.println(path);							

		Controller controller = map.get(path);
		controller.execute(request, response);

	}

}
