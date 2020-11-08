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

 <title>구글지도 회사 위치</title>

</head>
<body onload="initialize()"> 


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
      <li><a href="greetings.jsp" class="active">인사말</a></li>
      <li><a href="history.jsp">설립목적</a></li>
      <li><a href="history.jsp">연혁</a></li>
      <li><a href="#">주요사업</a></li>
      <li><a href="#">결산</a></li>
      <li><a href="#">임원</a></li>
      <li><a href="#">찾아오시는길</a></li> 
      
    </ul>
  </aside>
  <section>
      <article id="map">
      <h1>약도</h1>
 		<div id="map_canvas"style="width:500px; height:300px;"></div> 
   </article>
  </section>
<!-- end of content-wrap   -->
</div>
	
	
	
      <!-- 인사말 -->	
	
	<div>
	
 
	
	<p>
	

	
	</p>
	
	 <script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
 <script>
  function initialize() {
   var myLatlng = new google.maps.LatLng(37.495367, 126.887497);
   var mapOptions = {
        zoom: 17,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
   }
   var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
   var marker = new google.maps.Marker({
       position: myLatlng,
       map: map,
       title: "구로구청"
});
  }
  
 </script>
	
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
	
	
	
	
	
	
</body>
</html>