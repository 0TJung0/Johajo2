package spring.service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.CouponDao;
import spring.data.CouponDto;

@Service
public class CouponService {
	@Autowired
	private CouponDao dao;
	
	
	public void insertCoupon(CouponDto dto){
		dao.insertCoupon(dto);
	}
	public int getDataCount(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.getDataCount(map);
	}

	
}
