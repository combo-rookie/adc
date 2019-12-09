/**
 * 
 */
package com.zhiyou.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @ClassName: Admin
 * @Description: TODO
 * @author Administrator
 * @date 2019年12月2日
 *
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Admin {
	private Integer admin_id;
	private String accounts;
	private String password;
	private String admin_remark;

}
