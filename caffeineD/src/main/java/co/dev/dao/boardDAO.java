package co.dev.dao;

import java.sql.PreparedStatement;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.dev.vo.BoardVO;
import java.time.LocalDateTime;

public class boardDAO extends DAO {

	public List<BoardVO> listBoard() {
		conn();

		List<BoardVO> list = new ArrayList<BoardVO>();

		try {
			psmt = conn.prepareStatement("select * from board order by board_no desc");
			rs = psmt.executeQuery();
			while (rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setNo(rs.getInt("board_no"));
				vo.setTitle(rs.getString("board_title"));
				vo.setUser(rs.getString("board_user"));
				vo.setContent(rs.getString("board_content"));
				vo.setDate(rs.getString("board_date"));
				vo.setImg(rs.getString("board_img"));
				vo.setView(rs.getInt("board_view"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}
		return list;
	}
	
	public BoardVO oneBoard(int num) {
		conn();

		try {
			psmt = conn.prepareStatement("select * from board where board_no = ?");
			psmt.setInt(1, num);
			rs = psmt.executeQuery();
			if (rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setNo(rs.getInt("board_no"));
				vo.setTitle(rs.getString("board_title"));
				vo.setUser(rs.getString("board_user"));
				vo.setContent(rs.getString("board_content"));
				vo.setDate(rs.getString("board_date"));
				vo.setImg(rs.getString("board_img"));
				vo.setView(rs.getInt("board_view"));
				return vo;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}
		return null;
	}
	
	public BoardVO plusView(int num) {
		conn();

		try {
			psmt = conn.prepareStatement("update board set board_view = board_view+1 where board_no = ?");
			psmt.setInt(1, num);
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}
		return null;
	}

	public void insertBoard(BoardVO board, int lastIx) {
		conn();
		
		LocalDateTime date = LocalDateTime.now();
		String sql = "insert into board (board_no, board_title, board_user, board_content, board_date, board_img, board_view) values(?,?,?,?,sysdate,'111',0)";

		if(lastIx != 1) // 커뮤니티 첫번째글이 아니면 마지막놈뒤에 새로운글 생김
			lastIx++;
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, lastIx);
			psmt.setString(2, board.getTitle());
			psmt.setString(3, "비회원");  // board.getUser()
			psmt.setString(4, board.getContent()); 
			//psmt.setString(5, "sysdata");  // date.toString()
			//psmt.setString(6, "111"); // board.getImg()
			//psmt.setInt(7, 0);
			
			int r = psmt.executeUpdate();
			System.out.println(r + "건 입력됨.");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}
	}
	
	public int findIndex() {
		// 게시글 마지막번호 찾기
		conn();
		int lastIx = 1; // 커뮤니티 첫번째 게시글이면 게시글번호가 1임
		try {
			psmt = conn.prepareStatement("select board_no from board where rownum=1 order by board_no desc");
			rs = psmt.executeQuery();
	
			while (rs.next()) {
				lastIx = rs.getInt("board_no");
			}
			System.out.println("last Index : "+lastIx);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}

		return lastIx;
	}

}
