package co.dev.web.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartRequest;

import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.dev.service.ReviewService;
import co.dev.vo.ReviewVO;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class ReviewInsertControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String saveDir = "img/reviewimg";
		saveDir = request.getServletContext().getRealPath(saveDir);
		int maxSize = 1024 * 1024 * 10;
		String encoding = "UTF-8";
		
		MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String cafeNo = multi.getParameter("cafeNo");
		String star = multi.getParameter("star");
		String content = multi.getParameter("content");
		String img = multi.getFilesystemName("img");
				
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("user");
		String userId = uvo.getId();
		String userNick = uvo.getNickname();
		String userImg = uvo.getImg();

		
		ReviewService service = new ReviewService();
		
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
