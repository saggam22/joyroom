package co.dev.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.dev.service.UserService;
import co.dev.vo.CafeVO;
import co.dev.vo.UserVO;

public class UserDAO extends DAO implements UserService {

	public void userInsert(UserVO vo) {

		conn();
		String sql = "INSERT INTO cfn_user(user_id, user_pwd, user_nick, user_tel)" + "VALUES(?,?,?,?)";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getId());
			psmt.setString(2, vo.getPwd());
			psmt.setString(3, vo.getNickname());
			psmt.setString(4, vo.getTel());

			int r = psmt.executeUpdate();
			if (r > 0) {
				System.out.println(r + "건 입력");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}
	}
	
	public boolean checkBookmark(int cafeNo, String userId) {
		
		conn();
		String sql = "SELECT * FROM bookmark "
				+ "WHERE cafe_no=? AND user_id=?";
		
		try {
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, cafeNo);
			psmt.setString(2, userId);
			
			int r = psmt.executeUpdate();
			if (r>0) {
				System.out.println("북마크 " + r + "건 조회");
				return true;
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}
		
		return false;
	}

	// myPage 내정보수정
	public void updateInfo(UserVO vo) {
		conn();
		String sql = "update cfn_user set user_pwd=?, user_nuck=?, user_tel=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getPwd());
			psmt.setString(2, vo.getNickname());
			psmt.setString(3, vo.getTel());
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}
	}

	// 북마크 추가
	public void insertBookmark(int cafeNo, String userId) {

		conn();
		String sql = "INSERT INTO bookmark VALUES(?,?)";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, cafeNo);
			psmt.setString(2, userId);

			int r = psmt.executeUpdate();
			if (r > 0) {
				System.out.println("북마크" + r + "건 추가");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}
	}

	// 북마크 삭제
	public void deleteBookmark(int cafeNo, String userId) {

		conn();
		String sql = "DELETE FROM bookmark WHERE cafe_no=? AND user_id=?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, cafeNo);
			psmt.setString(2, userId);

			int r = psmt.executeUpdate();
			if (r > 0) {
				System.out.println("북마크" + r + "건 삭제");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}
	}

	// 내 북마크 조회
	public List<CafeVO> selectBookmark(String userId) {

		conn();
		String sql = "SELECT * FROM cafe WHERE cafe_no IN (SELECT cafe_no FROM bookmark WHERE user_id LIKE ?)";

		List<CafeVO> list = new ArrayList<>();

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userId);

			rs = psmt.executeQuery();
			while (rs.next()) {

				CafeVO vo = new CafeVO();

				vo.setNo(rs.getInt("cafe_no"));
				vo.setName(rs.getString("cafe_name"));
				vo.setAddress(rs.getString("cafe_address"));
				vo.setTel(rs.getString("cafe_tel"));
				vo.setImg(rs.getString("cafe_img"));
				vo.setRegion(rs.getString("cafe_region"));
				list.add(vo);

				return list;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}
		return null;
	}

}
