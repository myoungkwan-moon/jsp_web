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
	
	
	
    <!-- aside -->
<div id="content-wrap">
  <aside>
    <ul>
      <li><a href="scholarshipFund.jsp">장학사업</a></li>	
      <li><a href="fosterFund.jsp" class="active">육성사업</a></li>	
      
    </ul>
  </aside>
  <section>
    <article id="greetings">
      <h1>육성사업</h1>
      <p>	
      1-----------------------------------------------------------------------------------------------------------
      <br> 
       
</p>
    </article>
  </section>
<!-- end of content-wrap   -->


</div>
	
	
	 
	<div>
	
 
	
	<p>
	
	</p>
	
	
	
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
	
	
	
	
	
	
</body>
</html>