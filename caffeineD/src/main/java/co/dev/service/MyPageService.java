package co.dev.service;

import java.util.List;

import co.dev.dao.UserDAO;
import co.dev.dao.boardDAO;
import co.dev.vo.BoardVO;
import co.dev.vo.UserVO;

public class MyPageService {

	UserDAO dao = new UserDAO();
	boardDAO bdao = new boardDAO();

	public void userUpdate(UserVO user) {
		dao.updateInfo(user);
	}
	
	public UserVO userOne(String userId) {
		return dao.userOne(userId);
	}
	
	public List<BoardVO> myBoard() {		
		return bdao.listBoard();
	}
	
	public UserVO userSearch(String id) {
		return dao.searchInfo(id);
	}
}
