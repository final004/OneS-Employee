<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>OneS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/assets/css/jquery.mobile-1.4.5.min.css">
<link href="${pageContext.request.contextPath}/assets/css/index.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/plugin/jquery.bxslider/jquery.bxslider.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/assets/js/jquery-1.12.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.mobile-1.4.5.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugin/jquery.bxslider/jquery.bxslider.min.js"></script>
<style>
.bx-wrapper .bx-pager, .bx-wrapper .bx-controls-auto{ visibility: hidden; }
</style>
</head>
<body>

	<div data-role="page" id="pageone">
		<c:import url="/WEB-INF/views/includes/header.jsp" />

		<div data-role="main" class="ui-content">
			<div id="slider">
				<ul class="bxslider">
					<li><img src="${pageContext.request.contextPath}/assets/img/slider/ad01.png" /></li>
					<li><img src="${pageContext.request.contextPath}/assets/img/slider/ad02.png" /></li>
					<li><img src="${pageContext.request.contextPath}/assets/img/slider/ad03.png" /></li>
					<li><img src="${pageContext.request.contextPath}/assets/img/slider/ad04.png" /></li>
					<li><img src="${pageContext.request.contextPath}/assets/img/slider/ad05.png" /></li>
				</ul>
			</div>
			<div id="business">
				<div onclick='location.href="#bank"'><a href="#bank" class="ui-btn">Bank</a></div>
				<div onclick='location.href="#card"'><a href="#card" class="ui-btn">Card</a></div>
				<div onclick='location.href="#capital"'><a href="#capital" class="ui-btn">Capital</a></div>
				<div onclick='location.href="#stock"'><a href="#stock" class="ui-btn">Stock</a></div>
			</div>
		</div>
		
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div>
	
	
	<div data-role="page" id="bank">
		<c:import url="/WEB-INF/views/includes/header.jsp" />
		
	   
	   <div data-role="main" class="ui-content">
	   
			<div class="detailMenuImg">
				<img src="${pageContext.request.contextPath}/assets/img/slider/edit_01.png" >
			</div>
			
	   		<div class="detailMenu">
		   		<div style="background-image:url('${pageContext.request.contextPath}/assets/img/bank/account.png')">계 좌</div>
		   		<div style="background-image:url('${pageContext.request.contextPath}/assets/img/bank/bills.png')">공과금</div>
		   		<div style="background-image:url('${pageContext.request.contextPath}/assets/img/bank/deposit.png')">예 금</div>
		   		<div style="background-image:url('${pageContext.request.contextPath}/assets/img/bank/fe.png')">외 환</div>
		   		<div style="background-image:url('${pageContext.request.contextPath}/assets/img/bank/fund.png')">펀 드</div>
		   		<div style="background-image:url('${pageContext.request.contextPath}/assets/img/bank/loan.png')">대 출</div>
		   		<div style="background-image:url('${pageContext.request.contextPath}/assets/img/bank/account.png')">계 좌</div>
		   		<div style="background-image:url('${pageContext.request.contextPath}/assets/img/bank/account.png')">계 좌</div>
		   		<div style="background-image:url('${pageContext.request.contextPath}/assets/img/bank/account.png')">계 좌</div>
	   		</div>
		</div>
		
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div> 
	
	<div data-role="page" id="card">
		<c:import url="/WEB-INF/views/includes/header.jsp" />
	   
	   <div data-role="main" class="ui-content">
			
			<div class="detailMenuImg">
				<img src="${pageContext.request.contextPath}/assets/img/slider/edit_02.png" >
			</div>
			
	   		<div class="detailMenu">
		   		<div>Card 1</div>
		   		<div>Card 2</div>
		   		<div>Card 3</div>
		   		<div>Card 4</div>
		   		<div>Card 5</div>
		   		<div>Card 6</div>
		   		<div>Card 7</div>
		   		<div>Card 8</div>
		   		<div>Card 9</div>
	   		</div>
		</div>
		
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div> 
	
	
	<div data-role="page" id="capital">
		<c:import url="/WEB-INF/views/includes/header.jsp" />
	   
	   <div data-role="main" class="ui-content">
			
			<div class="detailMenuImg">
				<img src="${pageContext.request.contextPath}/assets/img/slider/edit_03.png" >
			</div>
			
	   		<div class="detailMenu">
		   		<div>Capital 1</div>
		   		<div>Capital 2</div>
		   		<div>Capital 3</div>
		   		<div>Capital 4</div>
		   		<div>Capital 5</div>
		   		<div>Capital 6</div>
		   		<div>Capital 7</div>
		   		<div>Capital 8</div>
		   		<div>Capital 9</div>
	   		</div>
		</div>
		
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div> 
	
	
	<div data-role="page" id="stock">
		<c:import url="/WEB-INF/views/includes/header.jsp" />
	   
	   <div data-role="main" class="ui-content">
		
			<div class="detailMenuImg">
				<img src="${pageContext.request.contextPath}/assets/img/slider/edit_04.png" >
			</div>
			
	   		<div class="detailMenu">
		   		<div>Stock 1</div>
		   		<div>Stock 2</div>
		   		<div>Stock 3</div>
		   		<div>Stock 4</div>
		   		<div>Stock 5</div>
		   		<div>Stock 6</div>
		   		<div>Stock 7</div>
		   		<div>Stock 8</div>
		   		<div>Stock 9</div>
	   		</div>
		</div>
		
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div> 
	
	<script>
		$('.selectedBtn a').on("click", function(e){
			var url ="${pageContext.request.contextPath}/chat/waiting/?name=client&key="+e.target.innerText;
			$(location).attr('href',url);
		});
		
		$('.ui-content').css("height",$(window).height()-110);
		
		$(document).ready(function () {
			$('.bxslider').bxSlider({
				auto : true,
				autoControls : true,
				useCSS:false,
				controls : false,
				pager : false
			});
		});
	</script>
	
</body>
</html>
