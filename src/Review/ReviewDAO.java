package Review;

import java.sql.*;

public class ReviewDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    private Connection conn1;
    private PreparedStatement pstmt1;
    private ResultSet rs1;
    public ReviewDAO(){
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
    public int InsertReview(  String UserId, String ProductGrade, String Reviewtitle, String ReviewContent){
        String Sql = "insert into review(UserId,ProductId, productgrade, reviewtitle, reviewcontent,createAt,updateAt) values (?,?,?,?, ?,now(),now());";
        try{
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1,UserId);
            pstmt.setString(2,ProductGrade);
            pstmt.setString(3,Reviewtitle);
            pstmt.setString(4,ReviewContent);
            pstmt.setString(5,ReviewContent);
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }
    public ResultSet UserReview(String UserId){
        String Sql = "Select * from Review where UserId = ?";
        try {
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1, UserId);
            rs = pstmt.executeQuery();
            return rs;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    public ResultSet ProductReview(String ProductId){
        String Sql = "Select * from Review where ProductId = ?";
        try {
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1, ProductId);
            rs = pstmt.executeQuery();
            return rs;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    public ResultSet AllReview(){
        String Sql = "SELECT * FROM Review order by createAt desc";
        try{
            pstmt=conn.prepareStatement(Sql);
            rs = pstmt.executeQuery();
            return rs;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
