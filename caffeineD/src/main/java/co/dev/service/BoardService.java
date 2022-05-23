package co.dev.service;

import java.util.List;

import co.dev.dao.boardDAO;
import co.dev.vo.BoardVO;

public class BoardService {

	boardDAO dao = new boardDAO();
	
	// 게시판 리스트 조회
	public List<BoardVO> boardLoad() {		
		return dao.listBoard();
	}
	public List<BoardVO> boardMyLoad(String userId) {		
		return dao.listMyBoard(userId);
	}
	
	// 게시글 상세보기
	public BoardVO boardLoadOne(int num) {		
		return dao.oneBoard(num);
	}
	
	// 게시글 조회수+
	public void plusView(int num) {
		dao.plusView(num);
	}
	
	// 게시글 추가
	public void boardInsert(BoardVO board) {
		dao.insertBoard(board);
	}
	
	// 게시글 수정
	public void boardUpdate(BoardVO board) {
		dao.updateBoard(board);
	}
	
	// 게시글 삭제
		public void boardDelete(int param) {
			dao.deleteBoard(param);
		}
}
