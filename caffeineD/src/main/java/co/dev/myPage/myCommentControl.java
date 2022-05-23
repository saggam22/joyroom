package co.dev.myPage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dev.service.CommentService;
import co.dev.vo.CommentVO;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class myCommentControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();		
		UserVO vo = new UserVO();
		vo = (UserVO) session.getAttribute("user");
		String userId = vo.getId();
		System.out.println("유저아이디 : " + userId);		
		
		CommentService c_service = new CommentService();
		List<CommentVO> c_list = c_service.listMyComment(userId);
		System.out.println(c_list);
		request.setAttribute("all", c_list);
		
		request.getRequestDispatcher("view/myPage/myComment.tiles").forward(request, response);

	}

}
