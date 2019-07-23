package spring.data;

import java.util.HashMap;

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
}
