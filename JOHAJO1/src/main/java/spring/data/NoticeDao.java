package spring.data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDao extends SqlSessionDaoSupport {
	
	public int getTotalCount()
	{
		int n=getSqlSession().selectOne("noticeTotalCount");
		return n;
	}
	
	public List<NoticeDto> getList(int start, int end)
	{
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		return getSqlSession().selectList("noticePagingList",map);
				
	}
	
	public NoticeDto getData(int num)
	{
		return getSqlSession().selectOne("noticeSelectData",num);
	}

	public void insertNotice(NoticeDto dto)
	{
		getSqlSession().insert("noticeInsert", dto);
	}
	public void deleteNotice(int idx)
	{
		getSqlSession().delete("noticeDelete",idx);
	}
	
	public List<NoticeDto> noticeShowList()
	{
		return getSqlSession().selectList("noticeShowList");
	}
}
