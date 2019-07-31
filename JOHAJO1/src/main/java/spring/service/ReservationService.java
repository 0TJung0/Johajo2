package spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.ReservationDao;
import spring.data.ReservationDto;

@Service
public class ReservationService {
	@Autowired
	private ReservationDao dao;
	
	public void InsertnmRes(ReservationDto dto) {
		dao.InsertRes(dto);
	}
	public void InsertResmember(ReservationDto dto) {
		dao.InsertResmember(dto);
	}
	public void InsertResusecoupon(ReservationDto dto) {
		dao.InsertResusecoupon(dto);
	}
	public void InsertResusepoint(ReservationDto dto) {
		dao.InsertResusepoint(dto);
	}
	public void InsertResuseall(ReservationDto dto) {
		dao.InsertResuseall(dto);
	}
	public int getMaxidx(int midx) {
		return dao.getMaxidx(midx);
	}
	public int nmSelectMaxIdx() {
		return dao.nmSelectMaxIdx();
	}
	public ReservationDto getresfin(int idx) {
		return dao.getresfin(idx);
	}
	public List<String> gettablecheck(ReservationDto dto){
		return dao.gettablecheck(dto);
	}
	public int gettablecountcheck(ReservationDto dto) {
		return dao.gettablecountcheck(dto);
	}
}

