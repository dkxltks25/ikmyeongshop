package QnA;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class QnADAO{
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private Connection conn1;
    private PreparedStatement pstmt1;
    private ResultSet rs1;

    public QnADAO(){
        try{
            String dbURL = "jdbc:mysql://localhost:3306/ikmyeong?serverTimezone=UTC";
            String dbId = "root";
            String dbPassword = "dkxltks25";
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL,dbId,dbPassword);
            conn1 =  DriverManager.getConnection(dbURL,dbId,dbPassword);
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }

    public int InsertQnA(String UserId,String QnAtitle, String QnAcontent, String QnAClass){
        String Sql = "insert into QnA(UserId,QnAtitle,QnAcontent,QnAClass,createAt,updateAt) values (?,?,?,?,now(),now())";
        try{
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1, UserId);
            pstmt.setString(2, QnAtitle);
            pstmt.setString(3, QnAcontent);
            pstmt.setString(4, QnAClass);
            return pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
            return -1;
        }
    }
    public ResultSet UserQnA(String UserId){
        String Sql = "SELECT * from QnA  WHERE UserId =?";
        try{
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1,UserId);
            rs = pstmt.executeQuery();
            return rs;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }

    //관리자 기능

    //토글 QNA보기
    public ResultSet AdminSeeAllQnA(String Number){

        //Number 가 1이면 처리한 것 0이면 처리하지않은 것
        String Sql = "SELECT * FROM QnA where QnAState=?";
        try{
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1,Number);
            return pstmt.executeQuery();
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }

    //QnA 읽음 처리 하기
    public int AdminUpdateReadQnA(String QnAId){
        String Sql = "update QnA set QnAState ='1' where QNAId= ?";
        try{
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1,QnAId);
            return pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
            return -1;
        }
    }

}