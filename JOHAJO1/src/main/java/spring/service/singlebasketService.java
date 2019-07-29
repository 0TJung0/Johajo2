
package spring.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.singlebasketDao;
import spring.data.singlebasketDto;
import spring.data.mSearchDto;

@Service
public class singlebasketService {
	@Autowired
	private singlebasketDao dao;
	public List<mSearchDto> getbasketlist(singlebasketDto sdto){
		return dao.getbasketlist(sdto);
	}
	public void insertmbasket(singlebasketDto dto) {
		dao.Insertmbasket(dto);
	}
	public int checkmbasket(singlebasketDto dto) {
		return dao.checkmbasket(dto);
	}
	public void updatembasket(singlebasketDto dto) {
		dao.updatembasket(dto);
	}
	public void mBasketaddupdate(singlebasketDto dto) {
		dao.mBasketaddupdate(dto);
	}
	public void mBasketResfin(singlebasketDto dto) {
		dao.mBasketResfin(dto);
	}
}
