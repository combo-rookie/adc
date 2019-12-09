package com.zhiyou.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhiyou.model.Course;
import com.zhiyou.model.Subject;
import com.zhiyou.service.CourseService;

@Controller
public class CourseController {
	@Autowired
	CourseService service;

	@RequestMapping("course")
	public String login(Course course, HttpServletRequest req, HttpServletResponse rep) {
		int count = service.selectCourseCount();
		System.out.println("++" + count);
		int page = req.getParameter("page") == null || req.getParameter("page") == "" ? 1
				: Integer.valueOf(req.getParameter("page"));

		req.setAttribute("count", count);
		req.setAttribute("page", page);

		List<Course> list = service.selectAll((page - 1) * 5, 5);
		req.setAttribute("list", list);

		return "behind/CourseShow";
	}

	@RequestMapping("CourseAddShow")
	public String CourseAddShow(Course course, HttpServletRequest req, HttpServletResponse rep) {
		List<Subject> subjectList = service.selectSubjectAll();
		req.setAttribute("subjectList", subjectList);
		System.err.println(subjectList);
		return "behind/CourseAdd";
	}

	@RequestMapping("add")
	public String add(Course course, HttpServletRequest req, HttpServletResponse rep) {

		service.add(course);

		return "forward:course";
	}

	@RequestMapping("delete")
	public String delete(int id, HttpServletRequest req, HttpServletResponse rep) {

		service.delete(id);

		return "forward:course";
	}

	@RequestMapping("selectById")
	public String select(int id, HttpServletRequest req, HttpServletResponse rep) {
		req.setAttribute("course", service.selectById(id));
		return "behind/CourseUpdate";
	}

	@RequestMapping("update")
	public String Update(Course course, HttpServletRequest req, HttpServletResponse rep) {

		service.update(course);

		return "forward:course";
	}

	// 批量删除
	@ResponseBody // 不会跳转页面
	@RequestMapping("courseAll")
	public String courseAll(@RequestParam("courseIds[]") Integer[] userIds, HttpServletRequest request,
			HttpServletResponse response) {

		List<Integer> courseIds = Arrays.asList(userIds);

		int num = service.courseAll(courseIds);

		System.out.println(num);

		if (num == 1 || num == 2 || num == 3 || num == 4 || num == 5) {

			return "ok";

		} else {
			return "error";
		}

	}

}
