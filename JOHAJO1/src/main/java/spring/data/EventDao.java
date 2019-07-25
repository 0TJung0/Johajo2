package spring.data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class EventDao extends SqlSessionDaoSupport {
	
	public int getTotalCount()
	{
		int n=getSqlSession().selectOne("eventTotalCount");
		return n;
	}
	
	public List<EventDto> getList(int start, int end)
	{
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		return getSqlSession().selectList("eventPagingList",map);		
	}
	
	public EventDto getData(int idx)
	{
		return getSqlSession().selectOne("eventSelectData",idx);
	}
	
	public List<EventDto> getAllData(){
		return getSqlSession().selectList("eventAllData");	
	}
}
