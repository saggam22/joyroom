package co.dev.web.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dev.dao.UserDAO;
import co.dev.service.UserService;
import co.dev.web.Controller;

public class UserInsertCheckControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/json;charset=utf-8");
		
		String job = request.getParameter("job");
		UserService service = new UserDAO();
		boolean check = false;
		
		//dao조회
		if (job.equals("idCheck")) {
			
			String id = request.getParameter("id");
			check = service.checkId(id);
				
		} else if (job.equals("nicknameCheck")) {
			
			String nickname = request.getParameter("nickname");
			check = service.checkNickname(nickname);		
		}
		
		//결과 확인(true일 경우 중복, false일 경우 사용가능)
		if (check) {
			response.getWriter().print("{\"Check\" : \"true\"}");
		} else {
			response.getWriter().print("{\"Check\" : \"false\"}");
		}

	}

}
