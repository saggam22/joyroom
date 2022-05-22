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
		
		response.setContentType("text/json;charset=UTF-8");
		String saveDir = "/img";
		saveDir = request.getServletContext().getRealPath(saveDir);
		int maxSize = 1024 * 1024 * 10;
		String encoding = "UTF-8";

		MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
		
		HttpSession session = request.getSession();
		UserVO vo = new UserVO();
		vo = (UserVO) session.getAttribute("user");
		String id = vo.getId(); // 로그인 사용자 ID
		String pwd = multi.getParameter("pwd");
		String nick = multi.getParameter("nickname");
		String tel = multi.getParameter("tel");
		String img = multi.getFilesystemName("img");
		
		UserVO user = new UserVO();
		user.setId(id);
		user.setPwd(pwd);
		user.setNickname(nick);
		user.setTel(tel);
		user.setImg(img);

		MyPageService service = new MyPageService();
		service.userUpdate(user);
		
		request.getSession().setAttribute("success", "정보 수정이 완료되었습니다.");
		
		//response.sendRedirect("view/myPage/myPage.tiles");

		request.getRequestDispatcher("view/myPage/myPage.tiles").forward(request, response);
	}

}
