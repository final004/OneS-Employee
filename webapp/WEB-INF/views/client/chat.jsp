<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/assets/css/jquery.mobile-1.4.5.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/chat.css" />
<script src="${pageContext.request.contextPath}/assets/js/jquery-1.12.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.mobile-1.4.5.min.js"></script>
</head>
<body>

	<div data-role="page" id="pageone">
		<c:import url="/WEB-INF/views/includes/header.jsp" />
		
		<div data-role="main" class="ui-content">
			<ul id="receivedChatArea"></ul>
		</div>
		
		<div data-role="footer"  id="footer">
			<div id="navbar" data-role="navbar">
				<form onsubmit="return false;">
					<input id="sendChatArea"  type="text" /> 
					<input id="sendChatBtn" type="submit" data-inline="true"  value="전송" />
				</form>
			</div>
		</div>
		
		<table id="tables">
			<tr>
				<td>
					<form id="sendFileInfo">
						<input type="file" id="sendFileInput" name="files">
					</form>
				</td>
			</tr>
			<tr>
				<td><button id="sendFileBtn">Send</button></td>
				<td></td>
			</tr>
			<tr>
				<td>
					<progress id="sendProgress" max="0" value="0"></progress>
					<div id="bitrate"></div>
				</td>
			</tr>
			<tr>
				<td>
					<span id="status"></span>
				</td>
				<td style="background-color: black"><!--구분선--></td>
				<td></td>
			</tr>
		</table>
		
	</div>
	<input type="hidden" id="ip" value="${ip }"/>
	<input type="hidden" id="key" value="${key }"/>
	<input type="hidden" id="name" value="${name }"/>
	
	<script src="https://${ip }:3000/socket.io/socket.io.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/adapter.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main2.js"></script>
	<script>
    	$("#receivedChatArea").css("height",$(window).height()-160);
    	$("#tables").css("display","none");
    </script>

</body>
</html>