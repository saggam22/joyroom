package co.dev.service;

import java.util.List;

import co.dev.vo.CafeVO;
import co.dev.vo.UserVO;

public interface UserService {

	// 회원가입
	public void userInsert(UserVO vo);
	// myPage 내정보수정
	public void updateInfo(UserVO vo);
	//북마크 확인(중복체크)
	public boolean checkBookmark(int cafeNo, String userId);
	// 북마크 추가
	public void insertBookmark(int cafeNo, String userId);
	// 북마크 삭제
	public void deleteBookmark(int cafeNo, String userId);
	// 내 북마크 조회
	public List<CafeVO> myBookmark(String userId);
	//내정보
	public UserVO userOne(String userId);
	//회원리스트 수
	public int userCount();
	//회원리스트 조회(페이징)
	public List<UserVO> userList(int pageNum);
	//검색별 회원수
	public int userSearchCount(String category, String keyword);
	//검색별 회원리스트(페이징)
	List<UserVO> searchUserList(String category, String keyword, int pageNum);
	// 회원 삭제
	public void deleteUser(String userId);
	//아이디, 닉네임 중복 확인
	public boolean userInsertcheck(String category, String keyword);
	// 임시 비밀번호 발급 -> 아이디값 받아 비밀번호 정보만 변경
	public void updatePwd(String tempPwd, String userId);

}
