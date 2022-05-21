package co.dev.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dev.service.AdService;
import co.dev.vo.adCafeVO;

public class mainAdControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AdService service = new AdService();
		List<adCafeVO> list = service.adSelect();
		System.out.println(list.get(0).getNo());

		request.setAttribute("adCafeFirst", list.get(0));
		request.setAttribute("adCafeSecond", list.get(1));
		
		request.getRequestDispatcher("caffeineD.homepage.tiles").forward(request, response);;

	}

}
