package co.dev.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.dev.vo.ReviewVO;

public class ReviewInsertControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//int cafeNo = Integer.valueOf(request.getParameter("cafeNo"));
				int cafeNo = 1;
				
				String saveDir = "upload";
				saveDir = request.getServletContext().getRealPath(saveDir);
				int maxSize = 1024 * 1024 * 10;
				String encoding = "UTF-8";
				
				MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
				
				int star = 0;
				String img = multi.getParameter("rimage");
				String contents = multi.getParameter("rcontents");
				

				if(contents.isBlank()) {
					request.setAttribute("error", "내용을 입력해 주세요.");
					request.setAttribute("cafeNo", cafeNo);
					request.getRequestDispatcher("view/cafeListOutput.jsp").forward(request, response);
					return;
				}
				
				
				ReviewVO vo = new ReviewVO();
				request.setAttribute("cafeNo", cafeNo);
				request.getRequestDispatcher("view/cafeListOutput.jsp").forward(request, response);

	}

}
