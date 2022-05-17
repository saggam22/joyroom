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

import co.dev.web.bookmark.BookmarkDelteControl;
import co.dev.web.bookmark.BookmarkInsertControl;
import co.dev.web.bookmark.BookmarkSelectControl;
import co.dev.web.cafeinfo.ApiDataInsertControl;
import co.dev.web.cafeinfo.CafeInfoDelteControl;
import co.dev.web.cafeinfo.CafeInfoInsertControl;
import co.dev.web.cafeinfo.CafeInfoSelectControl;
import co.dev.web.cafeinfo.CafeInfoUpdateControl;
import co.dev.web.cafeinfo.CafeListControl;
import co.dev.web.review.BoardContentsControl;
import co.dev.web.review.BoardInsertControl;
import co.dev.web.review.BoardLoadControl;
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

    // board
		map.put("/cafeList.do", new CafeListControl());	
		map.put("/board.do", new BoardLoadControl());
		map.put("/boardWrite.do", new BoardInsertControl());
		map.put("/boardContents.do", new BoardContentsControl());		

		// login
		map.put("/login.do", new LoginControl());
		map.put("/logout.do", new LogoutControl());
    map.put("/userInsert.do", new UserInsertControl()); //유저 회원가입

		// review	
		map.put("/reviewInsert.do", new ReviewInsertControl()); // 등록
		map.put("/reviewLike.do", new ReviewLikeControl());		// 리뷰 좋아요
		map.put("/likeCheck.do", new LikeCheckControl());		// 리뷰 좋아요 여부 체크
		map.put("/reviewSelect.do", new ReviewSelectControl()); // 수정할 리뷰 조회
		map.put("/reviewUpdate.do", new ReviewUpdateControl()); // 내 리뷰 수
		map.put("/reviewDelete.do", new ReviewDeleteControl());	// 리뷰 삭제
		map.put("/review.do", new ReviewListControl("review"));			// 리뷰 리스트
		map.put("/myReview.do", new ReviewListControl("myReview"));		// 내 리뷰 리스트
		map.put("/reviewSelect.do", new ReviewSelectControl()); 		// 수정할 리뷰 조회
		map.put("/reviewInsert.do", new ReviewInsertControl()); 		// 리뷰 등록
		map.put("/reviewUpdate.do", new ReviewUpdateControl()); 		// 리뷰 수정
		map.put("/reviewDelete.do", new ReviewDeleteControl());			// 리뷰 삭제
		map.put("/reviewLike.do", new ReviewLikeControl());				// 좋아요 +-
		map.put("/likeCheck.do", new LikeCheckControl());	
		
    // cafe
		map.put("/getApiData.do", new ApiDataInsertControl()); //api데이터 저장
		
		map.put("/cafeList.do", new CafeListControl()); //카페 리스트 조회
		map.put("/cafeInfoInsert.do", new CafeInfoInsertControl()); //카페 정보 추가
		map.put("/cafeInfoDelete.do", new CafeInfoDelteControl()); //카페 정보 삭제
		map.put("/cafeInfoUpdate.do", new CafeInfoUpdateControl()); //카페 정보 수정
		map.put("/cafeInfoSelect.do", new CafeInfoSelectControl()); //카페 정보 세부 조회
		
    // bookmark
		map.put("/bookmarkInsert.do", new BookmarkInsertControl()); //북마크 추가
		map.put("/bookmarkDelete.do", new BookmarkDelteControl()); //북마크 삭제
		map.put("/bookmarkSelect.do", new BookmarkSelectControl()); //북마크 조회 수정

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
