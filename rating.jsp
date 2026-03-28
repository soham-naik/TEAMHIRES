<%@ page import="java.sql.*" %>
<%
String teamname = request.getParameter("teamname");
String rate = request.getParameter("rate");
try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/resgister_db","root","");
    PreparedStatement ps = con.prepareStatement("UPDATE teamdata SET rating=? WHERE teamname=?");
    ps.setInt(1,Integer.parseInt(rate));
    ps.setString(2,teamname);
    ps.executeUpdate();
    out.println("<h2>Rating submitted successfully</h2>");
    con.close();
}catch(Exception e){
    out.println(e);
}
%>