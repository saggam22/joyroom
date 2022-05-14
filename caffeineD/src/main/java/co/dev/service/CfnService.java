package co.dev.service;

import java.util.List;

import co.dev.dao.CfnDAO;
import co.dev.vo.ReviewVO;

public class CfnService {
	CfnDAO dao = new CfnDAO();

	// 전체 리뷰 리스트 조회
	public List<ReviewVO> reviewList(int cafeNo) {
		return dao.selectReviews(cafeNo);
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
	public List<ReviewVO> myReviewList(String user) {
		return dao.myReviewSelect(user);
	}
	
	// 내 리뷰 수정
	public void reviewUpdate(ReviewVO vo) {
		dao.updateReview(vo);
	}


}
