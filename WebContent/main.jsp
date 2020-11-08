<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width"  >
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">

<title>재단법인 웹사이트</title>

</head>
<body> 	
    <!-- 메뉴의 리스트 -->	
    
    <div><jsp:include page="jsp/menu_common.jsp" flush="false" /></div>
 
	<div class="container">
		<div class="jumbotron">
			<div class="container"></div>
			<h1>사이트 소개</h1>
			<p>최소한의 간단한 로직만을 이용해서 개발되었으며
			     디자인 템플릿으로는 부트스트랩을 이용했습니다.
			</p>
		</div>
	</div>
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2" class="active" ></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img alt="이미지1" src="images/1.jpg">
				</div>
				<div class="item">
					<img alt="이미지2" src="images/2.jpg">
				</div>
				<div class="item">
					<img alt="이미지3" src="images/3.jpg">
				</div>

			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>