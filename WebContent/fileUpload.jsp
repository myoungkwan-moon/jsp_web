<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP fileUpload Site</title>
</head>
<body>


	<form action="uploadAction.jsp" method="post" enctype="multipart/form-data">
	  file :<input type="file" name="file"> <br>
	  <input type="submit" value="upload"><br>
	</form>
	
	
</body>
</html>

