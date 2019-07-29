
package spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.NmBasketDao;
import spring.data.NmBasketDto;
import spring.data.mSearchDto;
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
	public void insertnMemberBasket(NmBasketDto dto){
		dao.nmemberInsert(dto);
	}
	public int insertCheck(NmBasketDto dto){
		return dao.getnmInsertCheck(dto);
	}
	public void updatenMemberBasket(NmBasketDto dto){
		dao.nmemberUpdate(dto);
	}
	public int nmBasketCount(int nmidx){
		return dao.nmBasketCount(nmidx);
	}
	public List<mSearchDto> nmBasketList(NmBasketDto dto){
		return dao.nmBasketlist(dto);
	}
	public int nmBasketPrice(int nmidx) {
		return dao.nmBasketPrice(nmidx);
	}
	public void updatendelBasket(NmBasketDto dto) {
		dao.nmemberdelBasket(dto);
	}
	//count 갯수 구하는 
	public int nmBasketcountcheck(NmBasketDto dto) {
		return dao.nmBasketcountcheck(dto);
	}
	public void nmBasketDelete(NmBasketDto dto) {
		dao.nmBasketdelete(dto);
	}
}
