package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.CourseDao;
import spring.data.CourseDto;
import spring.data.FoodDto;


@Service
public class CourseService {
	@Autowired
	private CourseDao dao;
	
	public List<CourseDto> getList()
	{
		return dao.getList();
	}
	
	public CourseDto getData(String course_name)
	{
		return dao.getData(course_name);
	}
	
	public CourseDto getCourseData(int idx)
	{
		return dao.getCourseData(idx);
	}
	
	public List<FoodDto> getKindData(int kind)
	{
		return dao.getKindData(kind);
	}
	public List<FoodDto> getKindData2(int kind)
	{
		return dao.getKindData(kind);
	}
	
	public CourseDto getCourseformData(int idx)
	{
		return dao.getCourseformData(idx);
	}
	
	
	/* 관리자용 */
	public void insertCourse(CourseDto dto) 
	{
		dao.insertCourse(dto);
	}
	
	public void updateCourse(CourseDto dto)
	{
		dao.courseUpdate(dto);
	}
	
	public List<CourseDto> resCourselist(){
		return dao.rescourselist();
	}
	
	public void deleteCourse(int idx)
	{
		dao.courseDelete(idx);
	}

	public CourseDto resCourseOne(int idx) {
		return dao.rescourseOne(idx);
	}
}
