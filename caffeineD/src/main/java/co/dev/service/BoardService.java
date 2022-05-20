package co.dev.service;

import java.util.List;

import co.dev.dao.boardDAO;
import co.dev.vo.BoardVO;

public class BoardService {

	boardDAO dao = new boardDAO();
	
	public void boardDelete(int board_no) {
		dao.deleteBoard(board_no);
	}
	
	// 게시판 리스트 조회
	public List<BoardVO> boardLoad() {		
		return dao.listBoard();
	}
	
	public BoardVO boardLoadOne(int num) {		
		return dao.oneBoard(num);
	}
	
	public void plusView(int num) {
		dao.plusView(num);
	}

	public void boardInsert(BoardVO board) {
		dao.insertBoard(board);
	}
	
}
