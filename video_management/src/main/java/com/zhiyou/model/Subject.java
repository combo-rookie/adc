/**
 * 
 */
package com.zhiyou.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @ClassName: Subject
 * @Description: TODO
 * @author Administrator
 * @date 2019年12月2日
 *
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Subject {
	private Integer subject_id;
	private String subject_name;
	// 学科对课程来说是多的一方
	private List<Course> courses;
}
