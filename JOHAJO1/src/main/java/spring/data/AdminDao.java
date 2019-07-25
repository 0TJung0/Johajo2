package spring.data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;


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
	
	/*
	 * notice ==========================================================================
	 */

	public List<NoticeDto> noticeList()
	{
		return getSqlSession().selectList("noticeList");
	}
	
	public void noticeState(int idx, int hide)
	{
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("idx", idx);
		map.put("hide", hide);
		getSqlSession().update("noticeState", map);
	}
	
	public void noticeUpDate(NoticeDto dto)
	{
		getSqlSession().update("noticeUpDate", dto);
	}
}
