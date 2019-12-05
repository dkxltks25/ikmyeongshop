package Purchase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PurchaseDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    public PurchaseDAO(){
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

    public int InsertPurchaseData(String ProductId,String UserId,String PurchaseProductCount,String PurchaseProductPrice,String PurchaseZipCode,String PurchaseAddress,String PurchaseFullAddress,String PurchaseRecipient,String PurchasePhone,String PurchaseMemo){
        String Sql = "insert into Purchase (ProductId,UserId,PurchaseProductCount,PurchaseProductPrice,PurchaseZipCode,PurchaseAddress,PurchaseFullAddress,PurchaseRecipient,PurchasePhone,PurchaseMemo,createAt,updateAt) values\n" +
                "(?,?,?,?,?,?,?,?,?,?,now(),now())";
        try{
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1,ProductId);
            pstmt.setString(2,UserId);
            pstmt.setString(3,PurchaseProductCount);
            pstmt.setString(4,PurchaseProductPrice);
            pstmt.setString(5,PurchaseZipCode);
            pstmt.setString(6,PurchaseAddress);
            pstmt.setString(7,PurchaseFullAddress);
            pstmt.setString(8,PurchaseRecipient);
            pstmt.setString(9,PurchasePhone);
            pstmt.setString(10,PurchaseMemo);
            return pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
            return -1;
        }
    }

    public ResultSet LastPurchaseInfo(String UserId){
        String Sql = "SELECT * FROM Purchase where UserId = ? order by createAt DESC limit 1";
        try{
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1,UserId);
            return pstmt.executeQuery();
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
