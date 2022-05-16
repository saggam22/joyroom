package co.dev.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.dev.vo.CafeVO;
import co.dev.vo.UserVO;

public class cafeDAO extends DAO {

	// 카페 리스트 전체 조회
	public List<CafeVO> cafeList() {

		conn();
		String sql = "SELECT * FROM cafe ORDER BY cafe_no";

		List<CafeVO> list = new ArrayList<>();

		try {
			psmt = conn.prepareStatement(sql);
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

	// 지역별 카페 리스트 조회
	public List<CafeVO> cafeListRegion(String region) {

		conn();
		String sql = "SELECT * FROM cafe WHERE cafe_region LIKE '%'||?||'%' ORDER BY cafe_no";

		List<CafeVO> list = new ArrayList<>();

		try {
			psmt = conn.prepareStatement(sql);
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

	// 카페 1건 조회
	public CafeVO selecCafe(int cafeNo) {

		conn();
		String sql = "SELECT * FROM cafe WHERE cafe_no=?";

		try {

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, cafeNo);

			while (rs.next()) {

				CafeVO vo = new CafeVO();

				vo.setNo(rs.getInt("cafe_no"));
				vo.setName(rs.getString("cafe_name"));
				vo.setAddress(rs.getString("cafe_address"));
				vo.setTel(rs.getString("cafe_tel"));
				vo.setImg(rs.getString("cafe_img"));
				vo.setRegion(rs.getString("cafe_region"));
				
				return vo;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}
		return null;
	}

	// 카페 등록
	public void insertCafe(CafeVO vo) {

		conn();
		String sql = "INSERT INTO cafe(cafe_no, cafe_name, cafe_address, cafe_tel, cafe_img, cafe_region) "
				+ "VALUES(seq_cafe_no.NEXTVAL,?,?,?,?,?)";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getName());
			psmt.setString(2, vo.getAddress());
			psmt.setString(3, vo.getTel());
			psmt.setString(4, vo.getImg());
			psmt.setString(5, vo.getImg());

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

	// 카페 수정
	public void updateCafe(CafeVO vo) {

		conn();
		String sql = "UPDATE cafe SET cafe_name=?, cafe_address=?, cafe_tel=?, cafe_img=?, cafe_region=?) "
				+ "WHERE cafe_no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getName());
			psmt.setString(2, vo.getAddress());
			psmt.setString(3, vo.getTel());
			psmt.setString(4, vo.getImg());
			psmt.setString(5, vo.getImg());
			psmt.setInt(6, vo.getNo());

			int r = psmt.executeUpdate();
			if (r > 0) {
				System.out.println(r + "건 수정");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}

	}

	// 카페 삭제
	public void deleteCafe(int cafeNo) {

		conn();
		String sql = "DELETE FROM cafe WHERE cafe_no=?";

		try {

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, cafeNo);

			int r = psmt.executeUpdate();
			if (r > 0) {
				System.out.println(r + "건 삭제");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}

	}

	// 북마크수 +1
	public void updateLikePlus(int reviewNo) {

		conn();
		String sql = "UPDATE review " + "SET review_like = review_like+1 " + "WHERE review_no = ?";

		try {

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, reviewNo);

			int r = psmt.executeUpdate();
			if (r > 0) {
				System.out.println("좋아요 +" + r);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}

	}

	// 북마크 수 -1
	public void updateLikeMinus(int reviewNo) {

		conn();
		String sql = "UPDATE review " + "SET review_like = review_like-1 " + "WHERE review_no = ?";

		try {

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, reviewNo);

			int r = psmt.executeUpdate();
			if (r > 0) {
				System.out.println("좋아요 -" + r);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}

	}

	// 북마크 추가
	public void insertLike(String userId, int reviewNo) {

		conn();
		String sql = "INSERT INTO review_like " + "VALUES(?,?,?)";

		try {

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, reviewNo);
			psmt.setString(2, userId);
			psmt.setString(3, "like");

			int r = psmt.executeUpdate();
			if (r > 0) {
				System.out.println("좋아요");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}
	}

	// 좋아요 정보 삭제
	public void deleteLike(String userId, int reviewNo) {

		conn();
		String sql = "DELETE review_like " + "WHERE review_no=? AND like_user=?";

		try {

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, reviewNo);
			psmt.setString(2, userId);

			int r = psmt.executeUpdate();
			if (r > 0) {
				System.out.println("좋아요 취소");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}
	}

	// 좋아요 여부 체크
	public boolean selectLike(String userId, int reviewNo) {

		conn();
		String sql = "SELECT like_check FROM review_like " + "WHERE review_no=? AND like_user=?";

		try {

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, reviewNo);
			psmt.setString(2, userId);

			int r = psmt.executeUpdate();
			if (r > 0) {
				System.out.println("좋아요 " + r + "건 조회");
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}

		return false;
	}

	// 수정할 리뷰 1건 조회
	public CafeVO selectReview(int reviewNo) {

		conn();
		String sql = "SELECT * FROM review WHERE review_no = ?";

		CafeVO vo = new CafeVO();

		try {

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, reviewNo);
			rs = psmt.executeQuery();

			while (rs.next()) {
				vo.setNo(rs.getInt("cafe_no"));
				vo.setName(rs.getString("cafe_name"));
				vo.setAddress(rs.getString("cafe_address"));
				vo.setTel(rs.getString("cafe_tel"));
				vo.setImg(rs.getString("cafe_img"));
				vo.setRegion(rs.getString("cafe_region"));

			}

			int r = psmt.executeUpdate();
			if (r > 0) {
				System.out.println("리뷰 " + r + "건 조회");
			}

			return vo;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}
		return null;

	}

	// 내 리뷰 조희
	public List<CafeVO> myReviewSelect(String userId) {

		conn();
		String sql = "SELECT * FROM review WHERE review_userid = ?";

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
			}

			int r = psmt.executeUpdate();
			if (r > 0) {
				System.out.println("리뷰 " + r + "건 조회");
			}

			return list;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}
		return null;
	}

	// 유저 조회
	public UserVO selectUser(String userId) {

		conn();
		String sql = "SELECT * FROM cfn_user " + "WHERE user_id=?";

		UserVO vo = new UserVO();

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userId);
			rs = psmt.executeQuery();

			if (rs.next()) {
				vo.setGrade(rs.getString("user_grade"));
				vo.setId(rs.getString("user_id"));
				vo.setImg(rs.getString("user_img"));
				vo.setNickname(rs.getString("user_nick"));
				vo.setTel(rs.getString("user_tel"));

			}

			int r = psmt.executeUpdate();
			if (r > 0) {
				System.out.println("유저 " + r + "건 조회");
				return vo;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}

		return null;
	}

	public boolean deleteReview(int reviewNo) {

		conn();
		String sql = "DELETE review " + "WHERE review_no=?";

		try {

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, reviewNo);

			int r = psmt.executeUpdate();
			if (r > 0) {
				System.out.println("리뷰 " + r + "건 삭제");
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}
		return false;
	}

}
