package spring.data;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class CouponDao extends SqlSessionDaoSupport {

	
	public int getDataCount(HashMap<String, Object> map){
		return getSqlSession().selectOne("couponSelectCount",map);
	}
	public void insertCoupon(CouponDto dto){
		getSqlSession().insert("eventInsertCoupon",dto);
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
}
