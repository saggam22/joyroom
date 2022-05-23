package co.dev.web.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dev.service.ReviewService;
import co.dev.web.Controller;

public class StarAvgControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/json;charset=utf-8");
		String cafeNo = request.getParameter("cafeNo");
		ReviewService service = new ReviewService();
		float[] reviewInfo = service.reviewInfoSelect(Integer.valueOf(cafeNo));
		int[] starCount = service.starCountSelect(Integer.valueOf(cafeNo));
		
		float starAvg = reviewInfo[0];
		int reviewCount = (int) reviewInfo[1];
		
		response.getWriter().print("{\"starAvg\" : \""+starAvg+"\", \"reviewCount\" : \""+reviewCount+"\"");
		
		for (int i = 0; i<starCount.length; i++) {
			System.out.println(starCount[i]);
			response.getWriter().print(",\"starCount_"+(i+1)+"\" : \""+starCount[i]+"\"");
		}
		response.getWriter().print("}");
	}

}
