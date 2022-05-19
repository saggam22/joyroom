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

		response.setContentType("text/json;charset=UTF-8");
		String saveDir = "/upload";
		saveDir = request.getServletContext().getRealPath(saveDir);
		int maxSize = 1024 * 1024 * 10;
		String encoding = "UTF-8";
		System.out.println("입력처리하는 컨트롤입니다.");
	
		
		request.setCharacterEncoding(encoding);
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		HttpSession session = request.getSession();
		UserVO vo = new UserVO();
		vo = (UserVO) session.getAttribute("user");
		
		String userId = vo.getId(); // 로그인 사용자 ID
		
		BoardVO board = new BoardVO();
		board.setContent(content);
		board.setTitle(title);
		
		BoardService service = new BoardService();
		service.boardInsert(board);
		
		request.getRequestDispatcher("board.do").forward(request, response);
		
	}
}
