package co.dev.web.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dev.dao.NoticeDAO;
import co.dev.service.NoticeService;
import co.dev.vo.NoticeVO;
import co.dev.web.Controller;

public class noticeSelectControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int noticeNo = Integer.parseInt(request.getParameter("no"));
		String job = request.getParameter("job");
		String path = "";
		
		NoticeService service = new NoticeDAO();
		
		if (job.equals("select")) {
			
			path = "/view/notice/noticeSelect.tiles";
			
		} else if (job.equals("update")) {
			
			path = "/view/notice/noticeUpdate.tiles";
			
		}
		
		NoticeVO vo = service.selectNotice(noticeNo);
		request.setAttribute("notice", vo);
		request.getRequestDispatcher(path).forward(request, response);
	}

}
