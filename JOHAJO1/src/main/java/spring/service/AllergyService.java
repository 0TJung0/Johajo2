package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.AllergyDao;
import spring.data.AllergyDto;

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
	
	public List<AllergyDto> getList(String aname)
	{
		return dao.getList(aname);
	}
	
	public List<AllergyDto> getAname(String aname)
	{
		return dao.getAname(aname);
	}
}