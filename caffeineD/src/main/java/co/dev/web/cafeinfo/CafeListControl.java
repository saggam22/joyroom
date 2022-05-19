package co.dev.web.cafeinfo;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dev.dao.CafeDAO;
import co.dev.service.CafeService;
import co.dev.vo.CafeVO;
import co.dev.vo.PageVO;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class CafeListControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("user");
		
		response.setContentType("text/json;charset=utf-8");

		String job = request.getParameter("job");
		
		//첫페이지
		int pageNum = 1;
		int amount = 10;
		
		//페이지버튼 클릭
		if(request.getParameter("pageNum") != null && request.getParameter("amount") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			amount = Integer.parseInt(request.getParameter("amount"));
		}
		
		CafeService dao = new CafeDAO();
		List<CafeVO> list = dao.cafeList(pageNum, amount);
		int total = dao.cafeCount();
		PageVO page = new PageVO(pageNum, amount, total);

		
//		if (job.equals("all")) {
	
//		} else if (job.equals("susung")) {
//
//			list = dao.cafeListRegion("수성구");
//
//		} else if (job.equals("seogu")) {
//
//			list = dao.cafeListRegion("서구");
//
//		} else if (job.equals("bukgu")) {
//
//			list = dao.cafeListRegion("북구");
//
//		}

		request.setAttribute("page", page);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("view/cafe/cafeList.jsp").forward(request, response);
	}
}