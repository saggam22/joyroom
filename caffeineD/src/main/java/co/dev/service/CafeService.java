package co.dev.service;

import java.util.List;

import co.dev.vo.CafeVO;

public interface CafeService {

	// 카페 리스트 갯수(페이징)
	public int cafeCount();
	// 카페 리스트 전체 조회
	public List<CafeVO> cafeList(int pageNum);
	// 카페 지역별 리스트 갯수(페이징)
	public int regionCafeCount(String region);
	// 카페 지역별 리스트 조회
	public List<CafeVO> cafeListRegion(String region, int pageNum);
	// 검색별 카페 페이지 갯수
	public int searchCafeCount(String keyword);
	// 검색별 카페 리스트 조회
	public List<CafeVO> cafeListSearch(String keyword, int pageNum);
	// 카페 1건 조회
	public CafeVO selecCafe(int cafeNo);
	// 카페 등록
	public void insertCafe(CafeVO vo);
	// 카페 수정
	public void updateCafe(int cafeNo, String newImg);
	// 카페 삭제
	public void deleteCafe(int cafeNo);

}