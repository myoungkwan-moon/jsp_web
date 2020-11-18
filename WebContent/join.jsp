
<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 뷰포트 -->

<meta name="viewport" content="width=device-width" initial-scale="1">

<!-- 스타일시트 참조  -->

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">

<title>jsp 게시판 웹사이트</title>

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
	




	<!-- 로긴폼 -->

	<div class="container">

		<div class="col-lg-4"></div>

		<div class="col-lg-4">

			<!-- 점보트론 -->

			<div class="jumbotron" style="padding-top: 20px;">

				<!-- 로그인 정보를 숨기면서 전송post -->

				<form method="post" action="joinAction.jsp">

					<h3 style="text-align: center;">회원가입</h3>

					<div class="form-group">

						<input type="text" class="form-control" placeholder="아이디"

							name="userID" maxlength="20">

					</div>

					<div class="form-group">

						<input type="password" class="form-control" placeholder="비밀번호"

							name="userPassword" maxlength="20">

					</div>

					<div class="form-group">

						<input type="text" class="form-control" placeholder="이름"

							name="userName" maxlength="20">

					</div>

					<div class="form-group" style="text-align: center;">

						<div class="btn-group" data-toggle="buttons">

							<label class="btn btn-primary active"> <input

								type="radio" name="userGender" autocomplete="off" value="남자"

								checked>남자

							</label> <label class="btn btn-primary"> <input type="radio"

								name="userGender" autocomplete="off" value="여자" >여자

							</label>

						</div>

					</div>

					<div class="form-group">
						<input type="text" class="form-control" placeholder="이메일"
							name="userEmail" maxlength="50">
					</div>

					<div class="form-group">
						<input type="text" class="form-control" placeholder="휴대전화"
							name="userPhoneNumber" maxlength="20">
					</div>


					<input type="submit" class="btn btn-primary form-control"

						value="회원가입">

				</form>

			</div>

		</div>

	</div>

</header>
</div>


	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>



</body>

</html>

