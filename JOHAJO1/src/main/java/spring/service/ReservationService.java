package spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.ReservationDao;

@Service
public class ReservationService {
	@Autowired
	private ReservationDao dao;
	
	
}
