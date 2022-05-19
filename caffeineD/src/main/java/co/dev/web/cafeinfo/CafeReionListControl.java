package co.dev.web.cafeinfo;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dev.dao.CafeDAO;
import co.dev.service.CafeService;
import co.dev.vo.CafeVO;
import co.dev.vo.PageVO;
import co.dev.web.Controller;

public class CafeReionListControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

response.setContentType("text/json;charset=utf-8");
		
		String job = request.getParameter("job");
		
		//첫페이지
		int pageNum = 1;
		
		//페이지버튼 클릭
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		PageVO pasing = new PageVO();
		pasing.setPageNum(pageNum);
		
		CafeService dao = new CafeDAO();
		int total = 0;
		List<CafeVO> list = null;
		
		if (job.equals("susung") || job==null) {
			total = dao.regionCafeCount("수성구");
			pasing.setTotal(total);
			list = dao.cafeListRegion("수성구", pageNum);
			
		} else if (job.equals("seogu")) {
			total = dao.regionCafeCount("서구");
			pasing.setTotal(total);
			list = dao.cafeListRegion("서구", pageNum);
			
		} else if (job.equals("bukgu")) {
			total = dao.regionCafeCount("북구");
			pasing.setTotal(total);
			list = dao.cafeListRegion("북구", pageNum);
		}

		request.setAttribute("paging", pasing);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("view/cafe/cafeList.jsp").forward(request, response);

	}

}
