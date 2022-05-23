package co.dev.web.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dev.service.AdService;
import co.dev.vo.adCafeVO;
import co.dev.web.Controller;

public class adCafeListControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AdService service = new AdService();
		List<adCafeVO> list = service.adList();
		
		request.setAttribute("adCafeList", list);
		request.getRequestDispatcher("/view/admin/adCafeList.tiles").forward(request, response);

	}

}
