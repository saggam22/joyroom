package co.dev.service;

import java.util.List;

import co.dev.dao.adCafeDAO;
import co.dev.vo.adCafeVO;

public class AdService {

	adCafeDAO dao = new adCafeDAO();
	
	public List<adCafeVO> adSelect() {
		return dao.selectAdCafe();
	}

}
