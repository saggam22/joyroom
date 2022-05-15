package co.dev.web.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.dev.service.CfnService;
import co.dev.vo.ReviewVO;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class ReviewUpdateControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String saveDir = "upload";
		saveDir = request.getServletContext().getRealPath(saveDir);
		int maxSize = 1024 * 1024 * 10;
		String encoding = "UTF-8";
		
		System.out.println(saveDir);
		
		MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String userId = "wlqls12@naver.com";
		String no = multi.getParameter("reviewNo");
		String star = multi.getParameter("star");
		String content = multi.getParameter("content");
		String img = multi.getFilesystemName("img");
				

		if(content.isBlank()) {
			request.setAttribute("error", "글을 입력해 주세요.");
			request.getRequestDispatcher("/review.do").forward(request, response);
			return;
		}
		
		if(content.length() < 10) {
			request.setAttribute("error", "10자 이상 입력해 주세요.");
			request.getRequestDispatcher("/review.do").forward(request, response);
			return;
		}
		
		CfnService service = new CfnService();
		
		ReviewVO vo = new ReviewVO();
		vo.setNo(Integer.valueOf(no));
		vo.setStar(Integer.valueOf(star));
		vo.setContent(content);
		
		if(img!=null) {			
			vo.setImg(img);
		}

		service.reviewUpdate(vo);
		
		request.setAttribute("success", "리뷰 수정이 완료되었습니다.");
		
		request.getRequestDispatcher("/myReviewList.do").forward(request, response);
		

	}

}