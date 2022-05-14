package co.dev.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.dev.service.CfnService;
import co.dev.vo.ReviewVO;

public class ReviewSelectControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/json;charset=utf-8");
		
		//String user = request.getParameter("id");
		String user = "wlqls12@naver.com";
		int reviewNo = Integer.valueOf(request.getParameter("reviewNo"));
		
		CfnService service = new CfnService();
		ReviewVO vo = service.reviewSelect(reviewNo);
		
		Gson gson = new GsonBuilder().create();
		response.getWriter().print(gson.toJson(vo));

	}

}
