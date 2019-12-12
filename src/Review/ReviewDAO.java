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
    public int InsertReview(  String UserId, String ProductId,String ProductGrade, String Reviewtitle, String ReviewContent){
        String Sql = "INSERT INTO REVIEW(UserId, ProductGrade, ProductId, ReviewTitle, ReviewContent, createAt, updateAt) values (?,?,?,?,?,now(),now())";
        try{
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1,UserId);
            pstmt.setString(2,ProductGrade);
            pstmt.setString(3,ProductId);
            pstmt.setString(4,Reviewtitle);
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

    public ResultSet ViewReview(String ReviewId){
        String Sql = "SELECT * FROM REVIEW WHERE REVIEWid = ?";
        try{
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1,ReviewId);
            return pstmt.executeQuery();
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    public ResultSet ProductReview(String ProductId){
        String Sql = "Select R.*,U.UserName from Review AS R \n" +
                "\tinner join Users As U\n" +
                "\t\ton U.UserId = R.UserId \n" +
                "\t\t\twhere R.ProductId = ?";
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

    public int ReturnReviewNumber(){
        String Sql = "SELECT reviewId FROM REVIEW order by reviewId desc limit 1;";
        try{
            pstmt = conn.prepareStatement(Sql);
            rs = pstmt.executeQuery();
            return Integer.parseInt(rs.getString(1));
        }catch(Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    public void UpdateReviewCount(String ReviewId){
        String Sql = "update Review Set reviewCount = reviewCount+1 Where ReviewId = ?";
        try{
            pstmt =conn.prepareStatement(Sql);
            pstmt.setString(1,ReviewId);
            pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }

    }
    public ResultSet ReviewUserInfo(String ProductId){
        String Sql ="SELECT U.* FROM PRODUCT AS P\n" +
                "\tINNER JOIN REVIEW AS R\t\n" +
                "\t\tON P.PRODUCTID = R.PRODUCTID\n" +
                "\t\t\tINNER JOIN USERS AS U\n" +
                "\t\t\t\tON U.USERID = R.USERID " +
                "where P.ProductId = ?";
        try{
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1,ProductId);
            return pstmt.executeQuery();
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    public ResultSet GraphUserReview(String Day,String ProductId){
        String Sql= "SELECT if(count(*)=1,count(*)-1,count(*)) as Data ,D.id  DAY FROM PRODUCT AS P\n" +
                "\tINNER JOIN REVIEW AS R\t\n" +
                "\t\tON P.PRODUCTID = R.PRODUCTID\n" +
                "\t\t\tINNER JOIN USERS AS U\n" +
                "\t\t\t\tON U.USERID = R.USERID\n" +
                "\t\t\t\t\t\tRight join DateTimetable as D\n" +
                "\t\t\t\t\t\t\tON date_format(U.createAt,\"%m\") = D.id\n" +
                "\t\t\t\t\t\t\t\twhere date_format(U.createAt,\"%m\") is null OR date_format(U.createAt,\"%m\") = ? AND D.id <= LAST_DAY('2019-"+Day+"-01')\n AND P.ProductId = ?" +
                "\tGROUP BY D.id;\t";
        try{
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1,Day);
            pstmt.setString(2,ProductId);
            return pstmt.executeQuery();
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    public ResultSet SelectReview (String ReviewId){
        String Sql = "Select * from Review where ReviewId = ?";
        try{
            pstmt = conn.prepareStatement(Sql);
            pstmt.setString(1,ReviewId);
            return pstmt.executeQuery();
        }catch (Exception e){
            e.printStackTrace();
            return  null;
        }
    }
    public ResultSet ProductReviewList (String ProductId){
        String Sql = "SELECT * FROM REVIEW AS R\n" +
                "\tinner join USERS AS U\n" +
                "\t\ton R.REVIEWID = U.USERID\n" +
                "\t\t\twhere ProductId = ?";
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
