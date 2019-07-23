package spring.data;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
@Repository
public class ReservationDao extends SqlSessionDaoSupport {

	public void InsertRes(ReservationDto dto) {
		getSqlSession().insert("nmResInsert",dto);
	}

}
