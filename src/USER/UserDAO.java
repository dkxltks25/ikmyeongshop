package USER;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.*;



public class UserDAO {

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public UserDAO(){
        try{
            String dbURL = "jdbc:mysql://localhost:3306/ikmyeong?serverTimezone=UTC";
            String dbId = "root";
            String dbPassword = "dkxltks25";
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL,dbId,dbPassword);
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    public int login(String userId, String userPassword) throws SQLException {
        String SQL = "SELECT userPassword FROM USERS WHERE userId = ? ";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1,userId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                if (rs.getString(1).equals(userPassword)) {
                    return 1; //로그인 성공
                } else {
                return 0;
            }
        }
        return -1;
    }catch(Exception e){
                e.printStackTrace();
            }
        return -2;
    }

    public int join(String id, String password , String username, String phone, String email , String ZipCode , String address) throws SQLException{
            String SQL = "INSERT INTO USERS(userid,userpassword, useremail, userphone,username, userzipcode, userAdress, createAt,updateAt)";
              SQL += " VALUES(?,?,?,?,?,?,?,now(),now())";
              try{
                  pstmt = conn.prepareStatement(SQL);
                  pstmt.setString(1,id);
                  pstmt.setString(2,password);
                  pstmt.setString(3,email);
                  pstmt.setString(4,phone);
                  pstmt.setString(5,username);
                  pstmt.setString(6,ZipCode);
                  pstmt.setString(7,address);
                  return pstmt.executeUpdate();
              }
              catch(Exception e){
                  e.printStackTrace();
                  return -1;
              }
    }

}
