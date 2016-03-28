<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="description" content="WebRTC code samples">
	<meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1, maximum-scale=1">
	<meta name="mobile-web-app-capable" content="yes">
	<meta id="theme-color" name="theme-color" content="#ffffff">
	
	<title>OneS</title>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png">
	<link href="//fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/counselchat.css" />
</head>
<body>
	<div id="container"  class="container-fluid">
		<c:import url="/WEB-INF/views/includes/counsel-header.jsp"/>
		
		<!-- Left SideBar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand">
					<h1>M E N U</h1>
				</li>
				<li><div data-target="#layerpop" data-toggle="modal">파일전송</div></li>
				<li><div id="camChat">영상전환</div></li>
			</ul>
		</div>
		<!-- /Left SideBar -->
		
		<!-- Right SideBar -->
		<div id="right-sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand">
					<h1>연 락 처</h1>
				</li>
				<li><div>(구)하나은행 1599-1111</div></li>
				<li><div>(구)외환은행 1599-3000</div></li>
				<li><div>하나금융투자 1588-3111</div></li>
				<li><div>하나카드 1588-3111</div></li>
				<li><div>하나캐피탈 02-2037-1111</div></li>
				<li><div>하나생명 080-3488-7000</div></li>
				<li><div>하나저축은행 1899-1122</div></li>
				<li><div>하나저축은행 1899-1122</div></li>
			</ul>
		</div>
		<!-- /Right SideBar -->
		
		
		<div class="modal fade" id="layerpop">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- header -->
					<div class="modal-header">
						<!-- 닫기(x) 버튼 -->
						<button type="button" class="close" data-dismiss="modal">×</button>
						<!-- header title -->
						<h4 class="modal-title">파일전송</h4>
					</div>
					<!-- body -->
					<div class="modal-body">
						<form id="sendFileInfo">
							<input type="file" id="sendFileInput" name="files">
						</form>
					</div>
					<!-- Footer -->
					<div class="modal-footer">
						<button id="sendFileBtn" type="button" class="btn btn-default" data-dismiss="modal">보내기</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
 

		<div class="content">
			<ul id="receivedChatArea"></ul>
			
			<div data-role="footer"  id="footer">
				<div id="footvar" data-role="navbar">
					<form class="form-horizontal" onsubmit="return false;">
						<div class="form-group">
							<input id="sendChatArea" class="form-control"  type="text" /> 
							<button id="sendChatBtn" type="submit" class="btn btn-default">전송</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		
	</div>
	<input type="hidden" id="ip" value="${ip }"/>
	<input type="hidden" id="key" value="${key }"/>
	<input type="hidden" id="name" value="${name }"/>
	
	<script src="https://${ip }:3000/socket.io/socket.io.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/adapter.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main2.js"></script>

  	<script src="${pageContext.request.contextPath}/assets/js/jquery-1.12.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
    <script>
    	$("#receivedChatArea").css("height",$(window).height()-150);
    </script>
</body>
</html>