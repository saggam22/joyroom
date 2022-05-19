package co.dev.service;

import co.dev.dao.UserDAO;
import co.dev.vo.UserVO;

public class MyPageService {

	UserDAO dao = new UserDAO();

	public void userUpdate(UserVO user) {
		dao.updateInfo(user);
	}
	
	public UserVO userOne(String userId) {
		return dao.userOne(userId);
	}
	
}
