package co.dev.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.dev.vo.CommentVO;

public class CommentDAO extends DAO{
	
	public void insertComment(CommentVO comment, int lastIx) {
		conn();
		String sql = "insert into cfn_comment(comment_code, board_no,comment_no,comment_content,comment_date,comment_img,user_id) values(seq_code.nextval,?,?,?,sysdate,'111',?)";
		System.out.println(lastIx + "번째 댓글 달림");
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, comment.getBoard_no());
			psmt.setInt(2, lastIx+1);
			psmt.setString(3, comment.getComment_content());
			psmt.setString(4, comment.getUser_id());
			
			int r = psmt.executeUpdate();
			//System.out.println(r + "건 입력됨.");
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			disconn();
		}
	}
	
	//게시글 마지막번호 찾기
	public int findIndex(int board_no) {		
		conn();
		int lastIx = 0;
		try {
			psmt = conn.prepareStatement("select comment_no from cfn_comment where board_no = ? order by comment_no desc");
			psmt.setInt(1, board_no);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				lastIx = rs.getInt("comment_no");
			}
			System.out.println("last Comment Index : "+lastIx);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}

		return lastIx;
	}

	public List<CommentVO> listComment(int board_no) {
		conn();
		List<CommentVO> list = new ArrayList<CommentVO>();
		
		try {
			psmt = conn.prepareStatement("select * from cfn_comment where board_no = ? order by comment_no asc");
			psmt.setInt(1, board_no);
			
			rs = psmt.executeQuery();
			while (rs.next()) {
				CommentVO vo = new CommentVO();
				vo.setComment_no(rs.getInt("comment_no"));
				vo.setUser_id(rs.getString("user_id"));
				vo.setComment_content(rs.getString("comment_content"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}
		return list;
	}
}
