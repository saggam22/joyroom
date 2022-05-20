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
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String saveDir = "img/noticeimg";
		saveDir = request.getServletContext().getRealPath(saveDir); //getServletContext() 프로젝트명 .getRealPath(saveDir) 폴더명을 읽어옴
		int maxSize = 1024*1024*5; //(5메가바이트)
		String encoding = "UTF-8";
		
		MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String img = multi.getParameter("img");
		String check = multi.getParameter("check");
		
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("user");
		
		NoticeVO notice = new NoticeVO();
		notice.setTitle(title);
		notice.setContent(content);
		notice.setUser(vo.getNickname());
		
		if(img!=null) {			
			notice.setImg(img);
		}
		
		if(check!=null) {			
			notice.setCheck(check);
		}
		
		NoticeService service = new NoticeDAO();
		service.insertNotice(notice);
		
		request.getSession().setAttribute("success", "공지사항 등록이 완료되었습니다.");
		response.sendRedirect("notice.do");
		
	}

}
