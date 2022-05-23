package co.dev.web.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dev.service.BoardService;
import co.dev.vo.BoardVO;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class CommentInsertControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String title = request.getParameter("title");
		String content = request.getParameter("content");

		HttpSession session = request.getSession();
		UserVO vo = new UserVO();
		vo = (UserVO) session.getAttribute("user");

		String userId = vo.getId(); // 로그인 사용자 ID

		BoardVO board = new BoardVO();
		board.setUser_id(userId);
		board.setContent(content);
		board.setTitle(title);

		BoardService service = new BoardService();
		service.boardInsert(board);
		
		//session.setAttribute("success", "댓글을 작성했습니다.");
		//response.sendRedirect("boardContents.do");
		request.getRequestDispatcher("view/board/boardContents.tiles").forward(request, response);

	}
}
