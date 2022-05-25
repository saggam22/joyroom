package co.dev.web.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.dev.dao.UserDAO;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class UserInsertControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String saveDir = "img/noticeimg";
		saveDir = request.getServletContext().getRealPath(saveDir); //getServletContext() 프로젝트명 .getRealPath(saveDir) 폴더명을 읽어옴
		int maxSize = 1024*1024*5; //(5메가바이트)
		String encoding = "UTF-8";
		
		MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String img = multi.getFilesystemName("profileImg");
		String id = multi.getParameter("id");
		String nickname = multi.getParameter("nick");
		String pwd = multi.getParameter("pwd");
		String tel = multi.getParameter("tel");

		UserVO vo = new UserVO();
		vo.setImg(img);
		vo.setId(id);
		vo.setNickname(nickname);
		vo.setPwd(pwd);
		vo.setTel(tel);
		UserDAO service = new UserDAO();
		service.userInsert(vo);

		request.getSession().setAttribute("userInsert", "회원가입이 완료되었습니다. 로그인해주세요");
		response.sendRedirect("view/user/login.tiles");

	}

}
