package co.dev.service;

import java.util.List;

import co.dev.vo.NoticeVO;

public interface NoticeService {
	
		// 공지사항 리스트 갯수(페이징)
		public int noticeCount();
		// 공지사항 전체 조회
		public List<NoticeVO> noticeList(int pageNum);
		// 검색별 공지 갯수(페이징)
		public int noticeSearchCount(String keyword);
		// 검색 조회
		public List<NoticeVO> searchList(String keyword, int pageNum);
		// 공지글 내용 조회
		public NoticeVO selectNotice(int noticeNo);
		// 공지글 등록
		public void insertNotice(NoticeVO vo);
		// 공지글 수정
		public void updateNotice(NoticeVO vo);
		// 공지글 삭제
		public void deleteNotice(int noticeNo);
		// 공지글 조회수
		public void viewCntNotice(int noticeNo);
}
