package spring.data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class CouponDao extends SqlSessionDaoSupport {

	
	public int getDataCount(HashMap<String, Object> map){
		return getSqlSession().selectOne("couponSelectCount",map);
	}
	public void InsertCoupon(CouponDto dto)
	{
		getSqlSession().insert("InsertCoupon",dto);
	}
	public int getCouponId(int member_f, int event_f)
	{
		Map<String, Integer>map=new HashMap<String, Integer>();
		map.put("member_f", member_f);
		map.put("event_f", event_f);
		return getSqlSession().selectOne("selCouponId",map);
	}
	public int couponlistcheck(int idx) {
		return getSqlSession().selectOne("couponlistcheck",idx);
	}
	public List<CouponDto> couponlist(int idx){
		return getSqlSession().selectList("couponlist",idx);
	}
	public int getcouponediscount(int idx) {
		return getSqlSession().selectOne("couponegetdiscount",idx);
	}
	public void updateUsecoupone(int idx) {
		getSqlSession().update("usecoupone",idx);
	}
}
