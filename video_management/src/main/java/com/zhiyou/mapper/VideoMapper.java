/**
 * 
 */
package com.zhiyou.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.zhiyou.model.Course;
import com.zhiyou.model.Speaker;
import com.zhiyou.model.Video;

/**
 * @ClassName: VideoMapper
 * @Description: TODO
 * @author Administrator
 * @date 2019年12月6日
 *
 */
@Repository
public interface VideoMapper {

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

	int dAll(@Param("userIdList") List<Integer> userIdList);

	/**
	 * 模糊查询
	 * 
	 * @param title
	 * @param speaker_id
	 * @param course_id
	 * @return List<Video>
	 */

	List<Video> selectLikeVideo(@Param("title") String title, @Param("speaker_id") int speaker_id,
			@Param("course_id") int course_id);

	/**
	 * 查询科目所有
	 * 
	 * @param null
	 * @return List<Course>
	 */

	List<Course> seleteCourse();

	// 查询speaker主讲人的所有
	List<Speaker> selectSpeaker();
}
