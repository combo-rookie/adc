<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0047)http://localhost:8080/Voids/Course/addCourse.do -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--<base href="http://localhost:8080/Voids/">-->
<base href=".">


<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>智游教育</title>

<link
	href="${pageContext.request.contextPath}/static/z/bootstrap/css/bootstrap.css"
	rel="stylesheet">

<style type="text/css">
.col-md-1 {
	padding-top: 20px;
}

.a1 {
	color: gray;
}

b {
	float: right;
}
</style>
</head>
<body>
	<nav class="navbar-inverse">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand">视频管理系统</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-9">
			<ul class="nav navbar-nav">
				<li class="active" action="speaker"><a>视频管理</a></li>
				<li><a href="speaker">主讲人管理</a></li>
				<li><a href="course">课程管理</a></li>
			</ul>
			<p class="navbar-text navbar-right">
				<span>${admin.accounts}</span> <i class="glyphicon glyphicon-log-in"
					aria-hidden="true"></i>&nbsp;&nbsp;<a href="video"
					class="navbar-link">退出</a>
			</p>
		</div>

	</div>

	</nav>

	<div class="jumbotron" style="padding-top: 15px; padding-bottom: 15px;">
		<div class="container">

			<h2>添加视频</h2>

		</div>
	</div>

	<div class="container" style="margin-top: 20px;">

		<form action="add3" id="infoForm" class="form-horizontal"
			method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="title" class="col-sm-2 control-label">视频标题</label>
				<div class="col-sm-10">

					<input class="form-control" name="title" id="title"
						placeholder="视频名称" type="text">
				</div>
			</div>

			<div class="form-group">
				<label for="speaker_id" class="col-sm-2 control-label">主讲人</label>
				<div class="col-sm-10">
					<select id="speaker_id" name="speaker_id">
						<c:forEach var="speaker" items="${speaker }">
							<option value="${speaker.id }">${speaker.speaker_name }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="course_id" class="col-sm-2 control-label">所属课程</label>
				<div class="col-sm-10">
					<select id="course_id" name="course_id">
						<c:forEach var="course" items="${course }">
							<option value="${course.id }">${course.course_title }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="time" class="col-sm-2 control-label">视频时长(秒)</label>
				<div class="col-sm-10">
					<input class="form-control" name="time" id="time"
						placeholder="精确到秒(正整数)" type="text">
				</div>
			</div>
			<div class="form-group">
				<label for="image_url" class="col-sm-2 control-label">封面图片地址</label>
				<div class="col-sm-10">
					<input class="form-control" name="image1" id="image1"
						placeholder="具体的url" type="file">
				</div>
			</div>

			<div class="form-group">
				<label for="video_url" class="col-sm-2 control-label">视频播放地址</label>
				<div class="col-sm-10">
					<input class="form-control" name="video1" id="video1"
						placeholder="具体的url" type="file">
				</div>
			</div>
			<div class="form-group">
				<label for="" detail"" class="col-sm-2 control-label">视频信息介绍</label>
				<div class="col-sm-10">
					<input class="form-control" name="detail" id=""
						detail"" placeholder="具体的信息内容" type="text">
				</div>
			</div>
			<div class="form-group">
				<label for="remark" class="col-sm-2 control-label">备注</label>
				<div class="col-sm-10">
					<input class="form-control" name="remark" id="remark" type="text">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">保存</button>
				</div>
			</div>
		</form>
	</div>


</body>
</html>