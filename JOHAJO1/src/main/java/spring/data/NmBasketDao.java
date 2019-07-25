
package spring.data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class NmBasketDao extends SqlSessionDaoSupport{
	public int getMaxNMCount(){
		return getSqlSession().selectOne("nmMaxBasketCount");
	}
	public int getnMembercount(){
		return getSqlSession().selectOne("nmBasketCount");
	}
	public void nmemberInsert(NmBasketDto dto){
		getSqlSession().insert("nmBasketInsert",dto);
	}
	public int getnmInsertCheck(NmBasketDto dto){
		return getSqlSession().selectOne("nmBasketCheck",dto);
	}
	public void nmemberUpdate(NmBasketDto dto){
		getSqlSession().insert("nmBasketupdate",dto);
	}
	
	public int nmBasketCount(int nmidx){
		return getSqlSession().selectOne("nmBasketC",nmidx);
	}
	public List<mSearchDto> nmBasketlist(int nmidx){
		return getSqlSession().selectList("nmBasketlist",nmidx);
	}
	public int nmBasketPrice(int nmidx) {
		return getSqlSession().selectOne("nmBasketPrice",nmidx);
	}
}
