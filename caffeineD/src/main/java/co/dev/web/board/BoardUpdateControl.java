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

public class BoardUpdateControl implements Controller {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		UserVO vo = new UserVO();
		vo = (UserVO) session.getAttribute("user");

		BoardService u_service = new BoardService();

		System.out.println(request.getMethod());
		String req = request.getMethod();
		if (req.equals("POST")) {
			BoardVO bvo = new BoardVO();
			bvo.setTitle(request.getParameter("title"));
			bvo.setContent(request.getParameter("content"));
			bvo.setNo(Integer.parseInt(request.getParameter("board_no")));
			u_service.boardUpdate(bvo);
			response.sendRedirect("board.do");
		}

		else {
			// 기존데이터 셀렉트해서 뿌리기? + 작성자가맞는지 확인
			String param = request.getParameter("no");
			String param2 = request.getParameter("user");
//		String title = request.getParameter("title");
//		String content = request.getParameter("content");
			System.out.println("no값 :" + request.getParameter("no"));
			System.out.println("글작성자 :" + param);


			int num = Integer.parseInt(param);
			System.out.println("수정할 게시글 번호 :" + num + "세션유저정보 : " + vo.getId());

			BoardVO board = new BoardVO();
			// board.setTitle(title);
			// board.setContent(content);

			if (!param2.equals(vo.getId())) {
				session.setAttribute("error", "작성자가 불일치합니다.");
				response.sendRedirect("boardContents.do?no="+num);
				return;
			}
			board = u_service.boardLoadOne(num); // db에서 기존내용 가져오기
			request.setAttribute("board", board); // 가져온 내용 화면(jsp)으로 보내기
		
			
			request.getRequestDispatcher("view/board/boardUpdate.tiles").forward(request, response);
		}
	}
}