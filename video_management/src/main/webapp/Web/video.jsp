<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--<base href="http://localhost:8080/Voids/">-->
 
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    
    <!--<base href="http://localhost:8080/Voids/">-->
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="Web前端视频教程,大数据视频教程,HTML5视频教程,UI视频教程,PHP视频教程,java视频教程,python基础教程">
    <meta name="description" content="智游教育在线课程视频,为您提供java,python,HTML5,UI,PHP,大数据等学科经典视频教程在线浏览学习,精细化知识点解析,深入浅出,想学不会都难,智游教育,学习成就梦想！">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/js/video-js.css">
<script src="${pageContext.request.contextPath}/static/js/video.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/z/base.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/z/css.css">
<link rel="icon" href="http://localhost:8080/VideoProject/projectimg/favicon.png" type="image/png">

    <title>在线公开课-智游教育|java|大数据|HTML5|python|UI|PHP视频教程</title>

</head>

<body class="w100" style="padding-top: 0px;">
<header>
	<div class="container">
		<span>欢迎来到IT培训的黄埔军校——智游教育！</span>
			<div id="userBlock" style="float:right">
				<c:if test="${!empty list}">
					<a href="${pageContext.request.contextPath}/exit_center">退出</a>
				</c:if>
			
				<a >
					<c:if test="${!empty list.imgurl}">
						<a href="person_center">${list.accounts}</a>
						
					</c:if>
				<c:if test="${empty list}">
				<a id="login_open">登录 /注册</a>
				</c:if>
					
				</a>
				
			</div>
		<a onclick="JavaScript:addFavorite2()"><img src="${pageContext.request.contextPath}/static/z/sc.png" draggable="false">加入收藏</a>
		
		<a target="_blank"><img src="${pageContext.request.contextPath}/static/z/we.png" draggable="false">后台管理</a>
		<a class="color_e4"><img src="${pageContext.request.contextPath}/static/z/phone.png" draggable="false"> 0371-88888598　　4006-371-555</a>
	</div>
</header>


    

<div>
    <!--面包屑导航-->
       <div class="container mian-nav" id="navDiv">
        	<c:if test="${list3.get(1).get(0).course.subject_id ==1}">公开课 / WEB前端</c:if>
        	<c:if test="${list3.get(1).get(0).course.subject_id ==6}">公开课 /UI设计</c:if>
        	<c:if test="${list3.get(1).get(0).course.subject_id ==10}">公开课 /Python编程</c:if>
        	<c:if test="${list3.get(1).get(0).course.subject_id ==11}">公开课 /PHP开发</c:if>
        </div>


<div class="intro">
	<div class="container">
		<div class="v-intro">
			<div class="left">
				<video id="videoPlayer" src="${list3.get(0).get(0).video_url}" class="video-js vjs-default-skin" controls="controls" data-setup="{}" height="280" width="627">
				</video>
			</div>
			
			<div class="right">
				<p class="right-title">HTML页面基本结构</p>
				<div class="avatar">
					<span style="background-image: url(${list3.get(0).get(0).speaker.pic_url})"></span>
					<p><b>${list3.get(0).get(0).speaker.speaker_name}</b><br><i>${list3.get(0).get(0).speaker.speaker_desc}</i></p>
				</div>
				<p class="video-intro">
					<span>本节内容：</span>${list3.get(0).get(0).detail}
				</p>
			</div>
		</div>

		<div class="kcjs">
			<p class="title">课程介绍</p>
			<p class="content">${list3.get(1).get(0).course.course_desc}</p>
		</div>
	</div>
</div>
<!--目录-->
<div class="catalog">
	<div class="container">
		<p class="title">目录</p>
		  <c:forEach begin="0" end="${list3.get(1).size()-1}" var="i">
			<div class="chapter">
				<p class="biaoti"><a href="">${list3.get(1).get(i).title}</a></p>
				<p class="lecturer">${list3.get(1).get(i).detail }</p>
				<p class="lecturer">讲师：${list3.get(1).get(i).speaker.speaker_name}</p>
				<div class="v-info">
					<span class="count"><img src="${pageContext.request.contextPath}/static/z/count.png" alt="">${list3.get(1).get(i).play_num }</span>
					<span class="duration"><img src="${pageContext.request.contextPath}/static/z/player.png" alt="">${list3.get(1).get(i).time }</span>
				</div>
			</div>
		  </c:forEach>
	</div>
</div>
</div>

    
    

		<!--页脚-->
		<footer>
		<ul>
			<li><img
				src="${pageContext.request.contextPath}/static/z/footer_logo.png" draggable="false">
			</li>
			<li class="mt25">
				<h3>各校区地址</h3>
				<ul>
					<li>总部地址<br>中国-郑州经济技术开发区河南省通信产业园六层
					</li>
					<li>郑州校区一<br>中国-郑州经济技术开发区第一大街与经北一路
					</li>
					<li>郑州校区二<br>中国-郑州经济技术开发区第四大街经开人才市场七楼
					</li>
					<li>郑州校区三<br>中国-郑州经济技术开发区第八大街河南省留学生创业园九层、十层
					</li>
					<li>西安分校<br>中国-西安莲湖区 联系人：梁老师 13201570801
					</li>
				</ul>
			</li>
			<li class="mt25">
				<h3>联系我们</h3>
				<ul id="foo_icon">
					<li>中国-郑州经济技术开发区经北三路河南通信产业园六层</li>
					<li>e-mail:zy@zhiyou100.com</li>
					<li>电话:4006-371-555 0371-88888598</li>
					<li class="erwei"><br>
						<div>
							<img class="weixin"
								src="${pageContext.request.contextPath}/static/z/a_002.png"
								alt="" draggable="false"> <img class="weibo"
								src="${pageContext.request.contextPath}/static/z/a.png" alt=""
								draggable="false">
						</div></li>
				</ul>
			</li>
		</ul>
		<div class="record">智游教育 © 豫ICP备17000832号-1 河南智游臻龙教育科技有限公司</div>
		</footer>
<script src="${pageContext.request.contextPath}/static/js/jquery-1.js"></script>
<script src="${pageContext.request.contextPath}/static/js/gVerify.js"></script>
<script src="${pageContext.request.contextPath}/static/js/index.js"></script>
<%-- <script src="${pageContext.request.contextPath}/static/js/video.js"></script> --%>

<script type="text/javascript">

</body>
</html>