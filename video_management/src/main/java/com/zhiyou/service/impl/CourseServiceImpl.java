/**
 * 
 */
package com.zhiyou.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou.mapper.CourseMapper;
import com.zhiyou.model.Course;
import com.zhiyou.model.Subject;
import com.zhiyou.service.CourseService;

/**
 * @ClassName: CourseServiceImpl
 * @Description: TODO
 * @author Administrator
 * @date 2019年12月6日
 *
 */
@Service
public class CourseServiceImpl implements CourseService {

	@Autowired
	CourseMapper Mapper;

	@Override
	public Course selectById(int id) {
		// TODO Auto-generated method stub
		return Mapper.selectById(id);
	}

	@Override
	public List<Course> selectBySubjectId(int id) {
		// TODO Auto-generated method stub
		return Mapper.selectBySubjectId(id);
	}

	@Override
	public void add(Course course) {
		Mapper.add(course);
	}

	@Override
	public void delete(int id) {
		Mapper.delete(id);

	}

	@Override
	public void update(Course course) {
		Mapper.update(course);

	}

	@Override
	public List<Course> selectAll(int page, int count) {

		return Mapper.selectAll(page, count);
	}

	@Override
	public int selectCourseCount() {

		return Mapper.selectCourseCount();
	}

	@Override
	public int courseAll(List<Integer> courseIds) {

		return Mapper.courseAll(courseIds);
	}

	@Override
	public List<Course> courseSelectAll() {

		return Mapper.courseSelectAll();
	}

	@Override
	public List<Subject> selectSubjectAll() {
		// TODO Auto-generated method stub
		return Mapper.selectSubjectAll();
	}
}
