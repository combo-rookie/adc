/**
 * 
 */
package com.zhiyou.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @ClassName: Speaker
 * @Description: TODO
 * @author Administrator
 * @date 2019年12月2日
 *
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Speaker {
	private Integer id;
	private String speaker_name;
	private String speaker_desc;
	private String speaker_job;
	private String pic_url;
}
