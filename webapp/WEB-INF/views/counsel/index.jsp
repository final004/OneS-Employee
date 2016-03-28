<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/assets/img/favicon.png">
<!-- 
<link
	href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
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
 
<title>OneS</title>

</head>
<body>
	<div class="container-fluid">
		<div class="header">
			<c:import url="/WEB-INF/views/includes/counsel-header.jsp" />
		</div>

		<div class="wrapper">
			<div class="intro-header">

            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-message">
                        <h1>OneS</h1>
                        <h3>간단하고 편리한 금융 상담 서비스</h3>
                        <hr class="intro-divider">
                        <ul class="list-inline intro-social-buttons">
                            <li>
                                <a href="#" class="btn btn-default btn-lg"><img alt="" src="${pageContext.request.contextPath}/assets/counsel-bootstrap/img/hanabank.png"> <span class="network-name"></span></a>
                            </li>
                            <li>
                                <a href="#" class="btn btn-default btn-lg"><img alt="" src="${pageContext.request.contextPath}/assets/counsel-bootstrap/img/hanacard.png"> <span class="network-name"></span></a>
                            </li>
                            <li>
                                <a href="#" class="btn btn-default btn-lg"><img alt="" src="${pageContext.request.contextPath}/assets/counsel-bootstrap/img/hanastock.png"> <span class="network-name"></span></a>
                            </li>
                            <li>
                            	<a href="#" class="btn btn-default btn-lg"><img alt="" src="${pageContext.request.contextPath}/assets/counsel-bootstrap/img/hanacapital.png"> <span class="network-name"></span></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
			</div>
			</div>
			
	<a name="about"></a>
		<div class="content-section-a">
        <div class="container">
            <div class="row">
                <div class="col-lg-5 col-sm-6">
                    <hr class="section-heading-spacer">
                    <div class="clearfix"></div>
                    <h2 class="section-heading">OneS는 접근성 높은 서비스</h2>
                    <p class="lead">별도의 프로그램 설치없이 익명으로 이용할 수 있는 서비스입니다.</p>
                </div>
                <div class="col-lg-5 col-lg-offset-2 col-sm-6">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/assets/counsel-bootstrap/img/accessibleservice.jpg" alt="">
                </div>
            </div>

        </div>
        <!-- /.container -->
    </div>
		
		<div class="content-section-b">
		<div class="container">
			<div class="row">
                <div class="col-lg-5 col-lg-offset-1 col-sm-push-6  col-sm-6">
                    <hr class="section-heading-spacer">
                    <div class="clearfix"></div>
                    <h2 class="section-heading">OneS는 편리한 서비스</h2>
                    <p class="lead">웹과 모바일로 언제 어디서나 채팅이나 화상전화로 편리하게 이용할 수 있는 서비스입니다.</p>
                </div>
                <div class="col-lg-5 col-sm-pull-6  col-sm-6">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/assets/counsel-bootstrap/img/convenientservice.jpg" alt="">
                </div>
            </div>
        </div>
        <!-- /.container -->
    </div>
			
		<div class="content-section-c">
        <div class="container">
            <div class="row">
                <div class="col-lg-5 col-sm-6">
                    <hr class="section-heading-spacer">
                    <div class="clearfix"></div>
                    <h2 class="section-heading">OneS는 안전한 고객지향서비스</h2>
                    <p class="lead">고객의 정보를 저장하지 않는 P2P기반의 안전한 서비스를 제공합니다.</p>
                </div>
                <div class="col-lg-5 col-lg-offset-2 col-sm-6">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/assets/counsel-bootstrap/img/securityservice.png" alt="">
                </div>
            </div>
        </div>
        <!-- /.container -->
    </div>
		

		<div class="footer">
			<c:import url="/WEB-INF/views/includes/counsel-footer.jsp" />
		</div>
</div>
	<!-- jQuery -->
    <script src="${pageContext.request.contextPath}/assets/counsel-bootstrap/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/assets/counsel-bootstrap/js/bootstrap.min.js"></script>

</body>
</html>