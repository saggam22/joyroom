package co.dev.service;

import java.util.List;

import co.dev.vo.CafeVO;
import co.dev.vo.UserVO;

public interface UserService {

	// 회원가입
	public void userInsert(UserVO vo);
	//북마크 확인
	public boolean checkBookmark(int cafeNo, String userId);
	// 북마크 추가
	public void insertBookmark(int cafeNo, String userId);
	// 북마크 삭제
	public void deleteBookmark(int cafeNo, String userId);
	// 내 북마크 조회
	public List<CafeVO> selectBookmark(String userId);
	// 회원리스트 조회
	public List<UserVO> userList();
	//아이디 중복 확인
	public boolean checkId(String userId);
	//닉네임 중복 확인
	public boolean checkNickname(String userNickname);
}
