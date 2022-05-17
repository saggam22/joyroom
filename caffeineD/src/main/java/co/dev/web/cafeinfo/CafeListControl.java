package co.dev.web.cafeinfo;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.dev.dao.CafeDAO;
import co.dev.service.CafeService;
import co.dev.vo.CafeVO;
import co.dev.web.Controller;

public class CafeListControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/json;charset=utf-8");

		String cmd = request.getParameter("cmd");

		CafeService dao = new CafeDAO();
		List<CafeVO> list = null;

		if (cmd.equals("all")) {

			list = dao.cafeList();
			
		} else if (cmd.equals("susung")) {

			list = dao.cafeListRegion("수성구");

		} else if (cmd.equals("seogu")) {

			list = dao.cafeListRegion("서구");

		} else if (cmd.equals("bukgu")) {

			list = dao.cafeListRegion("북구");

		}

		Gson gson = new GsonBuilder().create();
		response.getWriter().print(gson.toJson(list));

	}

}
