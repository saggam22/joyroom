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

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		
		String saveDir = "img";
		saveDir = request.getServletContext().getRealPath(saveDir);
		System.out.println(saveDir);
		int maxSize = 1024 * 1024 * 10;
		String encoding = "UTF-8";

		MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
		//request.setCharacterEncoding(encoding);

		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String img = multi.getFilesystemName("img");
		
		HttpSession session = request.getSession();
		UserVO vo = new UserVO();
		vo = (UserVO) session.getAttribute("user");
				
		String userId = vo.getId(); // 로그인 사용자 ID

		BoardVO board = new BoardVO();
		board.setContent(content);
		board.setTitle(title);
		board.setUser_id(userId);
		board.setImg(img);
		
		BoardService service = new BoardService();
		service.boardInsert(board);
		System.out.println(img);
		request.getSession().setAttribute("success", "글 작성이 완료되었습니다.");

		//response.sendRedirect("board.do");
		request.getRequestDispatcher("board.do").forward(request, response);
		

	}

}
