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
	
	public List<FaqDto> FaQList()
	{
		return dao.FaQList();
	}
	public List<FaqDto> FnQSelKind(int kind)
	{
		return dao.FnQSelKind(kind);
	}
	
	public FaqDto FaQGetData(int idx)
	{
		return dao.FaQGetData(idx);
	}
	public void FaQDelete(int idx)
	{
		dao.FaQDelete(idx);
	}
	public void FaQInsert(FaqDto dto)
	{
		dao.FaQInsert(dto);
	}
	public void FaQUpData(FaqDto dto)
	{
		dao.FaQUpData(dto);
	}
	public void FaQChangeState(int idx,int hide)
	{
		dao.FaQChangeState(idx, hide);
	}
}
