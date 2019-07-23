package spring.data;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sun.prism.paint.Stop;

@Repository
public class AdminDao extends SqlSessionDaoSupport {
	/*
	 * store==========================================================================
	 */
	
	
	public List<StoreDto> getStore()
	{
		return getSqlSession().selectList("storeAllData");
	}
	
	public void insertStore(StoreDto dto)
	{
		getSqlSession().insert("storeInsert", dto);
	}
	
	public void upDataStore(StoreDto dto)
	{
		getSqlSession().update("storeUpData", dto);
	}
	public void deleteStore(int idx)
	{
		getSqlSession().delete("storeDelete", idx);
	}
	
	
	/*
	 * menu================================================================
	 */
	public List<MenuDto> getMenuKind()
	{
		return getSqlSession().selectList("menuSelectKind");
	}

}
