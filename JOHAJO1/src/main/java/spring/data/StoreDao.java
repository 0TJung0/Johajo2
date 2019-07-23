package spring.data;

import java.util.List;


import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class StoreDao extends SqlSessionDaoSupport {
	
	public int getTotalCount() {
		int n=getSqlSession().selectOne("storeTotalCount");
		return n;
	}
	
	public StoreDto getData(int num)
	{
		StoreDto dto=getSqlSession().selectOne("storeGetData",num);
		return dto;
	}	
	
	public List<StoreDto> getList()
	{
		return getSqlSession().selectList("storeAllData");
	}
	public List<StoreDto> search(String name)
	{
		return getSqlSession().selectList("storeSearch",name);
	}
	public int searchCount(String name)
	{
		int n=getSqlSession().selectOne("storeSearchCount",name);
		return n;
	}
	public int getDataName(String name)
	{
		int n=getSqlSession().selectOne("storeGetDataName",name);
		return n;
	}
}
