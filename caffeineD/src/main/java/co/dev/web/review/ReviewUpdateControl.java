package co.dev.web.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.dev.service.ReviewService;
import co.dev.vo.ReviewVO;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class ReviewUpdateControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String saveDir = "img/reviewimg";
		saveDir = request.getServletContext().getRealPath(saveDir);
		int maxSize = 1024 * 1024 * 10;
		String encoding = "UTF-8";
		
		System.out.println(saveDir);
		
		MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String no = multi.getParameter("reviewNo");
		String star = multi.getParameter("star");
		String content = multi.getParameter("content");
		String img = multi.getFilesystemName("img");
				
		ReviewService service = new ReviewService();
		
		ReviewVO vo = new ReviewVO();
		vo.setNo(Integer.valueOf(no));
		vo.setStar(Integer.valueOf(star));
		vo.setContent(content);
		
		if(img!=null) {			
			vo.setImg(img);
		}

		service.reviewUpdate(vo);
		
		request.getSession().setAttribute("success", "리뷰 수정이 완료되었습니다.");
		response.sendRedirect("myReview.do");
		
//		request.getRequestDispatcher("/myReview.do").forward(request, response);
		

	}

}
