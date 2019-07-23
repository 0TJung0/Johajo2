package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.EventDao;
import spring.data.EventDto;


@Service
public class EventService {
	@Autowired
	private EventDao dao;
	
	public int getTotalCount()
	{
		return dao.getTotalCount();
	}
	
	public List<EventDto> getList(int start, int end)
	{
		return dao.getList(start,end);
	}
	
	public EventDto getData(int idx)
	{
		return dao.getData(idx);
	}
	public List<EventDto> getAllData(){
		return dao.getAllData();
	}
}
