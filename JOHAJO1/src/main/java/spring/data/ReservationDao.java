package spring.data;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
@Repository
public class ReservationDao extends SqlSessionDaoSupport {

	public void InsertRes(ReservationDto dto) {
		getSqlSession().insert("nmResInsert",dto);
	}

	public void InsertResmember(ReservationDto dto) {
		getSqlSession().insert("mResInsert",dto);
	}
	public void InsertResusecoupon(ReservationDto dto) {
		getSqlSession().insert("mResInsertusecoupon",dto);
	}
	public void InsertResusepoint(ReservationDto dto) {
		getSqlSession().insert("mResInsertusepoint",dto);
	}
	public void InsertResuseall(ReservationDto dto) {
		getSqlSession().insert("mResInsertall",dto);
	}
	public int getMaxidx(int midx) {
		return getSqlSession().selectOne("SelectMaxIdx",midx);
	}
}
