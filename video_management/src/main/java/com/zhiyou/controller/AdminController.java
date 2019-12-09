package com.zhiyou.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhiyou.model.Admin;
import com.zhiyou.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	AdminService service;

	@RequestMapping("login")
	public void show(HttpServletRequest req, HttpServletResponse rep, String password, String accounts)
			throws ServletException, IOException {
		System.out.println("111111111");
		System.out.println("111111111");

		System.out.println("111111111");
		System.out.println("111111111");
		System.out.println("111111111");
		System.out.println("111111111");
		System.out.println("111111111");

		Admin admin = service.selectByAccounts(req, accounts, password);
		req.getSession().setAttribute("admin", admin);
		if (admin == null) {
			req.getRequestDispatcher("login.jsp").forward(req, rep);
		} else {
			System.out.println("登录成功");
			req.getRequestDispatcher("course").forward(req, rep);
		}
	}

}
