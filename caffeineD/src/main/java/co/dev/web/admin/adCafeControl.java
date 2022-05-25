package co.dev.web.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dev.service.AdService;
import co.dev.vo.CafeVO;
import co.dev.web.Controller;

public class adCafeControl implements Controller {

	private String job;
	
	public adCafeControl(String job) {
		this.job = job;
	}

	AdService service = new AdService(); 
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/json;charset=utf-8");
		
		if (job.equals("insert")) {
			
			String adCafeNo = request.getParameter("cafe_no");
			String adCafeInfo = request.getParameter("cafe_info");
			
			boolean result = service.adInsert(adCafeNo, adCafeInfo);
			
			if (result) {
				response.sendRedirect("/caffeineD/adList.do");
			}
			
		} else if (job.equals("delete")) {
			
			String adCafeNo = request.getParameter("cafe_no");

			boolean result = service.adDelete(adCafeNo);
			
			if (result) {
				response.getWriter().print("{\"messege\" : \"광고 삭제가 완료되었습니다.\"}");
			} else {
				response.getWriter().print("{\"messege\" : \"정상적으로 처리되지 않았습니다.\"}");
			}
			
		} else if (job.equals("update")) {
			
			String adCafeNo = request.getParameter("cafe_no");
			String adCafeInfo = request.getParameter("cafe_info");
			
			boolean result = service.adUpdate(adCafeNo, adCafeInfo);
			
			if (result) {
				response.getWriter().print("{\"messege\" : \"광고 수정이 완료되었습니다.\"}");
			} else {
				response.getWriter().print("{\"messege\" : \"정상적으로 처리되지 않았습니다.\"}");
			}
			
			
		}
		
		

	}

}
