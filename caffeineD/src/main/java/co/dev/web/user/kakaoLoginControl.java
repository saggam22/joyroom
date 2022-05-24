package co.dev.web.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dev.dao.UserDAO;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class kakaoLoginControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/json;charset=utf-8");
		
		String id = request.getParameter("id");
		String nickname = request.getParameter("nickname");
		String userImg = request.getParameter("userImg");
		
		UserDAO dao = new UserDAO();
		UserVO vo = new UserVO();
		
		vo.setId(id);
		vo.setNickname(nickname);
		vo.setImg(userImg);
		
		HttpSession session = request.getSession();
		session.setAttribute("user", vo);
		
		// 카카오 로그인 > 회원인 경우
		if(dao.checkUser(id)) {
			response.getWriter().print("{\"messege\" : \"카카오 로그인 성공\"}");
		
		// 카카오 로그인 > 비회원인 경우
		} else {

			if(dao.kakaoUserInsert(vo)) {
				response.getWriter().print("{\"messege\" : \"카카오 회원가입 성공\"}");
			} else {
				response.getWriter().print("{\"messege\" : \"카카오 회원가입 실패\"}");
			}
			
		}
	}

}
