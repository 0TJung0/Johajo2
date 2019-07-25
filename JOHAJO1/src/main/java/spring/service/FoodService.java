package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import spring.data.FoodDao;
import spring.data.FoodDto;

@Service
public class FoodService {
	@Autowired
	public FoodDao dao;
	
	public List<FoodDto> getKindFood(int kind){
		return dao.getKindFood(kind);
	}
	public FoodDto getOneFood(int idx) {
		//System.out.println("여기");
		return dao.getOneFood(idx);
		
	}
	public List<FoodDto> getBestfive(){
		return dao.getBestfive();
	}
}
