package co.dev.web.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dev.dao.UserDAO;
import co.dev.service.UserService;
import co.dev.vo.PageVO;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class userSearchControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String category = request.getParameter("findType");
		String findKeyword = request.getParameter("findKeyword");

		// 첫페이지
		int pageNum = 1;

		// 페이지버튼 클릭
		if (request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}

		PageVO pasing = new PageVO();
		pasing.setPageNum(pageNum);

		UserService service = new UserDAO();
		int total = service.userSearchCount(category, findKeyword);
		pasing.setTotal(total);
		List<UserVO> list = service.searchUserList(category, findKeyword, pageNum);

		request.setAttribute("paging", pasing);
		request.setAttribute("list", list);

		request.getRequestDispatcher("/view/admin/userList.tiles").forward(request, response);

	}

}
