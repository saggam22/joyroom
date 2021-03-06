package co.dev.web.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dev.service.BoardService;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class BoardDeleteControl implements Controller {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		UserVO vo = new UserVO();
		vo = (UserVO) session.getAttribute("user");
		System.out.println(vo);
		String param = request.getParameter("no");
		String param2 = request.getParameter("user"); // 작성자		
		int num = Integer.parseInt(param);
		System.out.println("삭제할 게시글번호 : "+num+" 세션유저정보 : "+vo.getId()); // 현재로그인한사람
		
		BoardService d_service = new BoardService();
		
		if(param2.equals(vo.getId())) {
			d_service.boardDelete(num);
			//session.setAttribute("success", "삭제가 완료되었습니다.");
			
			request.getRequestDispatcher("board.do").forward(request, response);
		}
		else {
			session.setAttribute("error", "작성자가 불일치합니다.");
			response.sendRedirect("boardContents.do?no="+num);
		}

	}

}
