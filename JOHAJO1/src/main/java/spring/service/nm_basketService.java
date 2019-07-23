package spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.NmBasketDao;
import spring.data.NmBasketDto;
import spring.data.nmSearchDto;
@Service
public class nm_basketService {
	@Autowired
	private NmBasketDao dao;
	
	public int getMaxNMCount(){
		return dao.getMaxNMCount();
	}
	public int getnMembercount(){
		return dao.getnMembercount();
	}
	public void insertnMemberBasket(Map<String, Integer> map){
		dao.nmemberInsert(map);
	}
	public int insertCheck(Map<String, Integer> map){
		return dao.getnmInsertCheck(map);
	}
	public void updatenMemberBasket(Map<String, Integer> map){
		dao.nmemberUpdate(map);
	}
	public int nmBasketCount(int nmidx){
		return dao.nmBasketCount(nmidx);
	}
	public List<nmSearchDto> nmBasketList(int nmidx){
		return dao.nmBasketlist(nmidx);
	}
	public int nmBasketPrice(int nmidx) {
		return dao.nmBasketPrice(nmidx);
	}
}
