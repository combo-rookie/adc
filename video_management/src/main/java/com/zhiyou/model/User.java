/**
 * 
 */
package com.zhiyou.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @ClassName: User
 * @Description: TODO
 * @author Administrator
 * @date 2019年12月2日
 *
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
	private Integer id;
	private String accounts;
	private String phone;
	private String password;
	private String nickname;
	private String sex;
	private String birthday;
	private String address;
	private String imgurl;
	private Timestamp createtime;
}
