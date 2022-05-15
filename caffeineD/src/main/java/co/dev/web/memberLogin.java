package co.dev.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import co.dev.vo.UserVO;

public class memberLogin implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json;charset=utf-8");
		UserVO vo = new UserVO();
		
		boolean isMulti = ServletFileUpload.isMultipartContent(request);
		
		if(isMulti) {
			String encoding = "UTF-8";
		
			String id = multi.getParameter("uesr_id");
			String pw = multi.getParameter("user_pwd");
			String nick = multi.getParameter("user_nick");
			String tel = multi.getParameter("user_tel");
			String img = multi.getParameter("user_img");
			String grade = multi.getParameter("user_grede");
			
			vo = new UserVO();
			vo.setId(id);
			vo.setPwd(pw);
			vo.setNickname(nick);
			vo.setTel(tel);
			vo.setImg(img);
			vo.setGrade(grade);
			
			UserService service = new UserService();
			service.userService(vo);
			
		} else {
			
			String id = request.getParameter("id");
			String pw = request.getParameter("pwd");
			
			
			vo. new UserVO();
			vo.setId(id);
			vo.setPwd(pw);
			
			UserService service = new UserService();
			service.userService(vo);
			
			response.getWriter().print("처리함");
		}
		
		
		
		
	}

}
