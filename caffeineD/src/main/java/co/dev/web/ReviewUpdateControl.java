package co.dev.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.dev.service.CfnService;
import co.dev.vo.ReviewVO;

public class ReviewUpdateControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String saveDir = "upload";
		saveDir = request.getServletContext().getRealPath(saveDir);
		int maxSize = 1024 * 1024 * 10;
		String encoding = "UTF-8";
		
		System.out.println(saveDir);
		
		MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String no = multi.getParameter("reviewNo");
		String star = multi.getParameter("star");
		String content = multi.getParameter("content");
		String img = multi.getFilesystemName("img");
				

		if(content.isBlank()) {
			request.setAttribute("error", "내용을 입력해 주세요.");
			request.getRequestDispatcher("/myReviewList.do").forward(request, response);
			return;
		}
		
		ReviewVO vo = new ReviewVO();
		vo.setNo(Integer.valueOf(no));
		vo.setStar(Integer.valueOf(star));
		vo.setContent(content);
		
		if(img!=null) {			
			vo.setImg(img);
		}

		
		CfnService service = new CfnService();
		service.reviewUpdate(vo);
		
		request.setAttribute("success", "리뷰 수정이 완료되었습니다.");
		
		request.getRequestDispatcher("/myReviewList.do").forward(request, response);
		

	}

}
