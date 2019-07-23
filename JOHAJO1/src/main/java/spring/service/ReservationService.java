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
}
