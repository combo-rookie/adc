<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0050)http://localhost:8080/Voids/controller/web.do?id=1 -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--<base href="http://localhost:8080/Voids/">--><base href=".">
 

    <!-- base href="http://localhost:8080/video/" -->
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="Web前端视频教程,大数据视频教程,HTML5视频教程,UI视频教程,PHP视频教程,java视频教程,python基础教程">
    <meta name="description" content="智游教育在线课程视频,为您提供java,python,HTML5,UI,PHP,大数据等学科经典视频教程在线浏览学习,精细化知识点解析,深入浅出,想学不会都难,智游教育,学习成就梦想！">
    
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/z/base.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/z/css.css">
<link rel="icon" href="http://localhost:8080/video/favicon.png" type="image/png">
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


	<div id="app">
		<!--banner图-->
		<div class="banner">
			<!-- 根据视频类型选择对应的图片 -->
			<c:if test="${subject_id==1}">
				<img alt=""
					src="${pageContext.request.contextPath}/static/z/banner-1.jpg"
					width="100%" height="470px;">
			</c:if>
			<c:if test="${subject_id==6}">
				<img alt=""
					src="${pageContext.request.contextPath}/static/z/banner-6.jpg"
					width="100%" height="470px;">
			</c:if>
			<c:if test="${subject_id==10}">
				<img alt=""
					src="${pageContext.request.contextPath}/static/z/banner-10.jpg"
					width="100%" height="470px;">
			</c:if>
			<c:if test="${subject_id==11}">
				<img alt=""
					src="${pageContext.request.contextPath}/static/z/banner-11.jpg"
					width="100%" height="470px;">
			</c:if>

		</div>

		<!--面包屑导航-->
		
		<div class="container mian-nav" id="navDiv">
			<c:if test="${subject_id ==1}">公开课 / WEB前端</c:if>
        	<c:if test="${subject_id ==6}">公开课 /UI设计</c:if>
        	<c:if test="${subject_id ==10}">公开课 /Python编程</c:if>
        	<c:if test="${subject_id ==11}">公开课 /PHP开发</c:if>
		</div>
		<c:forEach begin="0" end="${list2.size()-1}" var="i">
			<div class="classify">
				<div class="container" id="dataContainer">
					<div class="section">
						<div class="classifyName">
							<p class="title title-first">${list2[i].course_title}</p>
						</div>
						<div class="kcIntro">
							<p class="int">
								<span>课程介绍：</span> ${list2[i].course_desc}
							</p>
						</div>
						<ul>
							<c:forEach items="${list2[i].videos}" var="video">
								<!-- 获取视频 -->
								<c:if test="${!empty user}">
									<li class="section-main"><a
										href="playvideo?video_id=${video.video_id}&subject_id=${subject_id}&user=${user}">
											<input type="hidden" id="user_id" value="${list.id}">
											<div class="thum" style="background-image: url(${video.image_url})"></div>
											<p>${video.title}</p>
											<div class="classify-v-info">
												<span class="count" title="观看次数"><img src="${pageContext.request.contextPath}/static/z/count.png" alt="">${video.time}</span> 
												<span class="duration" title="视频时长"><img src="${pageContext.request.contextPath}/static/z/player.png" alt="">${video.play_num}</span>
											</div>
									</a>
									</li>
								</c:if>
								<c:if test="${empty user}">
									<li class="section-main">
									<input type="hidden" id="user_id" value="${list.id}">
										<div class="thum"
											style="background-image: url(${video.image_url})"></div>
										<p>${video.title}</p>
										<div class="classify-v-info">
											<span class="count" title="观看次数"><img src="${pageContext.request.contextPath}/static/z/count.png" alt="">${video.time}</span> 
											<span class="duration" title="视频时长"><img src="${pageContext.request.contextPath}/static/z/player.png" alt="">${video.play_num}</span>
										</div>
									</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</c:forEach>
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



  <!-- 登录弹出框 -->
	<div class="mask hidden" id="login">
		<div class="mask_content">
			<div class="mask_content_header">
				<img src="static/z/logo.png" class="ma">
			</div>
			<div class="mask_content_body">
				<form id="loginForm" action="loginUser" method="post">
					<h3>快速登录</h3>
					<input id="loginEmail" placeholder="请输入邮箱" name="email"
						type="email"><span id="msg"></span> <input
						id="loginPassword" placeholder="请输入密码" name="password"
						type="password"><span id="pss"></span> <span id="Msg"></span>

					<div id="forget">
						<a href="">忘记密码？</a> <a id="reg_open">注册</a>
					</div>
					<input onclick="return result2();" value="登　录" type="submit">
				</form>
			</div>
			<div class="mask_content_footer">
				<span id="login_close">关 闭</span>
			</div>
		</div>
	</div>
	<!--注册弹出框-->
		<div class="mask hidden" id="reg">
			<div class="mask_content">
				<div class="mask_content_header">
					<img src="static/z/logo.png" class="ma">
				</div>
				<div class="mask_content_body">
					<form id="regForm">
						<h3>新用户注册</h3>
						<input id="regEmail" placeholder="请输入邮箱" name="accounts" type="email">
						<span id="emailMsg"></span> 
						<input id="regPsw" placeholder="请输入密码" name="password" type="password">
						<input id="regPswAgain" placeholder="请再次输入密码" name="psw_again" type="password">
						<span id="passMsg"></span>
						<div id="yzm" class="form-inline">
							<input name="yzm" style="width: 45%; display: inline-block;"
								type="text">
							<div id="v_container"
								style="width: 45%; height: 40px; float: right;">
								<canvas id="verifyCanvas" width="100" height="38"
									style="cursor: pointer;">您的浏览器版本不支持canvas</canvas>
								<canvas id="verifyCanvas" width="100" height="38"
									style="cursor: pointer;">您的浏览器版本不支持canvas</canvas>
							</div>
						</div>
						<input onclick="return commitRegForm();" value="注　册" type="submit">
					</form>
				</div>
				<div class="mask_content_footer">
					<span id="reg_close">关 闭</span>
				</div>
			</div>
		</div>



	


		<script src="${pageContext.request.contextPath}/static/js/jquery-1.js"></script>
		<script src="${pageContext.request.contextPath}/static/js/gVerify.js"></script>
		<script src="${pageContext.request.contextPath}/static/js/index.js"></script>
<script type="text/javascript">

</script>


	
</body></html>