package com.zhiyou.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou.mapper.SpeakerMapper;
import com.zhiyou.model.Speaker;
import com.zhiyou.service.SpeakerService;

@Service
public class SpeakerServiceImpl implements SpeakerService {
	@Autowired
	SpeakerMapper mapper;

	@Override
	public void add(Speaker sp) {
		mapper.add(sp);
	}

	@Override
	public void delete(int id) {
		mapper.delete(id);
	}

	@Override
	public void update(Speaker sp) {
		mapper.update(sp);

	}

	@Override
	public Speaker selectById(int id) {

		return mapper.selectById(id);
	}

	@Override
	public int selectSpeakerCount() {

		return mapper.selectSpeakerCount();
	}

	@Override
	public List<Speaker> selectAll(int page, int count) {

		return mapper.selectAll(page, count);
	}

	@Override
	public int speakerAll(List<Integer> speakerList) {

		return mapper.speakerAll(speakerList);
	}

}
