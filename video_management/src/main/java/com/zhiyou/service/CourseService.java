/**
 * 
 */
package com.zhiyou.service;

import java.util.List;

import com.zhiyou.model.Course;
import com.zhiyou.model.Subject;

/**
 * @ClassName: CourseService
 * @Description: TODO
 * @author Administrator
 * @date 2019年12月6日
 *
 */
public interface CourseService {
	// 通过id查找所有信息
	Course selectById(int id);

	// 通过学科id查询
	List<Course> selectBySubjectId(int id);

	int selectCourseCount();

	List<Course> selectAll(int page, int count);

	/*
	 * 查询学科所有
	 */
	List<Subject> selectSubjectAll();

	void add(Course course);

	void delete(int id);

	void update(Course course);

	int courseAll(List<Integer> courseIds);

	List<Course> courseSelectAll();
}
