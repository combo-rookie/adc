package com.zhiyou.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhiyou.model.Speaker;
import com.zhiyou.service.SpeakerService;

@Controller
public class SpeakerController {
	@Autowired
	SpeakerService service;

	@RequestMapping("speaker")
	public String show(HttpServletRequest req, HttpServletResponse rep) {
		int count = service.selectSpeakerCount();

		int page = req.getParameter("page") == null || req.getParameter("page") == "" ? 1
				: Integer.valueOf(req.getParameter("page"));

		req.setAttribute("count", count);
		req.setAttribute("page", page);

		List<Speaker> list = service.selectAll((page - 1) * 5, 5);

		req.setAttribute("list", list);

		return "behind/SpeakerShow";
	}

	@RequestMapping("SpeakerAdd")
	public String add(HttpServletRequest req, HttpServletResponse rep) {
		return "behind/SpeakerAdd";
	}

	@RequestMapping("add2")
	public String addString(Speaker sp, HttpServletRequest req, HttpServletResponse rep) {
		service.add(sp);
		return "forward:speaker";
	}

	@RequestMapping("delete2")
	public String delete(int id, HttpServletRequest req, HttpServletResponse rep) {

		service.delete(id);

		return "forward:speaker";
	}

	@RequestMapping("selectById2")
	public String select(int id, HttpServletRequest req, HttpServletResponse rep) {

		req.setAttribute("sp", service.selectById(id));

		return "behind/SpeakerUpdate";
	}

	@RequestMapping("update2")
	public String update(Speaker sp, HttpServletRequest req, HttpServletResponse rep) {
		service.update(sp);
		return "forward:speaker";
	}

	// 批量删除
	@ResponseBody // 不会跳转页面
	@RequestMapping("speakerAll")
	public String speakerAll(@RequestParam("speakerIds[]") Integer[] speakerIds, HttpServletRequest request,
			HttpServletResponse response) {

		List<Integer> speakerList = Arrays.asList(speakerIds);

		int num = service.speakerAll(speakerList);

		System.out.println(speakerList);

		System.out.println(num);

		if (num == 1 || num == 2 || num == 3 || num == 4 || num == 5) {

			return "ok";
		} else {
			return "error";
		}

	}

}
