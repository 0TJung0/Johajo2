package spring.data;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class TableDao extends SqlSessionDaoSupport {

	public List<TableDto> getAllTable(int idx){
		
		return getSqlSession().selectList("SelectStoreTable",idx);
	}
}
