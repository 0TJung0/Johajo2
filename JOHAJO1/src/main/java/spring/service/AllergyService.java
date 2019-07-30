package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.AllergyDao;
import spring.data.AllergyDto;
import spring.data.MenuDto;

@Service
public class AllergyService {
	@Autowired
	private AllergyDao dao;
	
	public List<AllergyDto> getData()
	{
		return dao.getData();
	}
	
	public List<AllergyDto> getAnameonly()
	{
		return dao.getAnameonly();
	}
	
	public List<MenuDto> getKindonly()
	{
		return dao.getKindonly();
	}
	
	public List<AllergyDto> getList(String aname)
	{
		return dao.getList(aname);
	}
	
	public List<AllergyDto> getAname(String aname)
	{
		return dao.getAname(aname);
	}
	
	public AllergyDto getAllergyDataF(int idx)
	{
		return dao.getAllergyDataF(idx);
	}
	
	public MenuDto getMenuDataIdx(int idx)
	{
		return dao.getMenuDataIdx(idx);
	}
	
	public List<AllergyDto> getAllergyTotalList()
	{
		return dao.getAllergyTotalList();
	}
	
	public List<AllergyDto> getAllergyTotaltap()
	{
		return dao.getAllergyTotaltap();
	}
	
	public List<AllergyDto> getAList()
	{
		return dao.getAList();
	}
	
	
	/* 관리자용 */
	public List<MenuDto> getMenulist()
	{
		return dao.getMenulist();
	}
	
	public void insertAllergy(AllergyDto dto)
	{
		dao.insertAllergy(dto);
	}
	
	public void updateAllergy(AllergyDto dto)
	{
		dao.updateAllergy(dto);
	}
	
	public void deleteAllergy(int f)
	{
		dao.deleteAllergy(f);
	}

	public List<AllergyDto> foodSelect(int f)
	{
		return dao.foodSelect(f);
	}
}