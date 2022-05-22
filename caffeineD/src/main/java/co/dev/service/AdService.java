package co.dev.service;

import java.util.List;

import co.dev.dao.adCafeDAO;
import co.dev.vo.CafeVO;
import co.dev.vo.adCafeVO;

public class AdService {

	adCafeDAO dao = new adCafeDAO();
	
	// 메인 광고
	public List<adCafeVO> adSelect() {
		return dao.selectAdCafe();
	}
	
	// 관리자 페이지 광고 리스트
	public List<adCafeVO> adList() {
		return dao.selectAdList();
	}

	// 광고 등록 페이지에서 카페 전체 리스트 조회
	public List<CafeVO> totalCafeList() {
		return dao.selectCafeList();
	}

	// 광고 등록
	public boolean adInsert(String adCafeNo, String adCafeInfo) {	
		return dao.insertAdCafe(adCafeNo, adCafeInfo);
	}
	
	// 광고 삭제
	public boolean adDelete(String adCafeNo) {
		return dao.deleteAdCafe(adCafeNo);
	}

	// 광고 수정
	public boolean adUpdate(String adCafeNo, String adCafeInfo) {
		return dao.updateAdCafe(adCafeNo, adCafeInfo);
	}


	
	

}
