package co.dev.web.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dev.service.BoardService;
import co.dev.service.CommentService;
import co.dev.vo.BoardVO;
import co.dev.vo.CommentVO;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class BoardContentsControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		HttpSession session = request.getSession();
//		UserVO uvo = (UserVO) session.getAttribute("user_id");
//		uvo.setId("user_id");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String param_comment = request.getParameter("comment");

		String param = request.getParameter("no");
		int num = Integer.parseInt(param);
		System.out.println("선택한 게시글번호 : " + num);

		BoardService b_service = new BoardService();
		b_service.plusView(num); // 조회수 1증가
		BoardVO vo = b_service.boardLoadOne(num); // 게시글 내용조회해서
		
		CommentService c_service = new CommentService();
		List<CommentVO> c_list = c_service.commentList(num);
		
		HttpSession session = request.getSession();
		UserVO uvo = new UserVO();
		uvo = (UserVO) session.getAttribute("user");
		
		String userId = uvo.getId(); // 로그인 사용자 ID

		if (vo == null) {
			System.out.println("없는 게시글입니다.");
		} else {
			request.setAttribute("contents", vo); // 화면에뿌리기
			request.setAttribute("comments", c_list);			
		}

		if (param_comment != null) {
			System.out.println("댓글등록요청 : " + param_comment);
			CommentVO comment = new CommentVO();
			comment.setUser_id(userId);
			comment.setBoard_no(num);
			comment.setComment_content(param_comment);

			c_service.commentInsert(comment);
		}
		request.getRequestDispatcher("boardContents.jsp").forward(request, response);

	}

}
