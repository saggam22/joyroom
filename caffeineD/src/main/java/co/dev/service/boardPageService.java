package co.dev.service;

import java.util.List;

import co.dev.vo.BoardVO;


public interface boardPageService {

	//카페 리스트 갯수(페이징)
	public int Count();
	// 카페 리스트 전체 조회
	public List<BoardVO> boardList(int pageNum);
	
}
