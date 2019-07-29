package spring.data;


import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
@Repository
public class FoodDao extends SqlSessionDaoSupport {
	
	public List<FoodDto> getKindFood(int kind){
		
		List<FoodDto> list=new ArrayList<FoodDto>();
		list=getSqlSession().selectList("ReserGetKind",kind);
		return list;
	}
	public FoodDto getOneFood(int idx){
		
		FoodDto dto=getSqlSession().selectOne("ReserOneFood",idx);
		return dto;
	}
	public List<FoodDto> getBestfive(){
		List<FoodDto> list=new ArrayList<FoodDto>();
		list=getSqlSession().selectList("ReserBestmenufive");
		return list;
	}
	public int getFoodIdx(String fname) {
		return getSqlSession().selectOne("getFoodIdx",fname);
	}
}
