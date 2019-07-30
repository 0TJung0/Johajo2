package spring.data;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
@Repository
public class MemberDao  extends SqlSessionDaoSupport{

	public void memberInsert(MemberDto dto) {
		// TODO Auto-generated method stub
		getSqlSession().insert("memberInsert",dto);
	}

	public int memberIdCheck(String id) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("memberIdCheck",id);
	}


	public MemberDto userLoginByIdandPW(Map<String, String> map) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("memberLogin",map);
	}

	public MemberDto selectUserId(Map<String, String> map) {
		// TODO Auto-generated method stub
		
		return getSqlSession().selectOne("selectUserId",map);
	}

	public MemberDto selectUserPw(Map<String, String> map) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("selectUserPw",map);
	}

	public MemberDto userInfoByPass(Map<String, String> map) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("userInfoByPass",map);
	}

	public int getUserCheckCount(Map<String, String> map) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("userCheckCount",map);
	}

	public void memberUpdate(MemberDto dto) {
		getSqlSession().update("userinfoUpdate",dto);
	}

	public int usePoint(int idx) {
		// TODO Auto-generated method stub
		
		return getSqlSession().selectOne("userPointFind",idx);
	}

	public List<MemberDto> MemberCouponSelect(Integer midx) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("userCouponSelect",midx);
	}

	public MemberDto MemberQnaCountSelect(int midx) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("userQnaCountSelect",midx);
	}

	

	public List<MemberDto> memberList()
	{
		return getSqlSession().selectList("memberList");
	}

	public MemberDto memberReservationSelect(Integer midx) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("memberReservationSelect", midx);
	}

	public int memberTotalCount() {
		// TODO Auto-generated method stub
		return  getSqlSession().selectOne("memberTotalCount");
	}
	
	public List<MemberDto> memberTotalSelect(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("memberTotalSelect",map);
	}

	public void memberDelete(int idx) {
		// TODO Auto-generated method stub
		getSqlSession().delete("memberDelete",idx);
	}

}
