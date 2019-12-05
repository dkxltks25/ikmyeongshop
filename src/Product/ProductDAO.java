package Product;
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
    //상품 옵션 쿼리

    //상품 리스트
    public ResultSet list(String ProductClass,String ProductOption)  throws SQLException {
        String Sql = "";
        if(ProductOption.equals("1")) {
            Sql = "SELECT * FROM PRODUCT WHERE PRODUCTCLASS = ?";
            try {
                pstmt = conn.prepareStatement(Sql);
                pstmt.setString(1,ProductClass);
                rs = pstmt.executeQuery();
                return rs;
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }
        //상품 인기순
        if(ProductOption.equals("2")) {
             Sql = "SELECT p.PRODUCTID,P.PRODUCTNAME,p.PRODUCTPRICE,p.PRODUCTCLASS,P.PRODUCTDISCOUNT,avg(r.productgrade) as GRADE FROM PRODUCT AS p \n" +
                    "\tleft join REVIEW AS r\n" +
                    "\t\ton p.productId = r.PRODUCTID\n" +
                    "         where PRODUCTCLASS = ?\n" +
                    "         group by p.PRODUCTID\n" +
                    "\t\t\torder by GRADE desc;";
            try {
                pstmt = conn.prepareStatement(Sql);
                pstmt.setString(1,ProductClass);
                rs = pstmt.executeQuery();
                return rs;
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }
        //상품 낮은 가격순
        if(ProductOption.equals("3")) {
            Sql = "SELECT * FROM PRODUCT where PRODUCTCLASS = ? order by ProductPrice asc;";
            try {
                pstmt = conn.prepareStatement(Sql);
                pstmt.setString(1,ProductClass);

                rs = pstmt.executeQuery();
                return rs;
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }
        if(ProductOption.equals("4")) {
            Sql = "SELECT * FROM PRODUCT where PRODUCTCLASS = ? order by ProductPrice desc";
            try {
                pstmt = conn.prepareStatement(Sql);
                pstmt.setString(1,ProductClass);

                rs = pstmt.executeQuery();
                return rs;
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }
        if(ProductOption.equals("5")) {
            Sql ="SELECT p.PRODUCTID,P.PRODUCTNAME,p.PRODUCTPRICE,p.PRODUCTCLASS,P.PRODUCTDISCOUNT,avg(r.productgrade) as GRADE FROM PRODUCT AS p \n" +
                    "\tleft join REVIEW AS r\n" +
                    "\t\ton p.productId = r.PRODUCTID\n" +
                    "         where PRODUCTCLASS = ?\n" +
                    "         group by p.PRODUCTID\n" +
                    "\t\t\torder by GRADE desc;\n";
            try {
                pstmt = conn.prepareStatement(Sql);
                pstmt.setString(1,ProductClass);
                rs = pstmt.executeQuery();
                return rs;
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }
        if(ProductOption.equals("6")) {
            Sql = "SELECT * FROM PRODUCT where PRODUCTCLASS = ? order by createAt ASC;";
            try {
                pstmt = conn.prepareStatement(Sql);
                pstmt.setString(1,ProductClass);
                rs = pstmt.executeQuery();
                return rs;
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }else{
            return null;
        }
    }
    //상품 선택
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



        public int InsertProduct(String ProductName, String ProductClass , String ProductCount, String ProductDiscount ,String ProductPrice){
            String Sql ="Insert into Product(ProductName,ProductClass,ProductCount,ProductDiscount,ProductPrice,createAt,updateAt) value(?,?,?,?,?,now(),now())";
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
        //관리자 전체 상품 조회
        public ResultSet AdminList(){
            String Sql = "SELECT * FROM PRODUCT";
            try{
                pstmt = conn.prepareStatement(Sql);
                return pstmt.executeQuery();
            }catch(Exception e){
                e.printStackTrace();
                return null;
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
        //상품 파일 이름 설정
        public int ReturnProductName(){
                    String Sql ="SELECT ProductId from Product order by ProductId desc limit 1";
                    try{
                        pstmt = conn.prepareStatement(Sql);
                        rs = pstmt.executeQuery();
                        if(rs.next()){
                            return Integer.parseInt(rs.getString(1));
                        }else{
                            return 0;
                        }
                    }catch(Exception e){
                        e.printStackTrace();
                        return -1;
            }
        }

        public void ProductViewCount (String ProductId){
            String Sql = "update PRODUCT set ProductViewCount = ProductViewCount + 1 where ProductId = ?";
            try{
                pstmt = conn.prepareStatement(Sql);
                pstmt.setString(1,ProductId);
                pstmt.executeUpdate();
            }catch(Exception e){
                e.printStackTrace();
            }
        }



        //관리자
        public ResultSet BestShoppingBag(String Day){

        }

}
