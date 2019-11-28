package Product;

import USER.User;

import java.sql.*;

public class ProductDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    private Connection conn1;
    private PreparedStatement pstmt1;
    private ResultSet rs1;

    public ProductDAO(){
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
    public ResultSet list()  throws SQLException {
        String SQL = "SELECT * FROM PRODUCT";
        try {
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            return rs;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    public ResultSet SelectProduct(String id){
        String Sql = "SELECT * FROM PRODUCT WHERE PRODUCTID=?";
        try{
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1,id);
            rs = pstmt.executeQuery();
            return rs;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
    // 먼저 유저아이디와 제품명을 이용해서 장바구니 테이블에서 장바구니 아이디를 조회한다.
    // 해당 제품의 찜목록이 있을경우 아이디를 받아 오며 그렇지 않은 경우에는 새로운 제품을 등록한다.

    public int InsertShoppingBag(String UserId , String ProductId, String ItemCount)  {
        String Sql = "SELECT * FROM ShoppingBag WHERE UserId = ? AND ProductId = ?";
        String ShoppingBagId = "";
        int check = 0;
        try{
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1,UserId);
            pstmt.setString(2,ProductId);
            rs = pstmt.executeQuery();
            if(rs.next()){
                check = 1;
                ShoppingBagId = rs.getString("ShoppingBagId");
            }else{
                check = 0;
            }
        }
        catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
            String Sql1;
            if(check == 1 ){
                Sql1 = "update ShoppingBag set ShoppingBagCount = ShoppingBagCount+? where UserId = ? AND ProductId = ? AND ShoppingBagId= ?";
                try{
                    pstmt1 = conn1.prepareStatement(Sql1);
                    pstmt1.setString(1,ItemCount);
                    pstmt1.setString(2,UserId);
                    pstmt1.setString(3,ProductId);
                    pstmt1.setString(4,ShoppingBagId);
                    pstmt1.executeUpdate();
                    return 1;
                }catch(Exception e){
                    e.printStackTrace();
                    return -5;
                }
            }
            else{
                Sql1 = "Insert into ShoppingBag(ShoppingBagCount, UserId, ProductId, createAt, updateAt) values (?,?,?,now(),now())";
                try{
                    pstmt1 = conn1.prepareStatement(Sql1);
                    pstmt1.setString(1,ItemCount);
                    pstmt1.setString(2,UserId);
                    pstmt1.setString(3,ProductId);
                    return pstmt1.executeUpdate();

                }catch(Exception e){
                    e.printStackTrace();
                    return -4;
                }
            }
        }

        public ResultSet Shopinglist(String UserId){
            String Sql = "" +
                    "SELECT S.ShoppingBagId,S.ShoppingBagCount,P.ProductName, p.productPrice FROM ShoppingBag AS S " +
                    "   inner join Users AS U" +
                    "    on S.UserId = U.UserId" +
                    "     inner join Product AS P" +
                    "       on p.productId = S.ProductId" +
                    "         WHERE U.UserId = ?";
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

        //admin 영역
        public int InsertProduct(String ProductName, String ProductClass , String ProductCount, String ProductDiscount ,String ProductPrice){
            String Sql ="Insert into Produt(ProductName,ProductClass,ProductCount,ProductDiscount,ProductPrice,createAt,updateAt) value(?,?,?,?,?,now(),now())";
            try{
                pstmt = conn.prepareStatement(Sql);
                pstmt.setString(1,ProductName);
                pstmt.setString(2,ProductClass);
                pstmt.setString(3,ProductCount);
                pstmt.setString(4,ProductDiscount);
                pstmt.setString(5,ProductPrice);
                pstmt.executeUpdate();
                return 1;
            }catch(Exception e){
                e.printStackTrace();
                return -1;
            }
        }

        //할인율 업데이트
        public int UpdateDiscountProduct(String ProductNumber,String ProductDisCount){
            String Sql = "update Product set ProductDiscount=? where ProductID = ?";
            try{
                pstmt = conn.prepareStatement(Sql);
                pstmt.setString(1,ProductDisCount);
                pstmt.setString(2,ProductNumber);
                return pstmt.executeUpdate();
            }catch(Exception e){
                e.printStackTrace();
                return -1;
            }
        }

        // 상품 업데이트
        public int UpdateProduct(String ProdutId, String ProductName, String ProductClass, String ProductCount, String ProductDisCount, String ProductPrice){
            String Sql = "update Product set  ProductName=?, ProductClass=?, ProductCount=?, ProductDisCount=?, ProductPrice =?, updateAt = now() where ProductID = ?";
            try{
                pstmt = conn.prepareStatement(Sql);
                pstmt.setString(1,ProductName);
                pstmt.setString(2,ProductClass);
                pstmt.setString(3,ProductCount);
                pstmt.setString(4,ProductDisCount);
                pstmt.setString(5,ProductPrice);
                pstmt.setString(6,ProdutId);
                return pstmt.executeUpdate();
            }catch(Exception e){
                e.printStackTrace();
                return -1;
            }
        }


}
