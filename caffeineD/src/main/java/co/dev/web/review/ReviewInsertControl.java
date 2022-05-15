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

public class ReviewInsertControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String saveDir = "upload";
		saveDir = request.getServletContext().getRealPath(saveDir);
		int maxSize = 1024 * 1024 * 10;
		String encoding = "UTF-8";
		
		MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String cafeNo = multi.getParameter("cafeNo");
		String star = multi.getParameter("star");
		String userId = multi.getParameter("user");
		String content = multi.getParameter("content");
		String img = multi.getFilesystemName("img");
				

		if(content.isBlank()) {
			request.setAttribute("error", "글을 입력해 주세요.");
			request.getRequestDispatcher("/review.do").forward(request, response);
			return;
		}
		
		if(star.isBlank()) {
			request.setAttribute("error", "평점을 선택해 주세요.");
			request.getRequestDispatcher("/review.do").forward(request, response);
			return;
		}
		
		if(content.length() < 10) {
			request.setAttribute("error", "10자 이상 입력해 주세요.");
			request.getRequestDispatcher("/review.do").forward(request, response);
			return;
		}
				

		CfnService service = new CfnService();
		UserVO uvo = service.userSelect(userId);
		
		ReviewVO rvo = new ReviewVO();
		rvo.setCafeNo(Integer.valueOf(cafeNo));
		rvo.setUserId(userId);
		rvo.setUserNick(uvo.getNickname());
		rvo.setStar(Integer.valueOf(star));
		rvo.setContent(content);
		
		if(img!=null) {			
			rvo.setImg(img);
		}
		
		service.reviewInsert(rvo);
		
		request.setAttribute("success", "리뷰 등록이 완료되었습니다.");
		request.getRequestDispatcher("/review.do").forward(request, response);

	}

}
