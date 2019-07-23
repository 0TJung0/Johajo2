package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.singlebasketDao;
import spring.data.mSearchDto;

@Service
public class singlebasketService {
	@Autowired
	private singlebasketDao dao;
	public List<mSearchDto> getbasketlist(int midx){
		return dao.getbasketlist(midx);
	}
}
