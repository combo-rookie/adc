<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0055)http://localhost:8080/Voids/Course/Courseupdate.do?id=6 -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!--<base href="http://localhost:8080/Voids/">--><base href=".">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>智游教育</title>

<link href="${pageContext.request.contextPath}/static/z/bootstrap/css/bootstrap.css" rel="stylesheet">

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

		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-9">
			<ul class="nav navbar-nav">
				<li><a href="video">视频管理</a></li>
				<li class="active" action="speaker" ><a>主讲人管理</a></li>
				<li><a href="course">课程管理</a></li>
			</ul>
			<p class="navbar-text navbar-right"> 
				<span>${admin.accounts}</span> <i class="glyphicon glyphicon-log-in" aria-hidden="true"></i>&nbsp;&nbsp;<a href="speaker" class="navbar-link">退出</a>
			</p>
		</div>
		<!-- /.navbar-collapse -->


	</div>
	<!-- /.container-fluid -->
</nav>



	<div class="jumbotron" style="padding-top: 15px;padding-bottom: 15px;">
		<div class="container">

			
			
				<h2>修改主讲人</h2>
			
		</div>
	</div>



	<div class="container" style="margin-top: 20px;">

		<form action="update2" id="infoForm" class="form-horizontal" method="get" >

			
			<div class="form-group">
				<label for="speakerName" class="col-sm-2 control-label">姓名</label>
				<div class="col-sm-10">
					<input type="hidden" name="id" value="${sp.id}">
					<input class="form-control" name="speaker_name" id="speakerName" value="${sp.speaker_name}" placeholder="讲师姓名" type="text">
				</div>
			</div>
			
			
			<div class="form-group">
				<label for="speaker_job" class="col-sm-2 control-label">职位</label>
				<div class="col-sm-10">
					<input class="form-control" name="speaker_job" id="speaker_job" value="${sp.speaker_job}" placeholder="职位" type="text">
				</div>
			</div>
			<div class="form-group">
				<label for="pic_url" class="col-sm-2 control-label">头像地址</label>
				<div class="col-sm-10"> 
					<input class="form-control" name="pic_url" id="pic_url" value="${sp.pic_url}" placeholder="头像地址" herf="${sp.pic_url}">
				</div>
			</div>
			<div class="form-group">
				<label for="speaker_desc" class="col-sm-2 control-label">简介</label>
				<div class="col-sm-10">
					<textarea class="form-control" id="speaker_desc" name="speaker_desc" rows="3">${sp.speaker_desc}</textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">保存</button>
				</div>
			</div>
		</form>
	</div>

</body></html>