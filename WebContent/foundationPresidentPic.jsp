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


	<%
		String userID = null;
		if ((String) session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		} 
	%>
	
	
    <!-- 메뉴의 리스트 -->	
    <jsp:include page="jsp/menu_common.jsp" flush="true">    	
	<jsp:param name="userID" value="<%=userID%>"/>
	</jsp:include>
	
      <!-- 검색 메뉴 -->	 
<div id="content-wrap">
  <aside>
    <ul>
      <li><a href="foundationPresident.jsp">이력</a></li>
      <li><a href="foundationPresidentPic.jsp"  class="active">사진자료</a></li> 
      
     
    </ul>
  </aside>
  <section>
  
    <article id="FPPic">
      <h1>사진 자료</h1>
      <p>	                                       
<br>
  		
------------------------------------------------------
<br>

------------------------------------------------------
------------------------------------------------------
------------------------------------------------------
------------------------------------------------------
------------------------------------------------------
------------------------------------------------------
------------------------------------------------------
<br>

------------------------------------------------------
<br>

------------------------------------------------------
<br>

------------------------------------------------------



    </p>
    </article>
 
  </section>
<!-- end of content-wrap   -->
</div>
	
	
	
      <!-- 인사말 -->	
	
	<div>
	
 
	
	<p>
	

	
	</p>
	
	
	
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
	
	
	
</body>
