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

    public int InsertPurchaseData(String [] ProductId,String UserId,String []PurchaseProductCount,String []PurchaseProductPrice,String PurchaseZipCode,String PurchaseAddress,String PurchaseFullAddress,String PurchaseRecipient,String PurchasePhone,String PurchaseMemo){
        int i = 0;
        String Sql = "insert into Purchase (ProductId,UserId,PurchaseProductCount,PurchaseProductPrice,PurchaseZipCode,PurchaseAddress,PurchaseFullAddress,PurchaseRecipient,PurchasePhone,PurchaseMemo,createAt,updateAt) values\n" +
                "(?,?,?,?,?,?,?,?,?,?,now(),now())";
        for( i = 1; i<ProductId.length; i++) {
            Sql +=",(?,?,?,?,?,?,?,?,?,?,now(),now())";
        }
        System.out.println(Sql);
            try {
                pstmt = conn.prepareStatement(Sql);
                for( i = 0; i<ProductId.length; i++) {
                    pstmt.setString(1+i*10, ProductId[i]);
                    pstmt.setString(2+i*10, UserId);
                    pstmt.setString(3+i*10, PurchaseProductCount[i]);
                    pstmt.setString(4+i*10, PurchaseProductPrice[i]);
                    pstmt.setString(5+i*10, PurchaseZipCode);
                    pstmt.setString(6+i*10, PurchaseAddress);
                    pstmt.setString(7+i*10, PurchaseFullAddress);
                    pstmt.setString(8+i*10, PurchaseRecipient);
                    pstmt.setString(9+i*10, PurchasePhone);
                    pstmt.setString(10+i*10, PurchaseMemo);
                }
                int Result = pstmt.executeUpdate();
                System.out.println(Result);
                return Result;
            } catch (Exception e) {
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
    //가장 잘 팔린 상품
    public ResultSet ThisMonthBestSeller(String Day){
        String Sql = "SELECT SUM(P.PurchaseProductCount) as COUNT,PR.productNAME FROM Purchase AS P\n" +
                "\tinner join PRODUCT AS PR \n" +
                "\t\ton PR.PRODUCTID = P.ProductId\n" +
                "\t\t\twhere date_format(P.createAt,\"%m\") = ?\n" +
                "\t\t\tgroup by P.ProductId\n" +
                "\t\t\t\torder by COUNT desc;";
        try{
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1,Day);
            return pstmt.executeQuery();
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
    //매출
    public ResultSet ThisMonthSalesGraph(String Day){
        String Sql = "\tSELECT Sum(if(P.UserId is not null,P.purchaseProductPrice,0)) as Price,D.id FROM Purchase\tAS P\n" +
                "\t\tright join dateTimetable as D\n" +
                "\t\t\ton D.id = date_format(P.createAt,\"%d\")\n" +
                "\t\t\t\twhere UserId is null or date_format(P.createAt,\"%m\") = ?\n" +
                "\t\t\t\t\tgroup by D.id \n" +
                "\t\t\t\t\t\torder by D.id asc;";
        try{
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1,Day);
            return pstmt.executeQuery();
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    //사용자 구매 리스트
    public ResultSet SelectUserPurrchaseGraph(String UserId){
        String Sql = "SELECT PR.ProductID, PR.ProductName, P.PurchaseProductPrice,P.PurchaseProductCount,PR.createAt FROM PURCHASE AS P\n" +
                "\tINNER JOIN PRODUCT AS PR\n" +
                "\t\tON p.ProductId = Pr.ProductId\n" +
                "\t\t\tWHERE USERID = ? ";
        try{
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1,UserId);
            return pstmt.executeQuery();
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
    // 사용자 12월 구매 수치
    public ResultSet NowUserPurchaseGraph(String UserId){
        String Sql = "SELECT D.id,sum(if(P.PurchaseProductCount is null,0,P.PurchaseProductCount)) as count FROM Purchase AS P\n" +
                "\tright join datetimetable as D\n" +
                "\t\tON Day(P.createAt) = D.Id\n" +
                "\t\t\twhere P.PurchaseId is null or Month(P.createAt) = 12 AND P.UserId = ?\n" +
                "\t\t\t\tgroup by D.id\n" +
                "\t\t\t\t\torder by D.id asc";
        try{
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1,UserId);
            return pstmt.executeQuery();
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
    public ResultSet ProductPurchaseList(String ProductId){
        String Sql = "SELECT * FROM PURCHASE AS P \n" +
                "\tinner join USERS AS U\n" +
                "\t\ton P.USERID = U.USERID\t\n" +
                "\t\t\twhere ProductId =?";
        try{
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1,ProductId);
            return pstmt.executeQuery();
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
