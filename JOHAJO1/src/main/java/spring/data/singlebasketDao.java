package spring.data;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class singlebasketDao extends SqlSessionDaoSupport{
	public List<mSearchDto> getbasketlist(int midx){
		return getSqlSession().selectList("mBasketlist",midx);
	}
}
