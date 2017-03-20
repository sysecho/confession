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

    <link rel="stylesheet" href="../static/css/sm.min.css">
    <link rel="stylesheet" href="../static/css/sm-extend.min.css">
	<title>Hello World!</title>
</head>
<body>
	<div class="page">
			<header class="bar bar-nav">
				  <a class="button button-link button-nav pull-left" href="index/list" data-transition='slide-out'>
				      <span class="icon icon-left"></span>
				    	  返回
				    </a>
				    <h1 class="title">我的生活 <span class="icon icon-gift"></span></h1>
			</header>
			<form action="submit" id="submitForm" method="post">
				<div class="content">
				  <div class="list-block">
				    <ul>
				      <li>
				        <div class="item-content">
				          <div class="item-media"><i class="icon icon-form-name"></i></div>
				          <div class="item-inner">
				            <div class="item-title label">某某</div>
				            <div class="item-input">
				              <input type="text" placeholder="XXX学院的XXX" name="name" id="name">
				            </div>
				          </div>
				        </div>
				      </li>
				      <li class="align-top">
				        <div class="item-content">
				          <div class="item-media"><i class="icon icon-form-comment"></i></div>
				          <div class="item-inner">
				            <div class="item-title label"><span class="icon icon-message"></span></div>
				            <div class="item-input">
				              <textarea rows="5" cols="10" id="content" name="content" placeholder="在这里悄悄地告诉Ta你的心里话吧~~~~"></textarea>
				            </div>
				          </div>
				        </div>
				      </li>
				      <li>
				        <div class="item-content">
				          <div class="item-media"><i class="icon icon-form-name"></i></div>
				          <div class="item-inner">
				            <div class="item-title label">你的名字	<span class="icon icon-me"></span></div>
				            <div class="item-input">
				              <input type="text" placeholder="你的名字，可以匿名哦" name="fromeUser" id="fromeUser">
				            </div>
				          </div>
				        </div>
				      </li>
				    </ul>
				  </div>
				  <div class="content-block">
				    <div class="row">
				      <div class="col-100"><a href="javascript:submitForm();" class="button button-big button-fill button-success">提交</a></div>
				    </div>
				  </div>
				</div>
			</form>
		<nav class="bar bar-tab">
		  <a class="tab-item external active" href="index/list">
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
	</div>
	<script type="text/javascript">
		function aboutMe(){
			$.alert('Here goes alert text');
		}
	</script>
	<!-- 默认必须要执行$.init(),实际业务里一般不会在HTML文档里执行，通常是在业务页面代码的最后执行 -->
    <script type='text/javascript' src='../static/js/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='../static/js/sm.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='../static/js/sm-extend.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='../static/js/confession.js' charset='utf-8'></script>
	<script>$.init()</script>
</body>
</html>
