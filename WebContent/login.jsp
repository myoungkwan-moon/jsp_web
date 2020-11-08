<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp 게시판 웹 사이트</title>
<meta name="viewport" content="width=device-width", initial-scale="1">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>

	<%
		String userID = null;
		if ((String) session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}	
	%>
	
<nav class="navbar navbar-default">	
  <div class="container-fluid">	
    <!-- 메뉴에서 가장 왼쪽, 모바일에서 표시되는 제목 -->	
    <div class="navbar-header">	
      <!-- 모바일때 표시되는 메뉴 버튼(PC 버젼에서는 보이지 않는다.)  -->	
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">	
        <span class="sr-only">Toggle navigation</span>	
        <span class="icon-bar"></span>	
        <span class="icon-bar"></span>	
        <span class="icon-bar"></span>	
      </button>	
      <!-- 메뉴의 홈페이지 이름 -->	
      <a class="navbar-brand" href="#">Brand</a>	
    </div>	
 	
    <!-- 메뉴의 리스트 -->	
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">	
      <ul class="nav navbar-nav">	
        <!-- Link 메뉴 -->	
        <li><a href="main.jsp">메인</a></li>
        <!-- DropDown 형식의 메뉴 -->		
        <li class="dropdown">	
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">재단소개 <span class="caret"></span></a>	
          <ul class="dropdown-menu">	
            <li><a href="#">인사말</a></li>	
            <li><a href="#">설립목적</a></li>	
            <li><a href="#">연혁</a></li>		
            <li><a href="#">주요사업</a></li>	
            <li><a href="#">사업현황</a></li>	
            <li><a href="#">결산</a></li>	
            <li><a href="#">임원</a></li>	
            <li><a href="#">찾아오시는길</a></li>
            <li role="separator" class="divider"></li>	
            <li><a href="#">Separated link</a></li>	
            <li role="separator" class="divider"></li>	
            <li><a href="#">One more separated link</a></li>	
          </ul>	
        <li class="dropdown">	
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> 주요사업 <span class="caret"></span></a>	
          <ul class="dropdown-menu">		
            <li><a href="#">장학사업</a></li>	
            <li><a href="#">육성사업</a></li>
            <li role="separator" class="divider"></li>	
            <li><a href="#">해외 장학사업</a></li>	
            <li role="separator" class="divider"></li>	
            <li><a href="#">해외 육성사업</a></li>	
          </ul>	
        </li>		
        <li class="dropdown">	
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">후원안내 <span class="caret"></span></a>	
          <ul class="dropdown-menu">	
            <li><a href="#">후원자 명단</a></li>
            <li><a href="#">월별 후원자 명단</a></li>		
            <li><a href="#">온라인 (정기) 후원</a></li>	
            <li role="separator" class="divider"></li>	
            <li><a href="#">개인정보 처리 방침</a></li>	
          </ul>	
        </li>		
        <li class="dropdown">	
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">게시판  <span class="caret"></span></a>	
          <ul class="dropdown-menu">	
            <li><a href="#">공지사항</a></li>		
            <li role="separator" class="divider"></li>	
            <li><a href="#">장학생 모임</a></li>	
            <li role="separator" class="divider"></li>	
            <li><a href="#">자유 게시판</a></li>	
          </ul>	
        </li>	
        <li class="dropdown">	
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">자료실 <span class="caret"></span></a>	
          <ul class="dropdown-menu">	
            <li><a href="#">문서 자료</a></li>		
            <li><a href="#">사진 자료 </a></li>	
            <li><a href="#">동영상 자료</a></li>	
            <li role="separator" class="divider"></li>	
            <li><a href="#">장학생 독후감 자료</a></li>	
          </ul>	
        </li>
        <li class="dropdown">	
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">재단장 소개 <span class="caret"></span></a>	
          <ul class="dropdown-menu">	
            <li><a href="#">이력</a></li>	
            <li><a href="#">사진자료</a></li>	
            <li><a href="#">재단장 소개서</a></li>		
          </ul>	
        </li>
      </ul>		 
      <!-- 검색 메뉴 -->	
      <!-- 오른쪽 정렬의 메뉴 -->	
			<%
				if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul>
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul></li>
			</ul>
			<%
				}
			%>

      
    </div>	
  </div>	
</nav>


<div class="container">
	<div class="col-lg-4"></div>
	<div class="col-lg-4">
		<div class="jumbotron" style="padding-top:20px;">
			<form method="post" action="loginAction.jsp">
				<h3 style="text-align:center">로그인 화면</h3>
				<div class="form-group">
					<input type ="text" class="form-control" placeholder="아이디" name="userID" mexlength="20">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" mexlength="20">
				</div>
				<input type="submit" class="btn btn-primary form-control"  value="로그인">
			</form>		
		</div>
	</div>
</div>


</body>
</html>