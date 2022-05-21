package co.dev.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.dev.vo.adCafeVO;

public class adCafeDAO extends DAO_mac {

	public List<adCafeVO> selectAdCafe() {
			
		conn();
		String sql = "SELECT cafe_no, cafe_name, cafe_img, ad_cafe_info\n"
				+ "FROM cafe\n"
				+ "JOIN (select ad_cafe_no, ad_cafe_info from \n"
				+ "        ( select * from ad_cafe\n"
				+ "          order by DBMS_RANDOM.RANDOM\n"
				+ "     ) where rownum < 3)\n"
				+ "ON cafe_no=ad_cafe_no";
		
		List<adCafeVO> list = new ArrayList<>();
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				adCafeVO vo = new adCafeVO();
				vo.setNo(rs.getInt("cafe_no"));
				vo.setName(rs.getString("cafe_name"));
				vo.setImg(rs.getString("cafe_img"));
				vo.setInfo(rs.getString("ad_cafe_info"));
				
				list.add(vo);
				}
			
			int r = psmt.executeUpdate();
			
			if(r > 0) {
				System.out.println("광고 " + r + "건 조회");
				return list;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return null;
	}

}
