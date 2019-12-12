package Notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class NoticeDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private Connection conn1;
    private PreparedStatement pstmt1;
    private ResultSet rs1;

    public NoticeDAO(){
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

    public int InsertNotice(String Noticetitle,String NoticeContent){
        String Sql = "insert into notice(noticetitle, noticeContent,createAt,updateAt) values(?,?,now(),now())";

        try{
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1,Noticetitle);
            pstmt.setString(2,NoticeContent);
            return pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
            return -1;
        }
    }

    public ResultSet listNotice(){
        String Sql = "select * from notice";
        try{
            pstmt = conn.prepareStatement(Sql);
            ResultSet rs = pstmt.executeQuery();
            return rs;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public ResultSet SelectNotice(String noticeId ){
        String Sql = "SELECT * FROM NOTICE WHERE NOTICEID = ?";
        try{
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1,noticeId);
            return pstmt.executeQuery();
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
