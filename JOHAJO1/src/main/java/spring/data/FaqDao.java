package spring.data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class FaqDao extends SqlSessionDaoSupport {
	
	public List<FaqDto> FaQList()
	{
		return getSqlSession().selectList("FaQList");
	}
	
	public List<FaqDto> FnQSelKind(int kind)
	{
		return getSqlSession().selectList("FnQSelKind",kind);
	}
	public FaqDto FaQGetData(int idx)
	{
		return getSqlSession().selectOne("FaQGetData",idx);
	}
	public void FaQInsert(FaqDto dto)
	{
		getSqlSession().insert("FaQInsert", dto);
	}
	public void FaQDelete(int idx)
	{
		getSqlSession().delete("FaQDelete", idx);
	}
	public void FaQUpData(FaqDto dto)
	{
		getSqlSession().insert("FaQUpData", dto);
	}
	public void FaQChangeState(int idx,int hide)
	{
		Map<String,Integer> map=new HashMap<String, Integer>();	
		map.put("idx", idx);
		map.put("hide", hide);
		getSqlSession().update("FaQChangeState", map);
	}
	public int totalCount()
	{
		return getSqlSession().selectOne("totalCount");
	}
	public int kindCount(int kind)
	{
		return getSqlSession().selectOne("kindCount",kind);
	}
}
