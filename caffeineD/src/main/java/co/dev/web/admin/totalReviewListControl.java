package co.dev.web.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dev.dao.CafeDAO;
import co.dev.service.CafeService;
import co.dev.service.ReviewService;
import co.dev.vo.CafeVO;
import co.dev.vo.PageVO;
import co.dev.vo.ReviewVO;
import co.dev.web.Controller;

public class totalReviewListControl implements Controller {

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
		
		ReviewService service = new ReviewService();
		int total = service.totalReviewCount();
		pasing.setTotal(total);
		List<ReviewVO> list = service.totalReviewList(pageNum);

		request.setAttribute("paging", pasing);
		request.setAttribute("totalReviewList", list);
		request.getRequestDispatcher("/view/admin/totalReviewList.tiles").forward(request, response);
			

	}

}
