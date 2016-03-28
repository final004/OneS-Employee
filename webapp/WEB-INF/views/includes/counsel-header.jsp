<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar navbar-default">

<div class="container-fluid" >
	<div id="header">
	<img src="${pageContext.request.contextPath}/assets/img/faviconImg.png" align="left">
	<a class="navbar-brand" href="${pageContext.request.contextPath}/counsel/">OneS
	</a>
	<ul class="nav navbar-nav navbar-right">
		<c:choose>
			<c:when test="${empty authUser}">
				<li><a href="${pageContext.request.contextPath}/counsel/#about">OneS란?</a></li>
				<li><a href="${pageContext.request.contextPath}/counsel/login">로그인</a></li>
		</c:when>
			<c:otherwise>
				<li>${authUser.name}님이 로그인하였습니다.</li>
				<li><a href="${pageContext.request.contextPath}/counsel/#about">OneS란?</a></li>
				<li><a href="${pageContext.request.contextPath}/counsel/lobby">대기방</a></li>
				<li><a href="${pageContext.request.contextPath}/counsel/logout">로그아웃</a></li>
				
			</c:otherwise>
		</c:choose>
	</ul>
	</div>
</div>
</nav>