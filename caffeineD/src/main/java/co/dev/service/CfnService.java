package co.dev.service;

import java.util.List;

import co.dev.dao.CfnDAO;
import co.dev.vo.ReviewVO;

public class CfnService {
	CfnDAO dao = new CfnDAO();

	public List<ReviewVO> reviewList(int cafeNo) {
		
		return dao.selectReviews(cafeNo);

	}

}
