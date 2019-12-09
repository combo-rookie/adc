/**
 * 
 */
package com.zhiyou.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou.mapper.VideoMapper;
import com.zhiyou.model.Course;
import com.zhiyou.model.Speaker;
import com.zhiyou.model.Video;
import com.zhiyou.service.VideoService;

/**
 * @ClassName: VideoServiceImpl
 * @Description: TODO
 * @author Administrator
 * @date 2019年12月6日
 *
 */
@Service
public class VideoServiceImpl implements VideoService {
	@Autowired
	VideoMapper Mapper;

	@Override
	public List<Video> selectVideoUrl(Integer video_id) {
		// TODO Auto-generated method stub
		return Mapper.selectVideoUrl(video_id);
	}

	@Override
	public List<Video> selectAlls(Integer id) {
		// TODO Auto-generated method stub
		return Mapper.selectAlls(id);
	}

	@Override
	public void add(Video video) {
		Mapper.add(video);

	}

	@Override
	public void delete(int id) {
		Mapper.delete(id);
	}

	@Override
	public void update(Video video) {
		Mapper.update(video);
	}

	@Override
	public Video selectById(int id) {
		return Mapper.selectById(id);
	}

	@Override
	public int selectVideoCount() {

		return Mapper.selectVideoCount();
	}

	@Override
	public List<Video> selectAll3(int page, int count) {
		return Mapper.selectAll3(page, count);
	}

	@Override
	public int dAll(List<Integer> userIdList) {

		return Mapper.dAll(userIdList);
	}

	@Override
	public List<Video> selectLikeVideo(String title, int speaker_id, int course_id) {
		// TODO Auto-generated method stub
		return Mapper.selectLikeVideo(title, speaker_id, course_id);
	}

	@Override
	public List<Course> seleteCourse() {
		// TODO Auto-generated method stub
		return Mapper.seleteCourse();
	}

	@Override
	public List<Speaker> selectSpeaker() {
		// TODO Auto-generated method stub
		return Mapper.selectSpeaker();
	}

}
