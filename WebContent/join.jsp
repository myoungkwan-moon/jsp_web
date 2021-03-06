
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


		<div class="col-lg-4">

			<!-- 점보트론 -->
			<div class="jumbotron" style="padding-top: 20px;">

				<!-- 로그인 정보를 숨기면서 전송post -->
				<form method="post" action="joinAction.jsp">
					<h3 style="text-align: center;">회원가입</h3>

					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" 	name="userID" maxlength="20">
						<!-- Button 
    					<button type="button" id="userIDSearch" class="btn btn-info" data-toggle="modal">아이디 중복검사</button>
   				    	 <div class="alert alert-success" id="alertsuccess" style="display: none;">사용가능</div>
   					     <div class="alert alert-danger" id="alertdanger" style="display: none;">사용불가</div>
   					     trigger modal -->
   					     
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
							<label class="btn btn-primary active"> 
							<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자</label>
							<label class="btn btn-primary"> 
							<input type="radio" name="userGender" autocomplete="off" value="여자" >여자</label>

						</div>

					</div>

					<div class="form-group">
						<input type="text" class="form-control" placeholder="이메일"	name="userEmail" maxlength="50">
					</div>

					<div class="form-group">
						<input type="text" class="form-control" placeholder="휴대전화" name="userPhoneNumber" maxlength="20">
					</div>


					<input type="submit" class="btn btn-primary form-control" value="회원가입">

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
	
<script type="text/javascript">
/*
제이쿼리 사용 메서드 설명
$('선택자').hide(); 선택대상 감추기 - style="display:none;" 과 같음
$('선택자').show(); 선택대상 대상보이기 - style="display:'';" 과 같음
$('선택자').val(); 선택된 대상에 값을 넣거나 가지고 오기
$('선택자').addClass();
$('선택자').removeClass();
*/
var check = "";

$('#userIDSearch').click(function () {
    var value = $('#userID').val();
    if(value == "id001"){
         $('#alertsuccess').show();
         $('#alertdanger').hide();
         check = true;
    }else{
         $('#alertsuccess').hide();
         $('#alertdanger').show();
         check = false; 
    }
})
    

</script>

</body>
</html>

