
package spring.data;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class singlebasketDao extends SqlSessionDaoSupport{
	public List<mSearchDto> getbasketlist(singlebasketDto sdto){
		return getSqlSession().selectList("mBasketlist",sdto);
	}
	public void Insertmbasket(singlebasketDto dto) {
		
		getSqlSession().insert("mBasketInsert",dto);
	}
	public int checkmbasket(singlebasketDto dto) {
		return getSqlSession().selectOne("mBasketCh",dto);
	}
	public void updatembasket(singlebasketDto dto) {
		getSqlSession().update("mBasketupdate",dto);
	}
	public int mBasketcountcheck(int idx) {
		return getSqlSession().selectOne("mBasketcountcheck",idx);
	}
	public void mBasketaddupdate(singlebasketDto dto) {
		getSqlSession().update("mBasketaddupdate",dto);
	}
	public void mBasketResfin(singlebasketDto dto) {
		getSqlSession().update("mBasketResfin",dto);
	}
}

