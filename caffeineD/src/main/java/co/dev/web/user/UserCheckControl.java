package co.dev.web.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dev.service.CfnService;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class UserCheckControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/json;charset=utf-8");
		String job = request.getParameter("job");
		String userId = request.getParameter("user");
		String totalTel = "";
		int userTel = 0;
		
		if (job.equals("iFind") || job.equals("bFind")) {
			
			String tel1 = request.getParameter("tel1");
			String tel2 = request.getParameter("tel2");
			String tel3 = request.getParameter("tel3");
			totalTel = tel1 + tel2 + tel3;
			userTel = Integer.valueOf(totalTel);
			
		}
		
		
		CfnService service = new CfnService();

		// 아이디 찾기
		if (job.equals("iFind")) {


			System.out.println(totalTel);
			String findId = service.userIdSelect(userTel);
		
			if (findId == null) {
				response.getWriter().print("{\"error\" : \"cannot find\"}");
				return;
				
			} else {
				response.getWriter().print("{\"findId\" : \""+findId+"\"}");
				
			}
			
			
		// 비밀번호 찾기 > 아이디 검색
		} else if (job.equals("bFindId")) {
			
			if (service.userSelect(userId) != null) {
				response.getWriter().print("{\"userCheck\" : \"true\"}");
			} else {
				response.getWriter().print("{\"userCheck\" : \"false\"}");
				
			};
			
		} else if (job.equals("bFind")) {
			

			String findPwd = service.userPwdSelect(userId, userTel);

			
			if (findPwd == null) {
				response.getWriter().print("{\"error\" : \"cannot find\"}");
			} else {
				response.getWriter().print("{\"findPwd\" : \""+findPwd+"\"}");
				
			};
			
		}
		
		

	}

}
