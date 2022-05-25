package co.dev.web.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dev.service.ReviewService;
import co.dev.vo.PageVO;
import co.dev.vo.ReviewVO;
import co.dev.web.Controller;

public class reviewSearchControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//첫페이지
		int pageNum = 1;
		
		//페이지버튼 클릭
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		PageVO paging = new PageVO();
		paging.setPageNum(pageNum);
		
		String keyword = request.getParameter("keyword");
		
		ReviewService service = new ReviewService();
		int total = service.searchReviewCount(keyword);
		paging.setTotal(total);
		
		List<ReviewVO> list = service.searchReview(keyword, pageNum);
		
		request.setAttribute("paging", paging);
		request.setAttribute("reviewList", list);
		request.getRequestDispatcher("/view/admin/totalReviewList.tiles").forward(request, response);

	}

}
