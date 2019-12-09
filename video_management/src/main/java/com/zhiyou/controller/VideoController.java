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
import org.springframework.web.multipart.MultipartFile;

import com.zhiyou.model.Video;
import com.zhiyou.service.VideoService;
import com.zhiyou.util.FTPUtil;

@Controller
public class VideoController {
	@Autowired
	VideoService service;

	@RequestMapping("video")
	public String show(HttpServletRequest req, HttpServletResponse rep) {
		int count = service.selectVideoCount();

		int page = req.getParameter("page") == null || req.getParameter("page") == "" ? 1
				: Integer.valueOf(req.getParameter("page"));

		req.setAttribute("count", count);
		req.setAttribute("page", page);
		req.setAttribute("speaker", service.selectSpeaker());
		req.setAttribute("course", service.seleteCourse());
		List<Video> list = service.selectAll3((page - 1) * 5, 5);

		req.setAttribute("list", list);

		return "behind/VideoShow";
	}

	@RequestMapping("videoAdd")
	public String addVideo(HttpServletRequest req, HttpServletResponse rep) {
		req.setAttribute("speaker", service.selectSpeaker());
		req.setAttribute("course", service.seleteCourse());
		return "behind/VideoAdd";
	}

	@RequestMapping("add3")
	public String add3(MultipartFile image1, MultipartFile video1, Video video, HttpServletRequest req,
			HttpServletResponse rep) throws Exception {
		String imgurl = FTPUtil.upload(image1.getInputStream(), image1.getOriginalFilename());

		video.setImage_url(imgurl);

		// 2.video
		String videourl = FTPUtil.upload(video1.getInputStream(), video1.getOriginalFilename());
		video.setVideo_url(videourl);
		service.add(video);
		return "forward:video";
	}

	@RequestMapping("delete3")
	public String delete(int id, HttpServletRequest req, HttpServletResponse rep) {
		service.delete(id);
		return "forward:video";
	}

	@RequestMapping("selectById3")
	public String selectString(int id, HttpServletRequest req, HttpServletResponse rep) {
		req.setAttribute("video", service.selectById(id));
		req.setAttribute("speaker", service.selectSpeaker());
		req.setAttribute("course", service.seleteCourse());
		return "behind/VideoUpdate";
	}

	@RequestMapping("update3")
	public String update(MultipartFile image1, MultipartFile video1, Video video, HttpServletRequest req,
			HttpServletResponse rep) throws Exception {
		String imgurl = FTPUtil.upload(image1.getInputStream(), image1.getOriginalFilename());

		video.setImage_url(imgurl);

		// 2.video
		String videourl = FTPUtil.upload(video1.getInputStream(), video1.getOriginalFilename());
		video.setVideo_url(videourl);
		service.update(video);
		return "forward:video";
	}

	// 批量删除
	@ResponseBody // 不会跳转页面
	@RequestMapping("dAll")
	public String dAll(@RequestParam("userIds[]") Integer[] userIds, HttpServletRequest request,
			HttpServletResponse response) {

		List<Integer> userIdList = Arrays.asList(userIds);

		int num = service.dAll(userIdList);

		if (num == 1 || num == 2 || num == 3 || num == 4 || num == 5) {

			return "ok";

		} else {

			return "error";

		}

	}

	@RequestMapping("selectLikeVideo")
	public String selectLikeVideo(HttpServletRequest req, HttpServletResponse resp) {
		String title = req.getParameter("title") == null ? "" : req.getParameter("title");
		Integer speaker_id = req.getParameter("speaker_id") == null || req.getParameter("speaker_id") == "" ? 0
				: Integer.valueOf(req.getParameter("speaker_id"));
		Integer course_id = req.getParameter("course_id") == null || req.getParameter("course_id") == "" ? 0
				: Integer.valueOf(req.getParameter("course_id"));

		List<Video> selectLikeVideo = service.selectLikeVideo(title, speaker_id, course_id);
//		int count = service.selectVideoCount();
//		int page = req.getParameter("page") == null || req.getParameter("page") == "" ? 1
//				: Integer.valueOf(req.getParameter("page"));
//		req.setAttribute("count", count);
//		req.setAttribute("page", page);
		req.setAttribute("list", selectLikeVideo);
		return "behind/VideoShow";

	}

}
