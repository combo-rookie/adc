/**
 * 
 */
package com.zhiyou.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.zhiyou.model.User;
import com.zhiyou.service.UserService;
import com.zhiyou.util.FTPUtil;

/**
 * @ClassName: UserController
 * @Description: TODO
 * @author Administrator
 * @date 2019年12月2日
 *
 */
@Controller
public class UserController {

	private static ModelAndView model = new ModelAndView();
	@Resource
	UserService service;

	// 返回首页
	@RequestMapping("return_first")
	public String show() {
		return "front/welcome";
	}

	// 用户登录
	@ResponseBody
	@RequestMapping(value = "/loginUser", method = RequestMethod.POST)
	public String user_login(HttpServletRequest req, HttpServletResponse resp, String email, String password) {
		User user = service.selectByUsername(req, email, password);
		req.getSession().setAttribute("list", user);
		return "success";
	}

	// 退出登录
	@ResponseBody
	@RequestMapping(value = "/exit", method = RequestMethod.POST)
	public String exit(HttpServletRequest req, HttpServletResponse resp) {
		req.getSession().invalidate();
		return "success";
	}

	// 退出个人中心（退出登录）
	@RequestMapping(value = "/exit_center")
	public String exit2(HttpServletRequest req, HttpServletResponse resp) {
		return "welcome";
	}

	// 注册判断邮箱是否存在
	@ResponseBody
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(HttpServletRequest req, HttpServletResponse resp, String email) {

		User user = service.selectByUsername(req, email);

		if (user != null) {
			return "error";
		} else {
			return "success";
		}
	}

	// 注册添加
	@ResponseBody
	@RequestMapping(value = "/add_user", method = RequestMethod.POST)
	public String addUser(HttpServletRequest req, HttpServletResponse resp, User user) {

		service.addUser(user);
		return "success";
	}

	// 个人中心
	@RequestMapping(value = "/person_center")
	public String person_center(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<User> list = new ArrayList<User>();
		list.add((User) req.getSession().getAttribute("list"));
		User user = list.get(0);

		return "front/person_center";
		// req.getRequestDispatcher("person_center").forward(req, resp);
		// model.setViewName("forward:person_center");
		// return model;
	}

	// 完成修改资料
	@RequestMapping(value = "/person_update_finish")
	public String update_finish(HttpServletRequest req, HttpServletResponse resp, User user, int id) {

		service.updateUser(user);
		User list = service.selectById(id);
		req.getSession().setAttribute("list", list);
		return "forward:person_center";

	}

	// 判断原密码是否正确
	@ResponseBody
	@RequestMapping(value = "is_password")
	public void password(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		List<User> list = new ArrayList<User>();
		list.add((User) req.getSession().getAttribute("list"));
		User user = list.get(0);

		String password = user.getPassword();
		String password1 = req.getParameter("old_password");

		String b = "";
		if (password1.equals(password)) {
			b = "true";
		} else {
			b = "false";
		}
		resp.getWriter().write(b);
	}

	// 上更改头像
	@RequestMapping("upload")
	public String upload(MultipartFile image_file, int id, HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		System.out.println("image_file : " + image_file);
		String imgurl = FTPUtil.upload(image_file.getInputStream(), image_file.getOriginalFilename());
		System.out.println("imgurl : " + imgurl);
		service.updateUser(new User(id, null, null, null, null, null, null, null, imgurl, null));
		req.getSession().setAttribute("list", service.selectById(id));
		return "forward:person_center";
	}

}
