package USER;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.*;
import java.io.*;


public class UserDAO {

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    //일반 사용자 기능
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
    //중복 체크
    public int DuplicateId(String id){
        String Sql = "select * from Users where userid = ?";
        try{
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1,id);
            rs = pstmt.executeQuery();
            if(rs.next()){
                System.out.println("테스트");
                return 1;
            }else{
                return 0;
            }
        }catch(Exception e){
            e.printStackTrace();
            return -1;

        }
    }
    //카카오 이용자 입력
    public int KakaoJoin(String id, String username, String email) throws SQLException{
        if(DuplicateId(id)==1){
            return 0;
        }
        String SQL = "INSERT INTO USERS(userid, useremail,username, createAt,updateAt)";
        SQL += " VALUES(?,?,?,now(),now())";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1,id);
            pstmt.setString(2,username);
            pstmt.setString(3,email);
            int result =  pstmt.executeUpdate();
            System.out.println(result);
            return result;
        }
        catch(Exception e){
            e.printStackTrace();
            return -1;
        }
    }

    //일반이용자 입력
    public int join(String id, String password , String username, String phone, String email , String ZipCode , String address) throws SQLException{
            if(DuplicateId(id)==1){
                return 0;
            }
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
    //admin 기능

    //시용자 전체 조회
    public ResultSet AllUserSelect(){
        String Sql = "SELECT * FROM USERS order by userID asc";
        try{
            pstmt = conn.prepareStatement(Sql);
            rs = pstmt.executeQuery();
            return rs;

        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    //신규 사용자 조회
    public ResultSet NewAllUSerSelect(){
        String Sql = "SELECT * FROM USERS order by userID asc";
        try{
            pstmt =conn.prepareStatement(Sql);
            return pstmt.executeQuery();
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }

    //일반 유저 정보 검색
    public ResultSet SelectUser(String Userid){
        String Sql = "SELECT * FROM USERS WHERE USERid = ?";
        try{
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1,Userid);
            return pstmt.executeQuery();
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    //N명의 유저 조회

    //이번달 신규 유저 수
    public ResultSet NewUserGraph(String Day){
        String Sql = "SELECT count(if(U.UserId is not null,U.UserId,null)) as User,D.id FROM Users\tAS U\n" +
                "\tright join dateTimetable as D\n" +
                "\t\ton D.id = date_format(U.createAt,\"%d\")\n" +
                "\t\t\twhere UserId is null or date_format(U.createAt,\"%m\") = ?\n" +
                "\t\t\t\tgroup by D.id\n" +
                "\t\t\t\t\torder by D.id asc;";
        try{
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1,Day);
            return pstmt.executeQuery();
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

}
