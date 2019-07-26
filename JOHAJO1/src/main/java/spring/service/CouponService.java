package spring.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.CouponDao;
import spring.data.CouponDto;

@Service
public class CouponService {
	@Autowired
	private CouponDao dao;
	public int getDataCount(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.getDataCount(map);
	}
	
	public void InsertCoupon(CouponDto dto)
	{
		dao.InsertCoupon(dto);
	}
	public int getCouponId(int member_f, int event_f)
	{
		return dao.getCouponId(member_f, event_f);
	}
}