package spring.data;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;


@Repository //xml에 자동 등록
public class CourseDao extends SqlSessionDaoSupport {
	
	public CourseDto getData(String course_name)
	{
		return getSqlSession().selectOne("courseSelectList",course_name);
	}
	
	public CourseDto getCourseData(int idx)
	{
		return getSqlSession().selectOne("courseList",idx);
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
	
}
