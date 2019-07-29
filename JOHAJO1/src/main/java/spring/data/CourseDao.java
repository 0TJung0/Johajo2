package spring.data;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;


@Repository //xml에 자동 등록
public class CourseDao extends SqlSessionDaoSupport {
	
	public List<CourseDto> getList()
	{
		return getSqlSession().selectList("courseSelect");
	}
	
	public CourseDto getData(String course_name)
	{
		return getSqlSession().selectOne("courseSelectList",course_name);
	}
	
	public CourseDto getCourseData(int idx)
	{
		return getSqlSession().selectOne("courseList",idx);
	}
	
	public List<FoodDto> getKindData(int kind)
	{
		return getSqlSession().selectList("courseKindList",kind);
	}
	public List<FoodDto> getKindData2(int kind)
	{
		return getSqlSession().selectList("courseKindList2",kind);
	}
	
	public CourseDto getCourseformData(int idx)
	{
		return getSqlSession().selectOne("courseformList",idx);
	}

	/* 관리자용 */
	
	public void insertCourse(CourseDto dto)
	{
		getSqlSession().insert("courseInsert",dto);
	}
	public void courseUpdate(CourseDto dto)
	{
		getSqlSession().update("courseUpdate",dto);
	}
	
	public List<CourseDto> rescourselist() {
		return getSqlSession().selectList("rescourselist");
	}
	
	public void courseDelete(int idx)
	{
		getSqlSession().delete("courseDelete",idx);
	}
	
}