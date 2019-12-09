/**
 * 
 */
package com.zhiyou.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.zhiyou.model.Course;
import com.zhiyou.model.Subject;

/**
 * @ClassName: CourseMapper
 * @Description: TODO
 * @author Administrator
 * @date 2019年12月6日
 *
 */

@Repository
public interface CourseMapper {
	// 根据id查询所有课程
	Course selectById(@Param("id") int id);

	// 通过学科id查询
	List<Course> selectBySubjectId(int id);

	void add(Course course);

	void delete(int id);

	void update(Course course);

	List<Course> courseSelectAll();

	List<Course> selectAll(int page, int count);

	int selectCourseCount();

	int courseAll(@Param("courseIds") List<Integer> courseIds);

	// 查询学科所有
	List<Subject> selectSubjectAll();
}
