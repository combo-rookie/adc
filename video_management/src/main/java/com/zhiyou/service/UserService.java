/**
 * 
 */
package com.zhiyou.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.zhiyou.model.User;

/**
 * @ClassName: UserService
 * @Description: TODO
 * @author Administrator
 * @date 2019年12月2日
 *
 */
@Service
public interface UserService {
	// 登录判断
	User selectByUsername(HttpServletRequest req, String accounts, String password);

	// 注册添加
	void addUser(User user);

	// 注册判断
	User selectByUsername(HttpServletRequest req, String accounts);

	// 修改
	User updateUser(User user);

	// 根据id查询用户
	User selectById(int id);

	// 根据邮箱查询用户
	User selectByAccounts(String accounts);
}
