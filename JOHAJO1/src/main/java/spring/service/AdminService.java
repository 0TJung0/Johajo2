package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.AdminDao;
import spring.data.MenuDto;
import spring.data.NoticeDto;
import spring.data.StoreDto;

@Service
public class AdminService {
	@Autowired
	AdminDao dao;
	
	/*
	 * store=========================================================================
	 */
	
	public List<StoreDto> getStore()
	{
		return dao.getStore();
	}
	
	public void insertStore(StoreDto dto)
	{
		dao.insertStore(dto);
	}
	public void upDataStore(StoreDto dto)
	{
		dao.upDataStore(dto);
	}
	public void deleteStore(int idx)
	{
		dao.deleteStore(idx);
	}
	/*
	 * menu=================================================================================
	 */
	public List<MenuDto> getMenuKind()
	{
		return dao.getMenuKind();
	}
	
	/*
	 * notice==============================================================================
	 */
	public List<NoticeDto> noticeList()
	{
		return dao.noticeList();
	}
	public void noticeState(int idx, int hide)
	{
		dao.noticeState(idx, hide);
	}
	public void noticeUpDate(NoticeDto dto)
	{
		dao.noticeUpDate(dto);
	}
}
