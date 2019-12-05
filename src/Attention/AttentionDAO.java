package Attention;

import USER.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.*;



public class AttentionDAO {

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public AttentionDAO(){
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
    public int SelectAttention(String UserId, String ProductId){
        String Sql = "SELECT * FROM Attention WHERE UserId = ? AND ProductId = ?";
        try{
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1,UserId);
            pstmt.setString(2,ProductId);
            rs = pstmt.executeQuery();
            if(rs.next()){
                return 1;
            }else{
                return 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }
    public int InsertAttention(String UserId, String ProductId){
        String Sql = "Insert into Attention(UserId,ProductId,createAt,updateAt) values (?,?,now(),now());";
        try{
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1,UserId);
            pstmt.setString(2,ProductId);
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return -2;
        }
    }

    public ResultSet AttentionList (String UserId){
        String Sql = "SELECT a.AttentionId,p.productName, p.productPrice,P.ProductId, p.ProductCount FROM Attention As a"
                        + " inner join Users As U"
                            + " on a.UserId = U.UserId"
                                +" inner join Product AS p"
                                    +" on a.productId = p.productId "
                                        + " Where U.UserId = ?";
        try{
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1, UserId);
            return pstmt.executeQuery();
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }

    //이번달에서 가장 많은 관심을 가진 상품
    public ResultSet BestAttention (String Day){
        String Sql = "SELECT count(if(A.AttentionId is not null,A.AttentionId,null)) As Count,P.* FROM attention As A\n" +
                "\tright join datetimeTable As D\n" +
                "\t\ton D.id = date_format(A.createAt,\"%d\")\n" +
                "\t\t\tinner join Product AS P\n" +
                "\t\t\t\ton P.ProductId = A.ProductId\n" +
                "\t\t\twhere date_format(A.createAt,\"%m\") = 12 Or date_format(A.createAt,\"%d\") is null\n" +
                "\t\t\tgroup by D.id\n" +
                "\t\t\t\thaving count !=0\n" +
                "\t\t\t\t\torder by Count desc;";
        try{
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1,Day);
            return pstmt.executeQuery();
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
