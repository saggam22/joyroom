package co.dev.web.review;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.dev.service.CfnService;
import co.dev.vo.ReviewVO;
import co.dev.web.Controller;

public class ReviewControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		//int cafeNo = Integer.valueOf(request.getParameter("cafeNo"));
		int cafeNo = 1;
		
		CfnService service = new CfnService();
		List<ReviewVO> reviewList = service.reviewList(cafeNo);
			
		if (reviewList != null) {
		
			request.setAttribute("reviewList", reviewList);
			request.getRequestDispatcher("view/review.jsp").forward(request, response);
			return;
			
		} else {
			
			request.getRequestDispatcher("view/review.jsp").forward(request, response);
			return;	
			
		}
		

	}

}
