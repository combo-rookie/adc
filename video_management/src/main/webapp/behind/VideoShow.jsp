<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0052)http://localhost:8080/Voids/controller/courseShow.do -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<!--<base href="http://localhost:8080/Voids/">-->
<base href=".">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>智游教育</title>

<link href="${pageContext.request.contextPath}/static/z/bootstrap.css"
	rel="stylesheet">

<script src="static/z/jquery-1.js"></script>
<script src="static/js/bootstrap.js"></script>
<script src="static/js/confirm.js"></script>
<script src="static/js/jquery.js"></script>
<script src="static/js/message_cn.js"></script>
<script src="static/js/message_cn.js"></script>

<style type="text/css">
th {
	text-align: center;
}
</style>
</head>

<body>
	<nav class="navbar-inverse">
	<div class="container">

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
					aria-hidden="true"></i>&nbsp;&nbsp;<a href="welcome.jsp"
					class="navbar-link">退出</a>
			</p>
		</div>



	</div>

	</nav>






	<div class="jumbotron" style="padding-top: 15px; padding-bottom: 15px;">
		<div class="container">
			<h2>视频管理</h2>
		</div>
	</div>


	<div class="container">
		<from action="video">
		<div style="float: left;">
			<button onclick="showAddPage()" type="button"
				class="btn btn-info dropdown-toggle" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false">添加</button>

			<button onclick="deleteAll()" type="submit" id="btn"
				class="btn btn-info dropdown-toggle">批量删除</button>
		</div>
		</from>
		<form action="selectLikeVideo">
			<div style="float: right;">

				<input type="text"  name="title" placeholder="请输入你要查询的标题"> <select name="speaker_id"
					class="btn btn-info dropdown-toggle">
						<option>请选择老师</option>
					<c:forEach items="${speaker}" var="speaker">
						<option value="${speaker.id}">${speaker.speaker_name}</option>
					</c:forEach>
				</select> <select name="course_id" class="btn btn-info dropdown-toggle">
					<option value="">请选择课程</option>
					<c:forEach items="${course}" var="course">
						<option value="${course.id}">${course.course_title}</option>
					</c:forEach>
				</select> <input value="查询" onclick="" type="submit" id=""
					class="btn btn-info dropdown-toggle">

			</div>
		</form>

	</div>

	<div class="container" style="margin-top: 20px;">

		<table class="table table-bordered table-hover"
			style="text-align: center; table-layout: fixed;">
			<thead>
				<tr class="active">
					<th style="width: 4%"><input type="checkbox" id="all"
						onchange="a()"></th>
					<th style="width: 4%">序号</th>
					<th style="width: 8%">名称</th>
					<th style="width: 50%">介绍</th>
					<th style="width: 5%">讲师</th>
					<th style="width: 4%">时长</th>
					<th style="width: 6%">播放次数</th>
					<th style="width: 4%">编辑</th>
					<th style="width: 4%">删除</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach items="${list}" var="i">
					<tr>
						<td><input type="checkbox" name="c" value="${i.video_id}"></td>
						<td>${i.video_id}</td>
						<td>${i.title}</td>
						<td>${i.detail}</td>
						<td>${i.speaker.speaker_name}</td>
						<td>${i.time}</td>
						<td>${i.play_num}</td>
						<td><a href="selectById3?id=${i.video_id}">编辑</a></td>
						<td><a href="delete3?id=${i.video_id}">删除</a></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>

		<div class="pager-info">
			<div>
				共有 ${count}条记录，第 ${page}
				<c:if test="${count %5==0}">
					<c:set value="${count/5}" var="zpage"></c:set>
				</c:if>
				<c:if test="${count %5!=0}">
					<c:set value="${count/5+1}" var="zpage"></c:set>
					<fmt:parseNumber value="${count/5+1}" var="zpage"
						integerOnly="true"></fmt:parseNumber>
				</c:if>
				页 / 共${zpage}页
			</div>
			<div>
				<ul class="pagination">
					<c:if test="${page>1}">
						<li class="paginate_button previous disabled }"><a
							href="video?page=${page-1}">上一页</a></li>
					</c:if>
					<li class="paginate_button active"><a>${page}</a></li>
					<c:if test="${page<zpage }">
						<li class="paginate_button next disabled"><a
							href="video?page=${page+1}">下一页</a></li>
					</c:if>
				</ul>
			</div>
		</div>
		<div class="buttons">
			<a class="btn btn-default" href="javascript:history.go(-1)">返回</a>
		</div>
	</div>

	<script type="text/javascript">
		function showAddPage(){
			location.href="videoAdd";
		}
		function a() {
			var stuts=document.getElementById("all").checked;
			var c = document.getElementsByName("c");
			for (var i = 0; i < c.length; i++) {
				c[i].checked=stuts;
			}
		}
		
		function deleteAll() {
			var checkedNum = $("input[name='c']:checked").length;
			var userIds = new Array();
			$("input[name='c']:checked").each(function() {
				userIds.push($(this).val());
			});
			
			  if(confirm("确定删除所选项？")){
				  
	              $.post("dAll",{userIds:userIds},
	            		  
	                 function(data){
	            	 
						if(data =='ok'){
							Confirm.show('温馨提示：','删除成功');
							document.location.reload();
						}else{						
							Confirm.show('温馨提示：',  '操作失败');
							
						}
	              	 });
	         	}

	    }
		
	</script>


</body>
</html>


