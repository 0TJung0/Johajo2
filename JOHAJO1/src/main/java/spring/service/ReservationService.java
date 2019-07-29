package spring.service;

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
}
