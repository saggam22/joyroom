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

public class noticeUpdateControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String saveDir = "img/noticeimg";
		saveDir = request.getServletContext().getRealPath(saveDir);
		int maxSize = 1024*1024*5;
		String encoding = "UTF-8";
		
		MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());

		int no = Integer.parseInt(multi.getParameter("no"));
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String img = multi.getFilesystemName("nfile");
		String check = multi.getParameter("check");
		
		NoticeVO notice = new NoticeVO();
		notice.setNo(no);
		notice.setTitle(title);
		notice.setContent(content);
		
		if(img!=null) {			
			notice.setImg(img);
		}
		
		if(check!=null) {			
			notice.setCheck(check);
		}
		
		NoticeService service = new NoticeDAO();
		service.updateNotice(notice);
		
		response.sendRedirect("notice.do");

	}

}
