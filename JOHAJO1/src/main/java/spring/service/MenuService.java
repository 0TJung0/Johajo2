package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.MenuDao;
import spring.data.MenuDto;

@Service
public class MenuService {
	@Autowired
	private MenuDao dao;
	
	
	public List<MenuDto> getData()
	{
		return dao.getData();
	}
	
	public List<MenuDto> getDataSel(int kind)
	{
		return dao.getDataSel(kind);
	}
	public MenuDto getDataIdx(int idx)
	{
		return dao.getDataIdx(idx);
	}
	
	public List<MenuDto> getDataList(int kind, int idx)
	{
		return dao.getDataList(kind, idx);
	}
	
	/* 관리자용 */
	public void insertMenu(MenuDto dto)
	{
		dao.insertMenu(dto);
	}
	
	public void updateMenu(MenuDto dto)
	{
		dao.menuUpdate(dto);
	}
	
	public void deleteMenu(int idx)
	{
		dao.menuDelete(idx);
	}
}