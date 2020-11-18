package user;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL="jdbc:mysql://localhost:3306/bbs?serverTimezone=UTC";
			String dbID="siteadmin";
			String dbPassword="killer";
			Class.forName("com.mysql.jdbc.Driver");
		    conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		    
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		//System.Println("1111111111111111");
		String SQL = "SELECT userPassword FROM user WHERE userID =  ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()){
				if(rs.getString(1).equals(userPassword))
					return 1; // 로그인 성공
				else
					return 0; // 비밀번호 불일치
			}
			return -1; // 아이디가 없음
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류 
	}
	
	public int join(User user) {
		 String SQL = "insert into USER (userID, userPassword, userName, userGender, userEmail,userPhoneNumber) values(?,?,?,?,?,?)";
		 //String SQL = "INSERT INTO USER VALUES (?,?,?,?,?)";
		 //insert into dbo.[USER](userID, userPassoword, userName, userGender, userEmail)values('gildong', '123456', '홍길동', '남자', 'gildong@naver.com');
		 //SELECT userPassword FROM dbo.[USER] WHERE userID =  'sdfsdf';
		 try {
			  
			 pstmt = conn.prepareStatement(SQL);
			  
			  pstmt.setString(1,  user.getUserID());
			  pstmt.setString(2,  user.getUserPassword());
			  pstmt.setString(3,  user.getUserName());
			  pstmt.setString(4,  user.getUserGender());
			  pstmt.setString(5,  user.getUserEmail());
			  pstmt.setString(6,  user.getUserPhoneNumber());
			  
			  return pstmt.executeUpdate();
			  
		 } catch(Exception e) {
			 e.printStackTrace();
		 }
		 return -1; // 데이터 베이스 오류 
	}

}