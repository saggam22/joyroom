package co.dev.service;

import java.util.List;

import co.dev.dao.boardDAO;
import co.dev.vo.BoardVO;

public class BoardService {

	boardDAO dao = new boardDAO();

	public List<BoardVO> boardLoad() {
		// 게시판 리스트 조회
		return dao.listBoard();
	}
	
	public BoardVO boardLoadOne(int num) {
		// 게시판 리스트 조회
		return dao.oneBoard(num);
	}
	
	public void plusView(int num) {
		dao.plusView(num);
	}

	public void boardInsert(BoardVO board) {
		int lastIx = dao.findIndex();
		dao.insertBoard(board, lastIx);
	}
	
}
