<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="doctable.BbsDAO"%>
<%@ page import="doctable.Bbs"%>
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
			
		int pageNumber = 1;
		if(request.getParameter("pageNumber")!= null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
      <li><a href="docData.jsp" class="active">문서 자료</a></li>
      <li><a href="picData.jsp">사진 자료</a></li>
      <li><a href="movData.jsp">동영상 자료</a></li> 
     
    </ul>
  </aside>
  <section>
  
                            
    <!-- 게시판 리스트 -->		
   
    <article id="docData"> 
      <h1>문서 자료</h1>
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
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
												for(int i=0; i < list.size(); i++){
					%>
						<tr>
							<td><%= list.get(i).getBbsID() %></td>
							<td><a href="docData?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle()%></a></td>
							<td><%= list.get(i).getUserID()%></td>
							<td><%= list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11,13)+"시" + list.get(i).getBbsDate().substring(14,16)+"분"%></td>
						</tr>
					<%		
						}
					%>
				</tbody>
			</table>
			<%
				if(pageNumber != 1){
			%>
			<a href="docData.jsp?pageNumber=<%= pageNumber-1 %>" class="btn btn-success btn-arrow-left">이전</a>
			<%
				} if(bbsDAO.nextPage(pageNumber+1)){
			%>
			<a href="docData?pageNumber=<%= pageNumber+1 %>" class="btn btn-success btn-arrow-right">다음</a>
			<%		
				}
			%>
			<a href="writedocdata.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div> 
	</article>
 
  </section>
<!-- end of content-wrap   -->
</div>
	
	
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
	
	
	
</body>
</html>