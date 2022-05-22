package co.dev.web.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dev.dao.NoticeDAO;
import co.dev.service.NoticeService;
import co.dev.vo.NoticeVO;
import co.dev.vo.PageVO;
import co.dev.web.Controller;

public class noticeListControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//첫페이지
		int pageNum = 1;
		
		//페이지버튼 클릭
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		PageVO pasing = new PageVO();
		pasing.setPageNum(pageNum);
		
		NoticeService dao = new NoticeDAO();
		int total = dao.noticeCount();
		pasing.setTotal(total);
		List<NoticeVO> list = dao.noticeList(pageNum);

		request.setAttribute("paging", pasing);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/view/notice/notice.tiles").forward(request, response);
	}

}
