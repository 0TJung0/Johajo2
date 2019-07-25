
package spring.data;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class singlebasketDao extends SqlSessionDaoSupport{
	public List<mSearchDto> getbasketlist(int midx){
		return getSqlSession().selectList("mBasketlist",midx);
	}
	public void Insertmbasket(singlebasketDto dto) {
		
		getSqlSession().insert("mBasketInsert",dto);
	}
	public int checkmbasket(singlebasketDto dto) {
		return getSqlSession().insert("mBasketCheck",dto);
	}
	public void updatembasket(singlebasketDto dto) {
		getSqlSession().update("mBasketupdate",dto);
	}
}

