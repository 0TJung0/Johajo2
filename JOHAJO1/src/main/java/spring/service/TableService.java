package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.TableDao;
import spring.data.TableDto;

@Service
public class TableService {
	@Autowired
	private TableDao dao;
	
	public List<TableDto> getList(int idx)
	{
		return dao.getAllTable(idx);
	}
}
