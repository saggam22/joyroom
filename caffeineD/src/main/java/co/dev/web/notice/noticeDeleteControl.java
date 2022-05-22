package co.dev.web.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dev.dao.NoticeDAO;
import co.dev.service.NoticeService;
import co.dev.web.Controller;

public class noticeDeleteControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int noticeNo = Integer.parseInt(request.getParameter("no"));
		
		NoticeService service = new NoticeDAO();
		service.deleteNotice(noticeNo);
		
		response.sendRedirect("notice.do");

	}

}
