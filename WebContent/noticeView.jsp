<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="notice.NoticeDAO"%>
<%@ page import="notice.Notice"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width , initial-scale=1">
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
		int NoticeID = 0;
		if (request.getParameter("noticeID") != null) {
			NoticeID = Integer.parseInt(request.getParameter("noticeID"));
		}
		if (NoticeID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='notice.jsp'");
			script.println("</script>");
		}
		
		Notice notice = new NoticeDAO().getNotice(NoticeID);
	%>

    <!-- 메뉴의 리스트 -->	
    
       
    <div id="wrap">
    <jsp:include page="jsp/menu_common.jsp" flush="true">    	
	<jsp:param name="userID" value="<%=userID%>"/>
	</jsp:include>
    </div>
      <!-- 검색 메뉴 -->	

 
	<div class="container">
		<div class="row">

			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd;">
				<tr>
					<th colspan="3"
						style="background-color: #eeeeee; text-align: center">게시판 글보기					
					</td>
				</tr>
				<tr>
					<td style="width: 20%;">글 제목</td>
					<td colspan="2"><%=notice.getNoticeTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></td>
				</tr>
				<tr>
					<td style="width: 20%;">작성자</td>
					<td colspan="2"><%=notice.getUserID()%></td>
				</tr>
				<tr>
					<td style="width: 20%;">작성일자</td>
					<td colspan="2"><%=notice.getNoticeDate().substring(0, 11) + notice.getNoticeDate().substring(11, 13) + "시"
					+ notice.getNoticeDate().substring(14, 16) + "분"%></td>
				</tr>
				<tr>
					<td style="width: 20%;">내용</td>
					<td colspan="2" style="min-height: 200px; text-align: left;">
					<%=
							notice.getNoticeContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") 
					%></td>
				</tr>
			</table>
			<a href="notice.jsp" class="btn btn-primary">목록</a>
			<%
				if(userID != null && userID.equals(notice.getUserID())){
			%>
				<a href="updateNotice.jsp?noticeID=<%=NoticeID %>" class="btn btn-primary">수정</a>
				<a onclick="return confirm('정말로 삭제하시겠습니까?')"  href="deleteActionNotice.jsp?noticeID=<%= NoticeID %>" class="btn btn-primary">삭제</a>
			
			<%
				}
			%>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>