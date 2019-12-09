/**
 * 
 */
package com.zhiyou.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhiyou.model.Course;
import com.zhiyou.model.Speaker;
import com.zhiyou.model.Video;

/**
 * @ClassName: VideoService
 * @Description: TODO
 * @author Administrator
 * @date 2019年12月6日
 *
 */
public interface VideoService {
	// 获取视频地址和教师信息
	List<Video> selectVideoUrl(Integer video_id);

	// 查询课程信息和教师信息
	List<Video> selectAlls(Integer id);

	void add(Video video);

	void delete(int id);

	void update(Video video);

	Video selectById(int id);

	int selectVideoCount();

	List<Video> selectAll3(int page, int count);

	int dAll(List<Integer> userIdList);

	List<Video> selectLikeVideo(@Param("title") String title, @Param("speaker_id") int speaker_id,
			@Param("course_id") int course_id);

	List<Course> seleteCourse();

	// 查询speaker主讲人的所有
	List<Speaker> selectSpeaker();
}
