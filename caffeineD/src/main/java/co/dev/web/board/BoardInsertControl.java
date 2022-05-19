package co.dev.web.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.dev.service.BoardService;
import co.dev.vo.BoardVO;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class BoardInsertControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
//		response.setContentType("text/json;charset=UTF-8");
//		String saveDir = "/upload";
//		saveDir = request.getServletContext().getRealPath(saveDir);
//		int maxSize = 1024 * 1024 * 10;
//		String encoding = "UTF-8";		
		
//		MultipartRequest multi = null;		
//		try {
//			//multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
//			System.out.println("파일성공");
//		} catch(Exception e) {
//			System.out.println("파일실패");
//		}		
//		request.setCharacterEncoding(encoding);
		
		HttpSession session = request.getSession();
		UserVO vo = new UserVO();
		vo = (UserVO) session.getAttribute("user");
		
		String userId = vo.getId(); // 로그인 사용자 ID
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		BoardVO board = new BoardVO();
		board.setContent(content);
		board.setTitle(title);
		board.setUser_id(userId);
		
		
		BoardService service = new BoardService();
		service.boardInsert(board);
		
		
		//response.sendRedirect("board.do");
		request.getRequestDispatcher("board.do").forward(request, response);
		
	}

}
