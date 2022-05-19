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

import co.dev.web.review.BoardContentsControl;
import co.dev.web.review.BoardInsertControl;
import co.dev.web.review.BoardLoadControl;
import co.dev.web.bookmark.BookmarkCheckControl;
import co.dev.web.bookmark.BookmarkSelectControl;
import co.dev.web.cafeinfo.CafeInfoDelteControl;
import co.dev.web.cafeinfo.CafeInfoInsertControl;
import co.dev.web.cafeinfo.CafeInfoSelectControl;
import co.dev.web.cafeinfo.CafeInfoUpdateControl;
import co.dev.web.cafeinfo.CafeListControl;
import co.dev.web.cafeinfo.CafeReionListControl;
import co.dev.web.review.LikeCheckControl;
import co.dev.web.review.ReviewListControl;
import co.dev.web.review.ReviewDeleteControl;
import co.dev.web.review.ReviewInsertControl;
import co.dev.web.review.ReviewLikeControl;
import co.dev.web.review.ReviewSelectControl;
import co.dev.web.review.ReviewUpdateControl;
import co.dev.web.user.LoginControl;
import co.dev.web.user.LogoutControl;
import co.dev.web.user.UserCheckControl;

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
		map.put("/board.do", new BoardLoadControl());
		map.put("/boardWrite.do", new BoardInsertControl());
		map.put("/boardContents.do", new BoardContentsControl());
		map.put("/deleteBoard.do", new deleteBoardControl());
		
		// myPage
		map.put("/updateInfo.do", new updateInfoControl());

		// login
		map.put("/login.do", new LoginControl());
		map.put("/logout.do", new LogoutControl());
		map.put("/userIdCheck.do", new UserCheckControl());
		map.put("/userInsert.do", new UserInsertControl()); //유저 회원가입

		// review
		map.put("/review.do", new ReviewListControl("review"));			// 리뷰 리스트
		map.put("/myReview.do", new ReviewListControl("myReview"));		// 내 리뷰 리스트
		map.put("/reviewSelect.do", new ReviewSelectControl()); 		// 수정할 리뷰 조회
		map.put("/reviewInsert.do", new ReviewInsertControl()); 		// 리뷰 등록
		map.put("/reviewUpdate.do", new ReviewUpdateControl()); 		// 리뷰 수정
		map.put("/reviewDelete.do", new ReviewDeleteControl());			// 리뷰 삭제
		map.put("/reviewLike.do", new ReviewLikeControl());				// 좋아요 +-
		map.put("/likeCheck.do", new LikeCheckControl());	
		
		 // cafe
		map.put("/cafeList.do", new CafeListControl()); //카페 리스트 조회(페이징)
		map.put("/cafeRegionList.do", new CafeReionListControl()); //카페 지역별리스트 조회(페이징)
		map.put("/cafeInfoInsert.do", new CafeInfoInsertControl()); //카페 정보 추가
		map.put("/cafeInfoDelete.do", new CafeInfoDelteControl()); //카페 정보 삭제
		map.put("/cafeInfoUpdate.do", new CafeInfoUpdateControl()); //카페 정보 수정
		map.put("/cafeInfoSelect.do", new CafeInfoSelectControl()); //카페 정보 세부 조회
		
		// bookmark
		map.put("/bookmarkCheck.do", new BookmarkCheckControl()); //북마크 +-체크
		map.put("/bookmarkSelect.do", new BookmarkSelectControl()); //내 북마크 조회



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
