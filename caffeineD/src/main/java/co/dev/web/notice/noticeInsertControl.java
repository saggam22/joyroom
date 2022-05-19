package co.dev.web.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.dev.dao.NoticeDAO;
import co.dev.service.NoticeService;
import co.dev.vo.NoticeVO;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class noticeInsertControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("user");
		
		String saveDir = "upload";
		saveDir = request.getServletContext().getRealPath(saveDir); //getServletContext() 프로젝트명 .getRealPath(saveDir) 폴더명을 읽어옴
		int maxSize = 1024*1024*5; //(5메가바이트)
		String encoding = "UTF-8";
		
		MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String file = multi.getParameter("file");
		String check = multi.getParameter("check");
		
		NoticeVO notice = new NoticeVO();
		notice.setTitle(title);
		notice.setContent(content);
		notice.setImg(file);
		notice.setCheck(check);
		notice.setUser(vo.getNickname());
		
		NoticeService service = new NoticeDAO();
		service.insertNotice(notice);
		
		//Dispatcher객체 forward 요청정보를 그대로 지정페이지에서 호출
		request.getRequestDispatcher("view/notice/notice.jsp").forward(request, response);
		
	}

}
