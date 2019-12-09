/**
 * 
 */
package com.zhiyou.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou.mapper.UserMapper;
import com.zhiyou.model.User;
import com.zhiyou.service.UserService;

/**
 * @ClassName: UserServiceImpl
 * @Description: TODO
 * @author Administrator
 * @date 2019年12月2日
 *
 */
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper mapper;

	@Override
	public User selectByUsername(HttpServletRequest req, String accounts, String password) {
		User user = mapper.selectByAccounts(accounts);
		if (user != null) {
			if (user.getPassword().equals(password)) {
			} else {
				req.getSession().setAttribute("msg", "密码错误请重新输入");
				return null;
			}
		} else {
			req.setAttribute("msg", "用户不存在");
		}
		return user;
	}

	@Override
	public void addUser(User user) {
		mapper.addUser(user);
	}

	@Override
	public User selectByUsername(HttpServletRequest req, String accounts) {
		User user = mapper.selectByAccounts(accounts);
		return user;
	}

	@Override
	public User updateUser(User user) {
		// TODO Auto-generated method stub
		mapper.updateUser(user);
		return user;
	}

	@Override
	public User selectById(int id) {
		// TODO Auto-generated method stub
		return mapper.selectById(id);
	}

	@Override
	public User selectByAccounts(String accounts) {
		User user = mapper.selectByAccounts(accounts);
		if (user != null) {
			return user;
		} else {
			return null;
		}
	}

	@Override
	public boolean selectUser(User user) {
		List<User> list = mapper.selectUser(user);
		if (list.size() != 0) {
			return true;// true代表有
		} else {
			return false;
		}
	}

}
