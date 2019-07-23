package spring.data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class FaqDao extends SqlSessionDaoSupport {
	
	public int getTotalCount()
	{
		int n=getSqlSession().selectOne("faqTotalCount");
		return n;
	}
	
	public List<FaqDto> getList(int start, int end)
	{
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		return getSqlSession().selectList("faqPagingList",map);		
	}
	
	public FaqDto getData(int num)
	{
		return getSqlSession().selectOne("faqSelectData",num);
	}
}
