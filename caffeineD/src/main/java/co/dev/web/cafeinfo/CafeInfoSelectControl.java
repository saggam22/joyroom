package co.dev.web.cafeinfo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dev.dao.CafeDAO;
import co.dev.service.CafeService;
import co.dev.vo.CafeVO;
import co.dev.web.Controller;

public class CafeInfoSelectControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("application/json;charset=utf-8");
		int cafeNo = Integer.parseInt(request.getParameter("no"));
		
		System.out.println(cafeNo);
		CafeService service = new CafeDAO();
		CafeVO vo = service.selecCafe(cafeNo);
		
		request.setAttribute("cafeinfo", vo);
		request.getRequestDispatcher("/review.do").forward(request, response);
		
	}

}
