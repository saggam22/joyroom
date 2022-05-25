package co.dev.web.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.dev.dao.NoticeDAO;
import co.dev.service.NoticeService;
import co.dev.vo.NoticeVO;
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

		int noticeNo = Integer.parseInt(multi.getParameter("no"));
		NoticeService service = new NoticeDAO();
		String saveFile = service.selectNotice(noticeNo).getImg();
		
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String img = multi.getFilesystemName("nfile");
		String check = multi.getParameter("check");

		NoticeVO notice = new NoticeVO();
		notice.setNo(noticeNo);
		notice.setTitle(title);
		notice.setContent(content);
		
		if (saveFile != null ) {
			if(img!=null) {	//저장된 파일이 있지만 파일 수정함
				
				notice.setImg(img);
			
			} else { //저장된 파일이 있고 수정 안함
				notice.setImg(saveFile);
			}	
		} else {
			if(img!=null) {	//만약 저장된 파일이 없고 파일 추가함
				notice.setImg(img);	
			}
			//저장된 파일이 없고 수정 안함
		}
		
		if(check!=null) {			
			notice.setCheck(check);
		}
		
		service.updateNotice(notice);
		request.getRequestDispatcher("/noticeSelect.do?job=select&no="+noticeNo).forward(request, response);

	}

}
