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
	<title>告白墙</title>
</head>
<body>
	<div class="page">
		<header class="bar bar-nav"> <h1 class="title"><span class="icon icon-menu"></span>	留言列表 </h1> </header>
		<div class="content">
		    <div class="list-block cards-list">
		      <ul>
		      	<c:choose>
	        		<c:when test="${not empty confessions}">
	        			<c:forEach items="${confessions }" var="confession">
					        <li class="card">
				        		<div class="card-header">
				        			<span class="icon icon-message">
							        	<c:choose>
							        		<c:when test="${not empty confession.name}">${confession.name }</c:when>
							        		<c:otherwise>全天下所有人</c:otherwise>
							        	</c:choose>
							        </span>
					          	</div>
						          <div class="card-content">
						            <div class="card-content-inner">
						            	<p>${confession.content }</p>
						            </div>
						          </div>
						          <div class="card-footer">
								      	留言时间：<fmt:formatDate value='${confession.createDate}' type='date' pattern='yyyy-MM-dd HH:mm:ss'/>
								      	<span class="icon icon-me">
								      	<c:choose>
							        		<c:when test="${not empty confession.fromeUser}">${confession.fromeUser }</c:when>
							        		<c:otherwise>匿名留言</c:otherwise>
							        	</c:choose>
							   	 </div>
					        </li>
					     </c:forEach>	
	        		
	        		</c:when>
	        		<c:otherwise>
	        			<div class="card">
						    <div class="card-content">
						      <div class="card-content-inner">暂时没人留言哦，赶紧的......</div>
						    </div>
						 </div>
	        		</c:otherwise>
	        	</c:choose>
		      </ul>
		    </div>
	  	</div>
	  	
	  	<nav class="bar bar-tab">
		  <a class="tab-item external active" href="home">
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
	<script>$.init()</script>
</body>
</html>
