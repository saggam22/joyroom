package co.dev.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.dev.vo.ReviewVO;

public class CfnDAO extends DAO {

	// 리뷰 리스트 조회
	public List<ReviewVO> selectReviews(int cafeNo) {
		
		conn();
		String sql = "SELECT * FROM review WHERE cafe_no = ?";
		
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
				vo.setDate(rs.getString("review_date"));
				vo.setImg(rs.getString("review_img"));
				vo.setLike(rs.getInt("review_like"));
				vo.setStar(rs.getInt("review_star"));
				vo.setUser(rs.getString("review_user"));
				
				list.add(vo);
			}
			
			int r = psmt.executeUpdate();
			if (r>0) {
				System.out.println(r + "건 조회");
			}
			
			return list;
			
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
				+ "VALUES(?,review_seq.NEXTVAL,?,SYSDATE,0,?,?,?)";
		String noImgSql = "INSERT INTO review(cafe_no, review_no, review_user, review_date, review_like, review_star, review_content) " 
				+ "VALUES(?,review_seq.NEXTVAL,?,SYSDATE,0,?,?)";
		
		try {
			if (vo.getImg()!=null) {
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, vo.getCafeNo());
				psmt.setString(2, vo.getUser());
				psmt.setInt(3, vo.getStar());
				psmt.setString(4, vo.getContent());
				psmt.setString(5, vo.getImg());
			} else {
				psmt = conn.prepareStatement(noImgSql);
				psmt.setInt(1, vo.getCafeNo());
				psmt.setString(2, vo.getUser());
				psmt.setInt(3, vo.getStar());
				psmt.setString(4, vo.getContent());
			}
			
			int r = psmt.executeUpdate();
			if (r>0) {
				System.out.println(r + "건 입력");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}
		
	}
	
	// 리뷰 좋아요 수 +1
	public int updateLikePlus(int reviewNo) {

		conn();
		String sql = "UPDATE review SET review_like = review_like + 1 WHERE review_no = ?";
		
		int likeCount = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, reviewNo);
			likeCount = rs.getInt("review_like");
			
			int r = psmt.executeUpdate();
			if (r>0) {
				System.out.println("좋아요 +" + r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}
		
		return likeCount;
		
	}
	
	// 리뷰 좋아요 수 -1
	public int updateLikeMinus(int reviewNo) {

		conn();
		String sql = "UPDATE review SET review_like = review_like - 1 WHERE review_no = ?";
		
		int likeCount = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, reviewNo);
			likeCount = rs.getInt("review_like");
			
			int r = psmt.executeUpdate();
			if (r>0) {
				System.out.println("좋아요 -" + r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}
		
		return likeCount;
		
	}
	
	
}
