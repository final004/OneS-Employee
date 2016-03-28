<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="${pageContext.request.contextPath}/assets/css/user.css" 
rel="stylesheet" type="text/css">
 
<script type="text/javascript">
function loginCheck(){
	var employeeId = loginform.employeeId.value;
	var password = loginform.password.value;
	$.ajax( 
		{
			url:'loginSuccess',
			type:'POST',
			data:{'employeeId':employeeId, 'password':password},
			dataType:'json',
                        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			success :function(login){
				if(login.result=="/counsel/index") {
					$('#result').html('로그인 성공');
				}else{
					$('#result').html('로그인 실패');
				}
			},
		}
	);
}
</script>

 
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
				<!--  <li><a href="${pageContext.request.contextPath}/counsel/lobby">대기방</a></li> -->
				<!-- <li><a href="${pageContext.request.contextPath}/counsel/login">로그인</a></li>  -->
				
				 
				<li><a href="" data-toggle="modal" data-target="#login-modal" id="login">로그인</a></li>
				
		<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false" style="display: none;">
    	  <div class="modal-dialog">
				<div class="loginmodal-container">
					<h1>Login to Your ID</h1>
				  <form id="login-form" name="loginform" method="post"
						action="${pageContext.request.contextPath}/counsel/loginSuccess">
					<input id="employeeId" type="text" name="employeeId" placeholder="EmployeeId">
					<input id="password" type="password" name="password" placeholder="Password">
					<input type="submit" name="login" class="login loginmodal-submit" value="Login" onclick="loginCheck()">
				  </form>
				  <div id="result"></div>
				</div>
			</div>
		  </div>
				
			</c:when>
			<c:otherwise>
				<li>${authUser.employeeId}님이 로그인하였습니다.</li>
				<li><a href="${pageContext.request.contextPath}/counsel/#about">OneS란?</a></li>
				<li><a href="${pageContext.request.contextPath}/counsel/lobby">대기방</a></li>
				<li><a href="${pageContext.request.contextPath}/counsel/logout">로그아웃</a></li>
				
			</c:otherwise>
		</c:choose>
	</ul>
	</div>
</div>
</nav>