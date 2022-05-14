package co.dev.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dev.service.CfnService;
import co.dev.vo.ReviewVO;

public class MyReviewListControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//String user = request.getParameter("id");
		String user = "wlqls12@naver.com";
		
		CfnService service = new CfnService();
		List<ReviewVO> list = service.myReviewList(user);
		
		request.setAttribute("myReviewList", list);
		
		request.getRequestDispatcher("view/myReview.jsp").forward(request, response);

	}

}
