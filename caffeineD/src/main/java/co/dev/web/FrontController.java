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

@WebServlet("/FrontController")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Map<String, Controller> map;

	public FrontController() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {


		map = new HashMap<String, Controller>();

		// review
		map.put("/review.do", new ReviewControl());		
		map.put("/reviewInsert.do", new ReviewInsertControl()); // 등록
		map.put("/reviewLike.do", new ReviewLikeControl());		// 리뷰 좋아요
		map.put("/likeCheck.do", new LikeCheckControl());		// 리뷰 좋아요 여부 체크
		map.put("/myReviewList.do", new MyReviewListControl());	// 내 리뷰 조회
		map.put("/reviewSelect.do", new ReviewSelectControl()); // 수정할 리뷰 조회
		map.put("/reviewUpdate.do", new ReviewUpdateControl()); // 내 리뷰 수


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
