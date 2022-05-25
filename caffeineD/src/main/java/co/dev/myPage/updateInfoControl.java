package co.dev.myPage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.dev.service.MyPageService;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class updateInfoControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserVO vo = new UserVO();
		vo = (UserVO) session.getAttribute("user");
		
		String pwd = request.getParameter("pwd");
		String nick = request.getParameter("nickname");
		String tel = request.getParameter("tel");
		System.out.println("비번: "+pwd);
		UserVO user = new UserVO();
		user.setPwd(pwd);
		user.setNickname(nick);
		user.setTel(tel);		

		MyPageService service = new MyPageService();
		service.userUpdate(user);

		// request.getSession().setAttribute("success", "정보 수정이 완료되었습니다.");

		// response.sendRedirect("view/myPage/updateInfo.tiles");

		request.getRequestDispatcher("view/myPage/updateInfo.tiles").forward(request, response);
	}

}