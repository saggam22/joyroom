package co.dev.service;

import java.util.List;

import co.dev.dao.CommentDAO;
import co.dev.vo.CommentVO;

public class CommentService {
	CommentDAO dao = new CommentDAO();
	
	public void commentInsert(CommentVO comment) {
		int lastIx = dao.findIndex(comment.getBoard_no());
		dao.insertComment(comment, lastIx);
	}
	
	public List<CommentVO> commentList(int num) {
		return dao.listComment(num);
	}
	
}