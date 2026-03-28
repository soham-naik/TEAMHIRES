<%@ page import="java.sql.*" %>

<%
String name = request.getParameter("name");
String password = request.getParameter("password");

try{
Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/resgister_db","root","");

PreparedStatement ps = con.prepareStatement(
"select * from data where name=? and password=?");

ps.setString(1,name);
ps.setString(2,password);

ResultSet rs = ps.executeQuery();

if(rs.next()){
    session.setAttribute("name", name);
    response.sendRedirect("clientdashboard.jsp");
}else{
    out.println("<h2 style='color:red;text-align:center;'>Invalid Login</h2>");
}
}catch(Exception e){
out.println(e);
}
%>