package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.FaqDao;
import spring.data.FaqDto;


@Service
public class FaqService {
	@Autowired
	private FaqDao dao;
	
	public int getTotalCount()
	{
		return dao.getTotalCount();
	}
	
	public List<FaqDto> getList(int start, int end)
	{
		return dao.getList(start,end);
	}
	
	public FaqDto getData(int idx)
	{
		return dao.getData(idx);
	}
}
