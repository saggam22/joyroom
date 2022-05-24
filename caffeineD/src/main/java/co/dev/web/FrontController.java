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

import co.dev.myPage.myBoardControl;
import co.dev.myPage.myCommentControl;
import co.dev.myPage.myPageLoadController;
import co.dev.myPage.updateInfoControl;
import co.dev.web.admin.adCafeControl;
import co.dev.web.admin.adCafeListControl;
import co.dev.web.admin.totalReviewListControl;
import co.dev.web.admin.userDeleteControl;
import co.dev.web.admin.userListControl;
import co.dev.web.admin.userSearchControl;
import co.dev.web.board.BoardContentsControl;
import co.dev.web.board.BoardDeleteControl;
import co.dev.web.board.BoardInsertControl;
import co.dev.web.board.BoardLoadControl;
import co.dev.web.board.BoardUpdateControl;
import co.dev.web.bookmark.BookmarkCheckControl;
import co.dev.web.bookmark.MyBookmarkListControl;
import co.dev.web.cafeinfo.CafeInfoSelectControl;
import co.dev.web.cafeinfo.CafeInfoUpdateControl;
import co.dev.web.cafeinfo.CafeListControl;
import co.dev.web.cafeinfo.CafeReionListControl;
import co.dev.web.cafeinfo.CafeSearchListControl;
import co.dev.web.notice.noticeDeleteControl;
import co.dev.web.notice.noticeInsertControl;
import co.dev.web.notice.noticeListControl;
import co.dev.web.notice.noticeSearchListControl;
import co.dev.web.notice.noticeSelectControl;
import co.dev.web.notice.noticeUpdateControl;
import co.dev.web.review.LikeCheckControl;
import co.dev.web.review.ReviewDeleteControl;
import co.dev.web.review.ReviewInsertControl;
import co.dev.web.review.ReviewLikeControl;
import co.dev.web.review.ReviewListControl;
import co.dev.web.review.ReviewSelectControl;
import co.dev.web.review.ReviewUpdateControl;
import co.dev.web.review.StarAvgControl;
import co.dev.web.user.LoginControl;
import co.dev.web.user.LogoutControl;
import co.dev.web.user.MailSendControl;
import co.dev.web.user.UserFindControl;
import co.dev.web.user.UserInsertCheckControl;
import co.dev.web.user.UserInsertControl;
import co.dev.web.user.kakaoLoginControl;


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
		map.put("/boardDelete.do", new BoardDeleteControl());
		map.put("/boardUpdate.do", new BoardUpdateControl());
		
		// myPage
		map.put("/updateInfo.do", new updateInfoControl());
		map.put("/myPage.do", new myPageLoadController());
		map.put("/myBoard.do", new myBoardControl());
		map.put("/myComment.do", new myCommentControl());

		// login
		map.put("/login.do", new LoginControl());
		map.put("/kakaoLogin.do", new kakaoLoginControl());	
		map.put("/logout.do", new LogoutControl());
		map.put("/userIdCheck.do", new UserFindControl("findId"));
		map.put("/userIdCheckForPwd.do", new UserFindControl("findIdForPwd"));
		map.put("/makeTempPwd.do", new UserFindControl("makeTempPwd"));
		map.put("/mailSend.do", new MailSendControl());
		map.put("/userInsert.do", new UserInsertControl()); //유저 회원가입
		map.put("/userInsertCheck.do", new UserInsertCheckControl()); //유저 가입시 아이디, 닉네임 중복 체크
		
		// review
		map.put("/review.do", new ReviewListControl("review"));			// 리뷰 리스트
		map.put("/myReview.do", new ReviewListControl("myReview"));		// 내 리뷰 리스트
		map.put("/reviewSelect.do", new ReviewSelectControl()); 		// 수정할 리뷰 조회
		map.put("/reviewInsert.do", new ReviewInsertControl()); 		// 리뷰 등록
		map.put("/reviewUpdate.do", new ReviewUpdateControl()); 		// 리뷰 수정
		map.put("/reviewDelete.do", new ReviewDeleteControl());			// 리뷰 삭제
		map.put("/reviewLike.do", new ReviewLikeControl());				// 좋아요 +-
		map.put("/likeCheck.do", new LikeCheckControl());				// 좋아요 체크	
		map.put("/starAvg.do", new StarAvgControl());					// 평균 평점 조회
		map.put("/cafeInfo.do", new ReviewListControl("cafeInfo"));		// 마이페이지 카페 정보

		
		 // cafe
		map.put("/cafeList.do", new CafeListControl()); //카페 리스트 조회(페이징)
		map.put("/cafeRegionList.do", new CafeReionListControl()); //카페 지역별리스트 조회(페이징)
		map.put("/cafeSearchList.do", new CafeSearchListControl()); //카페 검색 조회(페이징)
		map.put("/cafeInfoSelect.do", new CafeInfoSelectControl()); //카페 정보 세부 조회
		
		// bookmark
		map.put("/bookmarkCheck.do", new BookmarkCheckControl()); //북마크 +-체크
		map.put("/myBookmark.do", new MyBookmarkListControl()); //내 북마크 조회

		//notice
		map.put("/notice.do", new noticeListControl()); //공지사항리스트(페이징)
		map.put("/noticeSearch.do", new noticeSearchListControl()); //공지사항검색조회(페이징)
		map.put("/noticeInsert.do", new noticeInsertControl()); //공지사항 등록
		map.put("/noticeUpdate.do", new noticeUpdateControl()); //공지사항 수정
		map.put("/noticeSelect.do", new noticeSelectControl()); //공지사항 내용보기
		map.put("/noticeDelete.do", new noticeDeleteControl()); //공지사항 삭제
		
		//admin page
		map.put("/user.do", new userListControl()); //유저 리스트
		map.put("/userDelete.do", new userDeleteControl()); //유저삭제
		map.put("/userSearch.do", new userSearchControl()); //유저검색
		map.put("/totalReviewList.do", new totalReviewListControl()); // 리뷰 리스트
		map.put("/adList.do", new adCafeListControl());	// 광고 리스트
		map.put("/adCafeInsertView.do", new adCafeControl("view"));
		map.put("/adCafeInsert.do", new adCafeControl("insert"));
		map.put("/adCafeDelete.do", new adCafeControl("delete"));
		map.put("/adCafeUpdate.do", new adCafeControl("update"));
		map.put("/cafeInfoUpdate.do", new CafeInfoUpdateControl()); //카페 정보 수정
		
		//main
		map.put("/mainAd.do", new mainAdControl());	// 메인 광고
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
