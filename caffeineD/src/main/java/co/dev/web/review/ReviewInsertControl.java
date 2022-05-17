package co.dev.web.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.dev.service.CfnService;
import co.dev.vo.ReviewVO;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class ReviewInsertControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String saveDir = "upload";
		saveDir = request.getServletContext().getRealPath(saveDir);
		int maxSize = 1024 * 1024 * 10;
		String encoding = "UTF-8";
		
		MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String cafeNo = multi.getParameter("cafeNo");
		String star = multi.getParameter("star");
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
			request.getSession().setAttribute("error", "10자 이상 입력해 주세요.");
			request.getRequestDispatcher("/review.do").forward(request, response);
			return;
		}
				
		
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("user");
		String userId = uvo.getId();
		String userNick = uvo.getNickname();
		String userImg = uvo.getImg();

		
		CfnService service = new CfnService();
		
		ReviewVO rvo = new ReviewVO();
		rvo.setCafeNo(Integer.valueOf(cafeNo));
		rvo.setUserId(userId);
		rvo.setUserNick(userNick);
		rvo.setUserImg(userImg);
		rvo.setStar(Integer.valueOf(star));
		rvo.setContent(content);
		
		if(img!=null) {			
			rvo.setImg(img);
		}
		
		service.reviewInsert(rvo);
		
		request.getSession().setAttribute("success", "리뷰 등록이 완료되었습니다.");
		response.sendRedirect("review.do");
		
//		request.getRequestDispatcher("/review.do").forward(request, response);

	}

}
