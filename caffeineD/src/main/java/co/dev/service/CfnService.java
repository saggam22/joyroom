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
	public int likeCountPlus(int reviewNo) {
		return dao.updateLikePlus(reviewNo);
	}

	// 리뷰 좋아요 수 -1
	public int likeCountMinus(int reviewNo) {
		return dao.updateLikeMinus(reviewNo);
		
	}

}
