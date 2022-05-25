package co.dev.web.cafeinfo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.dev.dao.CafeDAO;
import co.dev.service.CafeService;
import co.dev.web.Controller;

public class CafeInfoUpdateControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String saveDir = "img/noticeimg";
		saveDir = request.getServletContext().getRealPath(saveDir); //getServletContext() 프로젝트명 .getRealPath(saveDir) 폴더명을 읽어옴
		int maxSize = 1024*1024*5; //(5메가바이트)
		String encoding = "UTF-8";
		
		MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
		
		int cafeNo = Integer.parseInt(multi.getParameter("cafeNo"));
		String newImg = multi.getFilesystemName("newImg");
		
		CafeService service = new CafeDAO();
		service.updateCafe(cafeNo, newImg);

		request.getSession().setAttribute("success", "수정이 완료되었습니다.");
		response.sendRedirect("cafeList.do?path=admin");
		
	}

}
