package spring.data;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;


@Repository //xml에 자동 등록
public class AllergyDao extends SqlSessionDaoSupport {
	
	public List<AllergyDto> getData()
	{
		return getSqlSession().selectList("allergySelect");
	}
	
	public List<AllergyDto> getAnameonly()
	{
		return getSqlSession().selectList("allergyAnameonly");
	}
	
	
	public List<AllergyDto> getList(String aname)
	{
		return getSqlSession().selectList("allergyList",aname);
	}
	
	public List<AllergyDto> getAname(String aname)
	{
		return getSqlSession().selectList("allergyAname",aname);
	}
	
	public AllergyDto getAllergyDataF(int idx)
	{
		return getSqlSession().selectOne("allergyDataF",idx);
	}
	
	public MenuDto getMenuDataIdx(int idx)
	{
		return getSqlSession().selectOne("menuDataIdx",idx);
	}
	
	public List<AllergyDto> getAllergyTotalList()
	{
		return getSqlSession().selectList("allergyTotalList");
	}
	
	public List<AllergyDto> getAllergyTotaltap()
	{
		return getSqlSession().selectList("allergyTotaltap");
	}
	
	public List<AllergyDto> getAList()
	{
		return getSqlSession().selectList("allergylist2");
	}
	
	public List<AllergyDto> foodSelect(int f)
	{
		return getSqlSession().selectList("allergyFoodSelect",f);
	}
	
	/* 관리자용 */
	public List<MenuDto> getMenulist()
	{
		return getSqlSession().selectList("allergymlist");
	}
	
	public void insertAllergy(AllergyDto dto)
	{
		getSqlSession().insert("allergyInsert",dto);
	}
	
	public void updateAllergy(AllergyDto dto)
	{
		getSqlSession().update("allergyUpdate",dto);
	}
	
	public void deleteAllergy(int idx)
	{
		getSqlSession().delete("allergyDelete",idx);
	}
}