package ProductQ;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ProductQDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    private Connection conn1;
    private PreparedStatement pstmt1;
    private ResultSet rs1;
    public ProductQDAO(){
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

    public int InsertProductQ(String UserId,String ProductId,String ProductQCategori,String ProductQtitle,String ProductQContent,String ProductQState){
        String Sql = "insert into ProductQ(UserId,ProductId,ProductQCategori,ProductQtitle,ProductQContent,ProductQState,createAt,updateAt) values(?,?,?,?,?,?,now(),now())";
        try{
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1,UserId);
            pstmt.setString(2,ProductId);
            pstmt.setString(3,ProductQCategori);
            pstmt.setString(4,ProductQtitle);
            pstmt.setString(5,ProductQContent);
            pstmt.setString(6,ProductQState);
            return pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
            return 0;
        }
    }
    public ResultSet UserProductQ(String UserId){
        String Sql = "SELECT * FROM ProductQ WHERE USERID =?";
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
    public ResultSet ProductProductQ(String ProductId){
        String Sql = "SELECT * FROM ProductQ WHERE ProductId =?";
        try{
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1,ProductId);
            rs = pstmt.executeQuery();
            return rs;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    public ResultSet AllProductQ(){
        String Sql = "SELECT * FROM WHERE";
        try{
            pstmt = conn.prepareStatement(Sql);
            rs = pstmt.executeQuery();
            return rs;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
}

