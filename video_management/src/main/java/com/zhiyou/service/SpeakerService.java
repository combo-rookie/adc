package com.zhiyou.service;

import java.util.List;

import com.zhiyou.model.Speaker;

public interface SpeakerService {
	void add(Speaker sp);

	void delete(int id);

	void update(Speaker sp);

	Speaker selectById(int id);

	int selectSpeakerCount();

	List<Speaker> selectAll(int page, int count);

	int speakerAll(List<Integer> speakerList);
}
