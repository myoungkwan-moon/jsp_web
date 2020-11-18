<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="notice.NoticeDAO"%>
<%@ page import="notice.Notice"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width"  >
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">


</head>
<body>
	<%
		String userID = null;
		if ((String) session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		} 
		
		int pageNumber = 1;
		if(request.getParameter("pageNumber")!= null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
    <!-- 메뉴의 리스트 -->	
    
    <div><jsp:include page="jsp/menu_common.jsp" flush="false" /></div>
    	
              <!-- 검색 메뉴 -->	 
<div id="content-wrap">
  <aside>
    <ul>
      <li><a href="notice.jsp" class="active">공지 게시판</a></li> 
      <li><a href="bbs.jsp">자유 게시판</a></li>
      
      <!-- 회원 전용 메뉴  로그인시만 표시-->
		<%
		if (userID != null) {
		   %> 
			<li><a href="bbsMember.jsp" >회원 게시판</a></li>
		<%
		}
		%>
		
     
    </ul>
  </aside>
  <section> 	
    
    <!-- 공지 게시판 리스트 -->		
    
    <article id="notice"> 		
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: right; border: 1px solid #dddddd;">
				<tr>
					<th style="background-color: #eeeeee; text-align: right">번호</th>
					<th style="background-color: #eeeeee; text-align: right">제목</th>
					<th style="background-color: #eeeeee; text-align: right">작성자</th>
					<th style="background-color: #eeeeee; text-align: right">게시일</th>
				</tr>
					<%
						NoticeDAO noticeDAO = new NoticeDAO();
						ArrayList<Notice> list = noticeDAO.getList(pageNumber);
						for(int i=0; i < list.size(); i++){
					%>
						<tr>
							<td><%= list.get(i).getNoticeID() %></td>
							<td><a href="noticeView.jsp?noticeID=<%= list.get(i).getNoticeID() %>"><%= list.get(i).getNoticeTitle()%></a></td>
							<td>관리자</td>
							<td><%= list.get(i).getNoticeDate().substring(0,11) + list.get(i).getNoticeDate().substring(11,13)+"시" + list.get(i).getNoticeDate().substring(14,16)+"분"%></td>
						</tr>
					<%		
						}
					%>
				</tbody>
			</table>
			<%
				if(pageNumber != 1){
			%>
			<a href="notice.jsp?pageNumber=<%= pageNumber-1 %>" class="btn btn-success btn-arrow-left">이전</a>
			<%
				} if(noticeDAO.nextPage(pageNumber+1)){
			%>
			<a href="notice.jsp?pageNumber=<%= pageNumber+1 %>" class="btn btn-success btn-arrow-right">다음</a>
			<%		
				}
			%>
			<a href="writeNotice.jsp" class="btn btn-primary pull-right">공지 글쓰기</a>
		</div>
	</div>
	</article>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>