package co.dev.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.dev.vo.ReviewVO;

public class CfnDAO extends DAO_mac {

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
				vo.setrContents(rs.getString("review_contents"));
				vo.setrDate(rs.getString("review_date"));
				vo.setrImage(rs.getString("review_image"));
				vo.setrLike(rs.getInt("review_like"));
				vo.setrStar(rs.getInt("review_star"));
				vo.setrUser(rs.getString("user_nick"));
				
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
	
	
}
