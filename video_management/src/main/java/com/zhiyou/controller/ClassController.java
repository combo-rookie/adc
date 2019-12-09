/**
 * 
 */
package com.zhiyou.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhiyou.model.Course;
import com.zhiyou.model.User;
import com.zhiyou.model.Video;
import com.zhiyou.service.CourseService;
import com.zhiyou.service.UserService;
import com.zhiyou.service.VideoService;

/**
 * @ClassName: ClassController
 * @Description: TODO
 * @author Administrator
 * @date 2019年12月6日
 *
 */
@Controller
public class ClassController {

	@Autowired
	UserService userService;

	@Autowired
	CourseService courseService;

	@Autowired
	VideoService videoService;

	@RequestMapping("/webClass")
	public void webClass(String accounts, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		User user = userService.selectByAccounts(accounts);
		System.out.println(user);
		int subject_id = 1;
		// 获取该学科下的所有课程 `根据course_id

		List<Course> list2 = courseService.selectBySubjectId(subject_id);

		req.getSession().setAttribute("list2", list2);

		req.getSession().setAttribute("user", user);
		req.getSession().setAttribute("subject_id", subject_id);
		req.getRequestDispatcher("Web/web.jsp").forward(req, resp);
	}

	@RequestMapping("/uiClass")
	public void uiClass(String accounts, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		User user = userService.selectByAccounts(accounts);
		int subject_id = 6;
		// 获取该学科下的所有课程 `根据course_id
		List<Course> list2 = courseService.selectBySubjectId(subject_id);
		req.getSession().setAttribute("list2", list2);

		req.getSession().setAttribute("user", user);
		req.getSession().setAttribute("subject_id", subject_id);
		req.getRequestDispatcher("Web/web.jsp").forward(req, resp);
	}

	@RequestMapping("/pyClass")
	public void pyClass(String accounts, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		User user = userService.selectByAccounts(accounts);
		int subject_id = 10;
		// 获取该学科下的所有课程 `根据course_id
		List<Course> list2 = courseService.selectBySubjectId(subject_id);
		req.getSession().setAttribute("list2", list2);

		req.getSession().setAttribute("user", user);
		req.getSession().setAttribute("subject_id", subject_id);
		req.getRequestDispatcher("Web/web.jsp").forward(req, resp);
	}

	@RequestMapping("/phpClass")
	public void phpClass(String accounts, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		User user = userService.selectByAccounts(accounts);
		int subject_id = 11;
		// 获取该学科下的所有课程 `根据course_id
		List<Course> list2 = courseService.selectBySubjectId(subject_id);
		req.getSession().setAttribute("list2", list2);

		req.getSession().setAttribute("user", user);
		req.getSession().setAttribute("subject_id", subject_id);
		req.getRequestDispatcher("Web/web.jsp").forward(req, resp);
	}

	@RequestMapping("/playvideo")
	public void playvideo(Integer video_id, Integer subject_id, User user, HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("1111111111===========");

		req.setAttribute("user", user);

		// 获取视频地址和老师信息
		List<Video> video = videoService.selectVideoUrl(video_id);

		// 查询课程信息和教师信息
		List<Video> videos = videoService.selectAlls(subject_id);
		// 创建一个集合用于接受以上两条数据
		List<List> list3 = new ArrayList<List>();
		list3.add(video);
		list3.add(videos);
		req.getSession().setAttribute("list3", list3);

		req.getRequestDispatcher("Web/video.jsp").forward(req, resp);
	}

}
