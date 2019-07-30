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
	public int getEndTotalCount()
	{
		int n=getSqlSession().selectOne("EndeventTotalCount");
		return n;
	}
	
	public List<EventDto> getList(int start, int end)
	{
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		return getSqlSession().selectList("eventPagingList",map);		
	}
	
	public List<EndEventDto> getEndList(int start, int end)
	{
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		return getSqlSession().selectList("eventPagingEndList",map);		
	}
	public EventDto getData(int idx)
	{
		return getSqlSession().selectOne("eventSelectData",idx);
	}
	
	public List<EventDto> getAllData(){
		return getSqlSession().selectList("eventAllData");	
	}
	
	public List<EventDto> AbleList()
	{
		return getSqlSession().selectList("eventAble");
	}
	
	public List<EventDto> EndList()
	{
		return getSqlSession().selectList("eventEnd");
	}
	public List<EventDto> StartList()
	{
		return getSqlSession().selectList("eventStart");
	}
	public void deleteEvent(int idx)
	{
		getSqlSession().delete("eventDelete", idx);
	}
	public void insertEvent(EventDto dto)
	{
		getSqlSession().insert("eventInsert", dto);
	}
	public void updateEvent(EventDto dto)
	{
		getSqlSession().insert("eventUpdate", dto);
	}
	public int EventShowCount()
	{
		return getSqlSession().selectOne("EventShowTotalCount");
	}
}
