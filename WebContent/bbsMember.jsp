<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbsMember.BbsmemberDAO"%>
<%@ page import="bbsMember.Bbsmember"%>
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
<style type="text/css">
	a, a:hover{
		color: :#000000;
		text-decoration: none;
	}
</style>
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
    
    <div><jsp:include page="/jsp/menu_common.jsp" flush="false" /></div>
    
    	
          <!-- 검색 메뉴 -->	 
<div id="content-wrap">
  <aside>
    <ul>
      <li><a href="notice.jsp">공지 게시판</a></li> 
      <li><a href="bbs.jsp">자유 게시판</a></li>
      
     
	<!-- 회원 전용 메뉴  로그인시만 표시-->
	<%
		if (userID != null) {
	%> 
	 <li><a href="bbsMember.jsp" class="active">회원 게시판</a></li>
	<%
		}
	%>
	
    </ul>
  </aside>
  <section> 	 
  		
  		<!-- 게시판 리스트 -->		
   
    <article id="bbsMember"> 	
	<div class="row">
			<table class="table table-striped"
				style="text-align: right; border: 1px solid #dddddd;">
				<tr>
					<th width="10%" style="background-color: #eeeeee; text-align: center">번호</th>
					<th width="50%" style="background-color: #eeeeee; text-align: center">제목</th>
					<th width="20%" style="background-color: #eeeeee; text-align: center">작성자</th>
					<th width="20%" style="background-color: #eeeeee; text-align: center">게시일</th>
				</tr>
					<%
						BbsmemberDAO bbsmDAO = new BbsmemberDAO();
						ArrayList<Bbsmember> list = bbsmDAO.getList(pageNumber);
																		
						for(int i=0; i < list.size(); i++){
					%>
						<tr>						
							<td width="10%" style=" text-align: center"><%= list.get(i).getBbsID() %></td>
							<td width="50%" style=" text-align: center"><a href="viewbbsmember.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle()%></a></td>
							<td width="20%" style=" text-align: center"><%= list.get(i).getUserID()%></td>
							<td width="20%" style=" text-align: center"><%= list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11,13)+"시" + list.get(i).getBbsDate().substring(14,16)+"분"%></td>
						</tr>
					<%		
						}
					%>
				</tbody>
			</table>
			<%
				if(pageNumber != 1){
			%>
			<a href="bbsMember.jsp?pageNumber=<%= pageNumber-1 %>" class="btn btn-success btn-arrow-left">이전</a>
			<%
				} if(bbsmDAO.nextPage(pageNumber+1)){
			%>
			<a href="bbsMember.jsp?pageNumber=<%= pageNumber+1 %>" class="btn btn-success btn-arrow-right">다음</a>
			<%		
				}
			%>
			<a href="writememberbbs.jsp" class="btn btn-primary pull-right">글쓰기</a>
	</div>
	</article>
	
  	</section>
  	 	 
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>