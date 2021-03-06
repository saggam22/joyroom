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

import co.dev.web.admin.adCafeControl;
import co.dev.web.admin.adCafeListControl;
import co.dev.web.admin.reviewSearchControl;
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
import co.dev.web.myPage.myBoardControl;
import co.dev.web.myPage.myCommentControl;
import co.dev.web.myPage.myPageLoadController;
import co.dev.web.myPage.realUpdateControl;
import co.dev.web.myPage.updateInfoControl;
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
		map.put("/realUpdate.do", new realUpdateControl());
		
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
		map.put("/userInsert.do", new UserInsertControl()); //?????? ????????????
		map.put("/userInsertCheck.do", new UserInsertCheckControl()); //?????? ????????? ?????????, ????????? ?????? ??????
		
		// review
		map.put("/review.do", new ReviewListControl("review"));			// ?????? ?????????
		map.put("/myReview.do", new ReviewListControl("myReview"));		// ??? ?????? ?????????
		map.put("/reviewSelect.do", new ReviewSelectControl()); 		// ????????? ?????? ??????
		map.put("/reviewInsert.do", new ReviewInsertControl()); 		// ?????? ??????
		map.put("/reviewUpdate.do", new ReviewUpdateControl()); 		// ?????? ??????
		map.put("/reviewDelete.do", new ReviewDeleteControl());			// ?????? ??????
		map.put("/reviewLike.do", new ReviewLikeControl());				// ????????? +-
		map.put("/likeCheck.do", new LikeCheckControl());				// ????????? ??????	
		map.put("/starAvg.do", new StarAvgControl());					// ?????? ?????? ??????
		map.put("/cafeInfo.do", new ReviewListControl("cafeInfo"));		// ??????????????? ?????? ??????

		
		 // cafe
		map.put("/cafeList.do", new CafeListControl()); //?????? ????????? ??????(?????????)
		map.put("/cafeRegionList.do", new CafeReionListControl()); //?????? ?????????????????? ??????(?????????)
		map.put("/cafeSearchList.do", new CafeSearchListControl()); //?????? ?????? ??????(?????????)
		map.put("/cafeInfoSelect.do", new CafeInfoSelectControl()); //?????? ?????? ?????? ??????
		
		// bookmark
		map.put("/bookmarkCheck.do", new BookmarkCheckControl()); //????????? +-??????
		map.put("/myBookmark.do", new MyBookmarkListControl()); //??? ????????? ??????

		//notice
		map.put("/notice.do", new noticeListControl()); //?????????????????????(?????????)
		map.put("/noticeSearch.do", new noticeSearchListControl()); //????????????????????????(?????????)
		map.put("/noticeInsert.do", new noticeInsertControl()); //???????????? ??????
		map.put("/noticeUpdate.do", new noticeUpdateControl()); //???????????? ??????
		map.put("/noticeSelect.do", new noticeSelectControl()); //???????????? ????????????
		map.put("/noticeDelete.do", new noticeDeleteControl()); //???????????? ??????
		
		//admin page
		map.put("/user.do", new userListControl()); //?????? ?????????
		map.put("/userDelete.do", new userDeleteControl()); //????????????
		map.put("/userSearch.do", new userSearchControl()); //????????????
		map.put("/totalReviewList.do", new totalReviewListControl()); // ?????? ?????????
		map.put("/reviewSearch.do", new reviewSearchControl()); // ?????? ??????
		map.put("/adList.do", new adCafeListControl());	// ?????? ?????????
		map.put("/adCafeInsert.do", new adCafeControl("insert"));
		map.put("/adCafeDelete.do", new adCafeControl("delete"));
		map.put("/adCafeUpdate.do", new adCafeControl("update"));
		map.put("/cafeInfoUpdate.do", new CafeInfoUpdateControl()); //?????? ?????? ??????
		
		//main
		map.put("/mainAd.do", new mainAdControl());	// ?????? ??????
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
