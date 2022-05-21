package co.dev.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.dev.service.NoticeService;
import co.dev.vo.NoticeVO;

public class NoticeDAO extends DAO_mac implements NoticeService {

	// 공지사항 리스트 갯수(페이징)
	public int noticeCount() {
		conn();
		String sql = "SELECT COUNT(*) as total FROM notice";
		int count = 0;
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if (rs.next()) {

				count = rs.getInt("total");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}
		return count;
	}
	// 공지사항 전체 조회
	public List<NoticeVO> noticeList(int pageNum) {
		int startNum = (pageNum-1)*10+1;
		int endNum = pageNum*10;
		conn();
		String sql = "SELECT * FROM (SELECT rownum rn,  a.* FROM (\r\n"
				+ "SELECT * FROM notice ORDER BY (CASE WHEN notice_check = 'checked' THEN 1 ELSE 2 END), notice_no DESC) a ) WHERE rn >= ? AND rn <= ?";

		List<NoticeVO> list = new ArrayList<NoticeVO>();
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, startNum);
			psmt.setInt(2, endNum);
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				
				NoticeVO vo = new NoticeVO();

				vo.setNo(rs.getInt("notice_no"));
				vo.setTitle(rs.getString("notice_title"));
				vo.setContent(rs.getString("notice_content"));
				vo.setDate(rs.getString("notice_date"));
				vo.setImg(rs.getString("notice_img"));
				vo.setView(rs.getInt("notice_view"));
				vo.setUser(rs.getString("notice_user"));
				vo.setCheck(rs.getString("notice_check"));
				
				list.add(vo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}
		return list;
	}
	
	// 검색 조회
	public List<NoticeVO> searchList(String title) {
		conn();
		String sql = "SELECT * FROM notice WHERE notice_title LIKE '%'||?||'%'";
		
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		NoticeVO vo = null;
				
		try {

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, title);

			while (rs.next()) {

				vo = new NoticeVO();

				vo.setNo(rs.getInt(""));
				vo.setTitle(rs.getString("notice_no"));
				vo.setContent(rs.getString("notice_title"));
				vo.setDate(rs.getString("notice_content"));
				vo.setImg(rs.getString("notice_date"));
				vo.setView(rs.getInt("notice_img"));
				vo.setUser(rs.getString("notice_view"));
				vo.setCheck(rs.getString("notice_user"));
				
				list.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}
		return list;
	}
	
	// 공지글 등록
	public void insertNotice(NoticeVO vo) {
		conn();
		String sql = "INSERT INTO notice(notice_no, notice_title, notice_content, notice_date, notice_img, notice_user, notice_check) "
				+ "VALUES(seq_notice_no.NEXTVAL,?,?,sysdate,?,?,?)";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getTitle());
			psmt.setString(2, vo.getContent());
			psmt.setString(3, vo.getImg());
			psmt.setString(4, vo.getUser());
			psmt.setString(5, vo.getCheck());

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
	
	// 공지글 수정
	public void updateNotice(NoticeVO vo) {
		conn();
		String sql = "UPDATE notice SET notice_title=?, notice_content=?, notice_date=sysdate, notice_img=?, notice_check=?) "
				+ "WHERE notice_no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getTitle());
			psmt.setString(2, vo.getContent());
			psmt.setString(3, vo.getImg());
			psmt.setString(5, vo.getCheck());

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
	
	// 공지글 삭제
	public void deleteNotice(int noticeNo) {
		conn();
		String sql = "DELETE FROM notice WHERE notice_no=?";

		try {

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, noticeNo);

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

	// 공지글 조회수
	public void viewCntNotice(int noticeNo) {
		conn();
		String sql = "UPDATE notice SET notice_view=notice_view+1 WHERE board_no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, noticeNo);

			int r = psmt.executeUpdate();
			if (r > 0) {
				System.out.println("조회수" + r + "건 추가");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconn();
		}
				
	}
}
