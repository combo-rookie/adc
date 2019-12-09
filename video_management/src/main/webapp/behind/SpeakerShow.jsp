<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0052)http://localhost:8080/Voids/controller/courseShow.do -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<!--<base href="http://localhost:8080/Voids/">--><base href=".">
		
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>智游教育</title>
		
<link href="${pageContext.request.contextPath}/static/z/bootstrap.css" rel="stylesheet">
<script src="static/z/jquery-1.js" ></script>
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

		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-9">
			<ul class="nav navbar-nav">
				<li><a href="video">视频管理</a></li>
				<li class="active" action="speaker" ><a>主讲人管理</a></li>
				<li><a href="course">课程管理</a></li>
			</ul>
			<p class="navbar-text navbar-right">
				<span>${admin.accounts}</span> <i class="glyphicon glyphicon-log-in" aria-hidden="true"></i>&nbsp;&nbsp;<a href="welcome.jsp" class="navbar-link">退出</a>
			</p>
		</div>
		<!-- /.navbar-collapse -->
		

	</div>
	<!-- /.container-fluid -->
</nav>

	
	
		
	
    
    <div class="jumbotron" style="padding-top: 15px;padding-bottom: 15px;">
	  <div class="container">
	          <h2>主讲人管理</h2>
	  </div>
	</div>
	
	<form action="speaker">
	<div class="container">
	    <button onclick="showAddPage()" type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		      添加
		</button>
		
		<button onclick="deleteAll()" type="submit" id="btn" class="btn btn-info dropdown-toggle">
		批量删除
		</button>
	</div>
	
	<div class="container" style="margin-top: 20px;">
		
		<table class="table table-bordered table-hover" style="text-align: center;table-layout:fixed;">
      <thead>
        <tr class="active">
          <th><input type="checkbox" id="all" onchange="a()"></th>
          
          <th style="width:4%">序号</th>
          <th style="width:8%">名称</th>
          <th style="width:10%">职位</th>
          <th style="width:55%">简介</th>
          
          <th>编辑</th>
          <th>删除</th>
        </tr>
      </thead>
      <tbody>
     
        <c:forEach items="${list}" var="list">
		<tr>
		<td><input type="checkbox" name="c" value="${list.id}"></td>
		<td>${list.id}</td>
		<td>${list.speaker_name}</td>
		<td>${list.speaker_job}</td>
		<td>${list.speaker_desc}</td> 
		<td>
		<a href="selectById2?id=${list.id}">编辑</a> 	
		</td>
		<td>
		<a href="delete2?id=${list.id}" onclick="confirmDelete(1)">删除</a></td>
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
								href="speaker?page=${page-1}">上一页</a></li>
						</c:if>
						<li class="paginate_button active"><a href="#">${page}</a></li>
						<c:if test="${page<zpage }">
							<li class="paginate_button next disabled"><a
								href="speaker?page=${page+1}">下一页</a></li>
						</c:if>
					</ul>
				</div>
			</div>
      
      
      
    
	</div>
	  </form>

	<script type="text/javascript">
		function showAddPage(){
			location.href="SpeakerAdd";
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
			var speakerIds = new Array();
			$("input[name='c']:checked").each(function() {
				speakerIds.push($(this).val());
					
			});
			if(confirm("确定删除所选项？")){
	              $.post("speakerAll",{speakerIds:speakerIds},
	                 function(data){
						if(data =='ok'){
							alert('温馨提示：删除成功');
							document.location.reload();
						}else{						
							alert('温馨提示：操作失败');
						}
					});
				}
			}
	
	</script>
  

</body></html>

