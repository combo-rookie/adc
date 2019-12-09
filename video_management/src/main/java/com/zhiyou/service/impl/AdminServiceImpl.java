package com.zhiyou.service.impl;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou.mapper.AdminMapper;
import com.zhiyou.model.Admin;
import com.zhiyou.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminMapper mapper;

	@Override
	public Admin selectByAccounts(HttpServletRequest req, String accounts, String password) {
		System.out.println("------------------");
		Admin admin = mapper.selectByAccounts(accounts);
		System.out.println("1");
		if (admin != null) {
			if (admin.getPassword().equals(password)) {
				return admin;
			} else {
				req.setAttribute("msg", "密码错误");
				return null;
			}
		} else {
			req.setAttribute("msg", "用户不存在");
			return null;
		}

	}

}
