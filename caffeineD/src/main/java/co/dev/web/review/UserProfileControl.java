package co.dev.web.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dev.service.CfnService;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class UserProfileControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/json;charset=utf-8");
		
		String userId = request.getParameter("id");
		
		CfnService service = new CfnService();
		UserVO vo = service.userSelect(userId);
		String profImg = vo.getImg();
		
		System.out.println(profImg);

		response.getWriter().print("{\"profImg\" : \""+profImg+"\"}");


	}

}
