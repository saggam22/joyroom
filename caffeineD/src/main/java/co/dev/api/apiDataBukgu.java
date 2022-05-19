package co.dev.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import co.dev.dao.CafeDAO;
import co.dev.vo.CafeVO;

public class apiDataBukgu {
	public static void main(String[] args) throws IOException {

		StringBuilder urlBuilder = new StringBuilder("https://api.odcloud.kr/api/15095876/v1/uddi:170b2205-6644-4de7-84dc-80b34a492281"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")+ "=2FmiSQ4c4HNQcQ6eMrBVg4pRxsodEnXzbwQGOLOcb7Il%2BtTSwFCJMHGMuRvjlEiQeab4vnMkJJQbHT2qcqiStQ%3D%3D"); /*Service Key*/
		urlBuilder.append("&" + URLEncoder.encode("page", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 페이지번호 */
		urlBuilder.append("&" + URLEncoder.encode("perPage", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /* 한 페이지 결과 수 */
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		String result = sb.toString();
		System.out.println(result);

		JsonObject jsonObj = (JsonObject) JsonParser.parseString(result);
		JsonArray parse_data = (JsonArray) jsonObj.get("data");

		JsonObject cafeList;
		JsonElement cafe = null;
		String[] field = { "도로명주소", "소재지전화", "사업장명" };

		for (int i = 0; i < parse_data.size(); i++) {
			cafeList = (JsonObject) parse_data.get(i);
			CafeVO vo = new CafeVO();
			for (String key : field) {
				cafe = cafeList.get(key);
				vo.setRegion("북구");

				switch (key) {
				case "도로명주소":
					vo.setAddress(cafe.toString().replace("\"", ""));
					break;
				case "소재지전화":
					vo.setTel(cafe.toString().replace("\"", ""));
					break;
				case "사업장명":
					vo.setName(cafe.toString().replace("\"", ""));
					break;
				}
				System.out.println(cafe);
			}
			CafeDAO dao = new CafeDAO();
			dao.insertCafe(vo);
		}
	}
}