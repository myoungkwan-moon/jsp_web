<%@ page import="file.FileDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %> <!-- 동일한 파일명일 시 바꿔주는 클래스 -->
<%@ page import="com.oreilly.servlet.MultipartRequest" %>	<!-- 실제로 파일업로드를 수행할 수 있는 클래스 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일업로드 메인 페이지</title>
</head>
<body>
	<%
		String directory = application.getRealPath("/upload/");		
        // 파일의 저장될 서버의 경로
		/* C:\JSP\업로드(upload)... 이런식으로 루트 디렉터리 밖으로 안전한        SecureCoding을 하는것을 더욱 권장! */
		int maxSize = 1024 * 1024 * 100;	// 파일크기  10MB로 제한
		String encoding = "UTF-8";
    
		MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding,	new DefaultFileRenamePolicy());	
	
		String fileName = multipartRequest.getOriginalFileName("file");
		// getOriginalFileName()메소드는 사용자가 직접 지정한 파일명을 반환한다.
		String fileRealName = multipartRequest.getFilesystemName("file");
		// getOriginalFilename()메소드는 실제 업로드된 파일 이름을 String 타입으로 반환한다.
		
		// secure coding !!!!
		if(!fileName.endsWith(".doc") && !fileName.endsWith(".hwp") && !fileName.endsWith(".pdf") && !fileName.endsWith(".xls") && !fileName.endsWith(".csv")) {
			File file = new File(directory + fileRealName);
			file.delete();
			out.write("업로드가 불가능한 확장자입니다.");
		}	// 사용자가 업로드를 하고 확장자를 검증한 이후에 아니라면 해당 파일을 삭제.
		else {
			new FileDAO().upload(fileName, fileRealName);	
            // FileDAO클래스의 upload()메서드에 인자를 준다.
			out.write("파일명: "+ fileName + "<br>");         
            // PreparedStatement로 DB에 접근을 처리해놓았음.DAO에서
			out.write("실제 파일명 : "+ fileRealName + "<br>");	
		}
	%>
</body>
</html>