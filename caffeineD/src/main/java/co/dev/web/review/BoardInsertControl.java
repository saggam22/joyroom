package co.dev.web.review;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.dev.service.BoardService;
import co.dev.vo.BoardVO;
import co.dev.web.Controller;

public class BoardInsertControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		response.setContentType("text/json;charset=UTF-8");
		String saveDir = "/upload";
		saveDir = request.getServletContext().getRealPath(saveDir);
		int maxSize = 1024 * 1024 * 10;
		String encoding = "UTF-8";
		System.out.println("입력처리하는 컨트롤입니다.");
		
//		MultipartRequest multi = null;
		
//		try {
//			//multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
//			System.out.println("파일성공");
//		} catch(Exception e) {
//			System.out.println("파일실패");
//		}
		
		request.setCharacterEncoding(encoding);
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		BoardVO board = new BoardVO();
		board.setContent(content);
		board.setTitle(title);
		
		BoardService service = new BoardService();
		service.boardInsert(board);
		
		request.getRequestDispatcher("board.do").forward(request, response);
		
	}

}
