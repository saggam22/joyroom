package co.dev.web.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dev.dao.boardDAO;
import co.dev.service.BoardService;
import co.dev.service.boardPageService;
import co.dev.vo.BoardVO;
import co.dev.vo.PageVO;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class BoardLoadControl implements Controller {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/json;charset=utf-8");
		UserVO vo = new UserVO();
		vo = (UserVO) session.getAttribute("user");

		if (vo == null) {
			session.setAttribute("error", "로그인이 필요합니다. 로그인 페이지로 이동합니다.");
			response.sendRedirect("view/user/login.tiles");
			return;

		} else {
			System.out.println("로그인한 id : " + vo.getId());
			int pageNum = 1;
			if (request.getParameter("pageNum") != null) {
				pageNum = Integer.parseInt(request.getParameter("pageNum"));
			}
			PageVO pasing = new PageVO();
			pasing.setPageNum(pageNum);
			
			boardPageService dao = new boardDAO();			
			int total =  dao.Count();
			pasing.setTotal(total);
			List<BoardVO> plist = dao.boardList(pageNum);
//			BoardService service = new BoardService();
//			List<BoardVO> list = service.boardLoad();
			request.setAttribute("paging", pasing);
//			request.setAttribute("list", plist);
			request.setAttribute("all", plist);
			
			request.getRequestDispatcher("view/board/board.tiles").forward(request, response);
		}

	}
}
