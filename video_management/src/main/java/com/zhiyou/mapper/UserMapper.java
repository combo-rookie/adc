/**
 * 
 */
package com.zhiyou.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zhiyou.model.User;

/**
 * @ClassName: UserMapper
 * @Description: TODO
 * @author Administrator
 * @date 2019年12月2日
 *
 */
@Repository
public interface UserMapper {
	// 根据账号查询用户是否存在
	User selectByAccounts(String accounts);

	// 注册用户
	void addUser(User user);

	// 修改资料
	void updateUser(User user);

	// 修改密码
	User upatePassword(User user);

	// 根据id查询用户
	User selectById(int id);

	// 查找用户
	List<User> selectUser(User user);

}
