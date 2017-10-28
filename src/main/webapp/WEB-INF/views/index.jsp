<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
	<link rel="shortcut icon" href="../static/images/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="../static/css/sm.min.css">
    <link rel="stylesheet" href="../static/css/sm-extend.min.css">
	<title>告白墙</title>
</head>
<body>
	<div class="page-group">
      <!-- 你的html代码 -->
      <div class="page page-current" id="page-1490060512143">
			<header class="bar bar-nav"> <h1 class="title"><span class="icon icon-menu"></span>	留言列表 </h1> </header>
			<nav class="bar bar-tab">
			  <a class="tab-item external active" href="list">
			    <span class="icon icon-home"></span>
			    <span class="tab-label">首页</span>
			  </a>
			  <a class="tab-item external active" href="confession">
			    <span class="icon icon-edit"></span>
			    <span class="tab-label">我要留言</span>
			  </a>
			  <a class="tab-item external active" href="javascript:aboutMe();">
			    <span class="icon icon-emoji"></span>
			    <span class="tab-label">关于留言</span>
			  </a>
			</nav>
			<!-- 添加 class infinite-scroll 和 data-distance  向下无限滚动可不加infinite-scroll-bottom类，这里加上是为了和下面的向上无限滚动区分-->
		      <div class="content infinite-scroll infinite-scroll-bottom" data-distance="100">
		          <div class="list-block">
		              <ul class="list-container cards-list">
		              </ul>
		          </div>
		          <!-- 加载提示符 -->
		          <div class="infinite-scroll-preloader">
		              <div class="preloader"></div>
		          </div>
		      </div>	
		</div>
	</div>
	<!-- 默认必须要执行$.init(),实际业务里一般不会在HTML文档里执行，通常是在业务页面代码的最后执行 -->
    <script type='text/javascript' src='../static/js/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='../static/js/sm.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='../static/js/sm-extend.min.js' charset='utf-8'></script>
    <script type="text/javascript" src='../static/js/index.js'></script>
	<script>$.init()</script>
</body>
</html>