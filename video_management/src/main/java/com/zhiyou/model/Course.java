/**
 * 
 */
package com.zhiyou.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @ClassName: Course
 * @Description: TODO
 * @author Administrator
 * @date 2019年12月2日
 *
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Course {
	private Integer id;
	private String course_title;
	private String course_desc;
	private Integer subject_id;

	// 学科的少的一份
	Subject subject;
	// 视频的多的一方
	List<Video> videos;
}
