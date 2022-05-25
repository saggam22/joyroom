package co.dev.service;

import java.util.List;

import co.dev.dao.ReviewDAO;
import co.dev.vo.CafeVO;
import co.dev.vo.MyReviewVO;
import co.dev.vo.ReviewVO;
import co.dev.vo.UserVO;

public class ReviewService {
	ReviewDAO dao = new ReviewDAO();

	// 전체 리뷰 리스트 조회
	public List<MyReviewVO> reviewList(int cafeNo, String UserId) {
		return dao.selectReviews(cafeNo, UserId);
	}

	// 리뷰 등록
	public void reviewInsert(ReviewVO vo) {
		dao.insertReview(vo);
	}
	
	// 리뷰 좋아요 수 +1
	public void likeCountPlus(int reviewNo) {
		dao.updateLikePlus(reviewNo);
	}

	// 리뷰 좋아요 수 -1
	public void likeCountMinus(int reviewNo) {
		dao.updateLikeMinus(reviewNo);
	}
	
	// 좋아요 정보 추가
	public void likeInfoInsert(String user, int reviewNo) {
		dao.insertLike(user, reviewNo);
	}
	
	// 좋아요 정보 삭제
	public void likeInfoDelete(String user, int reviewNo) {
		dao.deleteLike(user, reviewNo);
	}
	
	// 좋아요 정보 조회
	public boolean likeInfoSelect(String user, int reviewNo) {
		return dao.selectLike(user, reviewNo);
	}
	
	// 수정할 리뷰 조회
	public ReviewVO reviewSelect(int reviewNo) {
		return dao.selectReview(reviewNo);
	}
	
	// 내 리뷰 리스트 조회
	public List<MyReviewVO> myReviewList(String user) {
		return dao.myReviewSelect(user);
	}
	
	// 내 리뷰 수정
	public void reviewUpdate(ReviewVO vo) {
		dao.updateReview(vo);
	}

	// 내 리뷰 삭제
	public boolean reviewDelete(int reviewNo) {
		return dao.deleteReview(reviewNo);
	}
	
	// 평균 평점, 리뷰 수 구하기
	public float[] reviewInfoSelect(int cafeNo) {
		return dao.selectReviewInfo(cafeNo);
	}
	
	// 평점마다 개수 세기
	public int[] starCountSelect(int cafeNo) {
		return dao.selectStarCount(cafeNo);
	}
	
	// 관리자페이지 페이징; 전체 리뷰 카운트
	public int totalReviewCount() {
		return dao.selectReviewCount();
	}
	
	// 관리자페이지 전체 리뷰 조회
	public List<ReviewVO> totalReviewList(int pageNum) {
		return dao.selectTotalReview(pageNum);
	}
	
	// 리뷰 검색 페이징; 검색된 리뷰 카운트
	public int searchReviewCount(String keyword) {
		return dao.selectSearchReviewCount(keyword);
	}
	
	// 단어로 리뷰 검색
	public List<ReviewVO> searchReview(String keyword, int pageNum) {
		return dao.selectReviewKeyword(keyword, pageNum);
		
	}
	
	
	

	
	
	
	
	
	// 유저 조회
	public UserVO userSelect(String userId) {
		return dao.selectUser(userId);
	}
	
	// 유저 아이디 조회
	public String userIdSelect(int userTel) {
		return dao.selectUserId(userTel);
	}
	
	// 유저 비밀번호 조회
	public String userPwdSelect(String userId, int userTel) {
		return dao.selectUserPwd(userId, userTel);
	}

	// 로그인 유저 조회
	public boolean userLogin(String userId, String userPwd) {
		return dao.userForLogin(userId, userPwd);
	}

	

	


	


	

}
