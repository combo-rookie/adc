package com.zhiyou.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhiyou.model.Speaker;

public interface SpeakerMapper {
	void add(Speaker sp);

	void delete(int id);

	void update(Speaker sp);

	Speaker selectById(int id);

	List<Speaker> selectAll(int page, int count);

	int selectSpeakerCount();

	int speakerAll(@Param("speakerList") List<Integer> speakerList);

	List<Speaker> videoSelectAll();
}
