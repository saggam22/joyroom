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
		
		response.setContentType("text/json;charset=utf-8");
		
		//첫페이지
		int pageNum = 1;
		
		//페이지버튼 클릭
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		PageVO pasing = new PageVO();
		pasing.setPageNum(pageNum);
		
		CafeService dao = new CafeDAO();
		int total = dao.cafeCount();
		pasing.setTotal(total);
		List<CafeVO> list = dao.cafeList(pageNum);

		request.setAttribute("paging", pasing);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("view/cafe/cafeList.jsp").forward(request, response);
	}
}