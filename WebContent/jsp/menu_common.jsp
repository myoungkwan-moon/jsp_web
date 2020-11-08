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
<meta name="viewport" content="width=device-width" >
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">

</head>
<body>
     <div id="wrap">
	 <header>   
  
	<%
		String userID = null;
		if ((String) session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		} 
	%>
	
   
     
    <a class="logo" href="main.jsp"><img src="https://poiemaweb.com/img/logo.png"></a>
    <nav class="navbar navbar-default">
    <!-- 메뉴에서 가장 왼쪽, 모바일에서 표시되는 제목 -->	
    <div class="navbar-header">	
      <!-- 모바일때 표시되는 메뉴 버튼(PC 버젼에서는 보이지 않는다.)  -->	
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<!-- 게시판 아이콘 작대기(-) 하나를 의미 -->
				<span class="icon-bar"></span>
				<!-- 게시판 아이콘 작대기(-) 하나를 의미 -->
				<span class="icon-bar"></span>
				<!-- 게시판 아이콘 작대기(-) 하나를 의미 -->
			</button>	
    </div>	
    

	<div  class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">	
      <ul class="nav navbar-nav">	
        <!-- Link 메뉴 -->	 
        <!-- DropDown 형식의 메뉴 -->		
        <li class="dropdown">	
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">재단소개 <span class="caret"></span></a>	
          <ul class="dropdown-menu">	
            <li><a href="greetings.jsp">인사말</a></li>	
            <li><a href="#">설립목적</a></li>	
            <li><a href="history.jsp">연혁</a></li>		
            <li><a href="#">주요사업</a></li>	
            <li><a href="#">사업현황</a></li>	
            <li><a href="#">결산</a></li>	
            <li><a href="#">임원</a></li>	
            <li><a href="#">찾아오시는길</a></li>
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
            <li><a href="bbs.jsp">자유 게시판</a></li>	
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
  </nav>
  </header>
  </div>
  
   
</body>
</html>

