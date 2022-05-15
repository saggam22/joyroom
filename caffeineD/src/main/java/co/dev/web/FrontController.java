package co.dev.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FrontController")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Map<String, Controller> map;

	public FrontController() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {


		map = new HashMap<String, Controller>();

		map.put("/cafeList.do", new CafeListControl());
		
		// review 등록
		map.put("/reviewInsert.do", new ReviewInsertControl());
		
		//api호출
		map.put("/getApiData.do", new ApiDataInsertControl());

	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		String url = request.getRequestURI(); 					
		System.out.println(url);							// /0502_WebProject/memberInsert.do
		String context = request.getContextPath();				
		System.out.println(context);						// /0503_WebProject
		String path = url.substring(context.length());
		System.out.println(path);							// /memberInsert.do

		Controller controller = map.get(path);
		controller.execute(request, response);

	}

}
