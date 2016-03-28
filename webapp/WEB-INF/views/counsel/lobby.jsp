<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<title>OneS</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png">
<!--  
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
-->
<link
	href="${pageContext.request.contextPath}/assets/counsel-bootstrap/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<link
	href="${pageContext.request.contextPath}/assets/counsel-bootstrap/css/landing-page.css"
	rel="stylesheet" media="screen">
<link
	href="${pageContext.request.contextPath}/assets/counsel-bootstrap/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" media="screen"> 
<style>
.content { height:100%; }
</style>
</head>
<body>
	<div class="container-fluid">
		<c:import url="/WEB-INF/views/includes/counsel-header.jsp"/>
		<div class="wrapper">
			<div class="content">
				<table id="rooms" class="table table-hover">
					<tr>
						<th>업무 내용</th>
						<th>신청 시간</th>
					</tr>
				</table>				
			</div>
		</div>
		<c:import url="/WEB-INF/views/includes/counsel-footer.jsp"/>
	</div>
  	<script src="${pageContext.request.contextPath}/assets/js/jquery-1.12.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://${ip }:3000/socket.io/socket.io.js"></script>
	<script>
		$(function(){
			var socket = io.connect('https://${ip }:3000');
			var $rooms = $('#rooms');
			
			$(".content").css("height",$(window).height()-120);
			
			socket.emit('get clientList',{},function(){});
			
			socket.on('rooms', function(data){
				console.log(data);
				var html = '<tr>';
				html += '<th>업무 내용</th>';
				html += '<th>신청 시간</th>';
				html += '</tr>';
				for(var key in data){
					html += '<tr class="roomname" id="'+key+'">'
					html += '<td>'+data[key].roomname+"</td>";
					html += '<td>'+data[key].time+"</td>";
					html += '</tr>'
				}
				if(data.size==0) html += '<tr colspan=2>대기 고객이 없습니다.</tr>';
				$rooms.html(html);
				
			});
			
			$(document).on("click", ".roomname",function(e){
				setInterval(function(){ alert("Hello"); }, 3000);
				var url ="${pageContext.request.contextPath}/counsel/chat/?name=server&key="+e.target.parentNode.firstChild.innerText;
				$(location).attr('href',url);
				socket.emit('pull client',{id : e.target.parentNode.id}, function(){});
			});
			
			
		})
	</script>
</body>
</html>