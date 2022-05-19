package co.dev.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.dev.vo.ReviewVO;
import co.dev.vo.UserVO;

public class CfnDAO extends DAO_mac {

	// 리뷰 리스트 조회
	public List<ReviewVO> selectReviews(int cafeNo) {
		
		conn();
		String sql = "SELECT * FROM review WHERE cafe_no = ? ORDER BY review_like desc";
		
		List<ReviewVO> list = new ArrayList<>();
		
		try {
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, cafeNo);
			rs = psmt.executeQuery();
		
			while (rs.next()) {
				
				ReviewVO vo = new ReviewVO();
				
				vo.setCafeNo(rs.getInt("cafe_no"));
				vo.setNo(rs.getInt("review_no"));
				vo.setContent(rs.getString("review_content"));
				vo.setDate(rs.getString("review_date").substring(0, 10));
				vo.setImg(rs.getString("review_img"));
				vo.setLike(rs.getInt("review_like"));
				vo.setStar(rs.getInt("review_star"));
				vo.setUserId(rs.getString("review_userid"));
				vo.setUserNick(rs.getString("review_usernick"));
				vo.setUserImg(rs.getString("review_userimg"));
				
				list.add(vo);
			}
			
			int r = psmt.executeUpdate();
			if (r>0) {
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
	
	// 내 리뷰 리스트
	public List<ReviewVO> myReviewSelect(String userId) {
			
		conn();
		String sql = "SELECT * FROM review WHERE review_userid = ?";
		
		List<ReviewVO> list = new ArrayList<>();
			
		try {
				
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userId);
			rs = psmt.executeQuery();
			
			while (rs.next()) {
					
				ReviewVO vo = new ReviewVO();
					
				vo.setCafeNo(rs.getInt("cafe_no"));
				vo.setNo(rs.getInt("review_no"));
				vo.setContent(rs.getString("review_content"));
				vo.setDate(rs.getString("review_date").substring(0, 10));
				vo.setImg(rs.getString("review_img"));
				vo.setLike(rs.getInt("review_like"));
				vo.setStar(rs.getInt("review_star"));
				vo.setUserId(rs.getString("review_userid"));
				vo.setUserNick(rs.getString("review_usernick"));
				vo.setUserImg(rs.getString("review_userimg"));
					
				list.add(vo);
			}
				
			int r = psmt.executeUpdate();
			if (r>0) {
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
	
	// 수정할 리뷰 1건 조회
	public ReviewVO selectReview(int reviewNo) {
		
		conn();
		String sql = "SELECT * FROM review WHERE review_no = ?";
			
		ReviewVO vo = new ReviewVO();
			
		try {
				
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, reviewNo);
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				vo.setCafeNo(rs.getInt("cafe_no"));
				vo.setNo(rs.getInt("review_no"));
				vo.setContent(rs.getString("review_content"));
				vo.setDate(rs.getString("review_date").substring(0, 10));
				vo.setImg(rs.getString("review_img"));
				vo.setLike(rs.getInt("review_like"));
				vo.setStar(rs.getInt("review_star"));
				vo.setUserId(rs.getString("review_userid"));
				vo.setUserNick(rs.getString("review_usernick"));

			}
				
			int r = psmt.executeUpdate();
			if (r>0) {
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
	
	// 리뷰 등록
	public void insertReview(ReviewVO vo) {

		conn();
		String sql = "INSERT INTO review "
				+ "VALUES(?,review_seq.NEXTVAL,?,?,?,SYSDATE,0,?,?,?)";
		String noImgSql = "INSERT INTO review(cafe_no, review_no, review_userid, review_usernick, review_userimg, review_date, review_like, review_star, review_content) " 
				+ "VALUES(?,review_seq.NEXTVAL,?,?,?,SYSDATE,0,?,?)";
		
		try {
			
			if (vo.getImg()!=null) {
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, vo.getCafeNo());
				psmt.setString(2, vo.getUserId());
				psmt.setString(3, vo.getUserNick());
				psmt.setString(4, vo.getUserImg());
				psmt.setInt(5, vo.getStar());
				psmt.setString(6, vo.getContent());
				psmt.setString(7, vo.getImg());
			} else {
				psmt = conn.prepareStatement(noImgSql);
				psmt.setInt(1, vo.getCafeNo());
				psmt.setString(2, vo.getUserId());
				psmt.setString(3, vo.getUserNick());
				psmt.setString(4, vo.getUserImg());
				psmt.setInt(5, vo.getStar());
				psmt.setString(6, vo.getContent());
			}
			
			int r = psmt.executeUpdate();
			if (r>0) {
				System.out.println("리뷰 " + r + "건 입력");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}
		
	}
	
	
	// 리뷰 수정
	public void updateReview(ReviewVO vo) {
			
		conn();
		String sql = "UPDATE review "
				+ "SET review_star=?, review_content=?, review_img=?"
				+ "WHERE review_no=?";
		String imgSql = "UPDATE review "
				+ "SET review_star=?, review_content=?"
				+ "WHERE review_no=?";
			
		try {
				
			if(vo.getImg() != null) {
					
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, vo.getStar());
				psmt.setString(2, vo.getContent());
				psmt.setString(3, vo.getImg());
				psmt.setInt(4, vo.getNo());

			} else {
					
				psmt = conn.prepareStatement(imgSql);
				psmt.setInt(1, vo.getStar());
				psmt.setString(2, vo.getContent());
				psmt.setInt(3, vo.getNo());
					
			}
				
			int r = psmt.executeUpdate();
			if (r>0) {
				System.out.println("리뷰 " + r + "건 수정");
			}
				

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}

	}
	
	// 리뷰 삭제
	public boolean deleteReview(int reviewNo) {
		
		conn();
		String sql = "DELETE review "
				+ "WHERE review_no=?";
		
		try {
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, reviewNo);
			
			int r = psmt.executeUpdate();
			if (r>0) {
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
	
	// 리뷰 좋아요 수 +1
	public void updateLikePlus(int reviewNo) {

		conn();
		String sql = "UPDATE review "
				+ "SET review_like = review_like+1 "
				+ "WHERE review_no = ?";
		
		try {
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, reviewNo);

			int r = psmt.executeUpdate();
			if (r>0) {
				System.out.println("좋아요 +" + r);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}

		
	}
	
	// 리뷰 좋아요 수 -1
	public void updateLikeMinus(int reviewNo) {

		conn();
		String sql = "UPDATE review "
				+ "SET review_like = review_like-1 "
				+ "WHERE review_no = ?";
		
		try {
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, reviewNo);
			
			int r = psmt.executeUpdate();
			if (r>0) {
				System.out.println("좋아요 -" + r);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}
		
	}
	
	// 좋아요 정보 추가
	public void insertLike(String userId, int reviewNo) {
		
		conn();
		String sql = "INSERT INTO review_like "
				+ "VALUES(?,?,?)";
		
		try {
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, reviewNo);
			psmt.setString(2, userId);
			psmt.setString(3, "like");
			
			int r = psmt.executeUpdate();
			if (r>0) {
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
		String sql = "DELETE review_like "
				+ "WHERE review_no=? AND like_user=?";
		
		try {
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, reviewNo);
			psmt.setString(2, userId);
			
			int r = psmt.executeUpdate();
			if (r>0) {
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
		String sql = "SELECT like_check FROM review_like "
				+ "WHERE review_no=? AND like_user=?";
		
		try {
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, reviewNo);
			psmt.setString(2, userId);
			
			int r = psmt.executeUpdate();
			if (r>0) {
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
	
	// 유저 조회
	public UserVO selectUser(String userId) {
		
		conn();
		String sql = "SELECT * FROM cfn_user "
				+ "WHERE user_id=?";

		UserVO vo = new UserVO();
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userId);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				vo.setId(rs.getString("user_id"));
				vo.setPwd(rs.getString("user_pwd"));
				vo.setImg(rs.getString("user_img"));
				vo.setNickname(rs.getString("user_nick"));
				vo.setTel(rs.getString("user_tel"));
		
			}
			
			int r = psmt.executeUpdate();
			if (r>0) {
				System.out.println("유저 " + r + "건 조회");
				return vo;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			disconn();
		}

		return null;
	}
	
	// 유저 아이디 조회
	public String selectUserId(int userTel) {
		
		conn();
		String sql = "SELECT user_id FROM cfn_user "
				+ "WHERE user_tel=?";

		String findId = "";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, userTel);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				findId = rs.getString("user_id");
			}
			
			int r = psmt.executeUpdate();
			if (r>0) {
				System.out.println("유저 " + r + "건 조회");
				return findId;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			disconn();
		}

		return null;
	}
	
	// 유저 비밀번호 조회
	public String selectUserPwd(String userId, int userTel) {
		
		conn();
		String sql = "SELECT user_pwd FROM cfn_user "
				+ "WHERE user_id=? AND user_tel=?";

		String findPwd = "";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userId);
			psmt.setInt(2, userTel);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				findPwd = rs.getString("user_pwd");
			}
			
			int r = psmt.executeUpdate();
			if (r>0) {
				System.out.println("유저 " + r + "건 조회");
				return findPwd;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			disconn();
		}

		return null;
	}
	
	// 로그인 정보 조회
	public boolean userForLogin(String userId, String userPwd) {
		
		conn();
		String sql = "SELECT * FROM cfn_user "
				+ "WHERE user_id=? AND user_pwd=?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userId);
			psmt.setString(2, userPwd);

			int r = psmt.executeUpdate();
			if (r>0) {
				System.out.println("로그인 유저 " + r + "건 조회");
				return true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			disconn();
		}

		return false;
	}
	
	
	
}
