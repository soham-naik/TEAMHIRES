  <%@ page import="java.sql.*" %>

<%
String name = request.getParameter("name");
String phoneno = request.getParameter("phoneno");
String password = request.getParameter("password");

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/resgister_db","root","");

PreparedStatement ps = con.prepareStatement(
"insert into data(name, phoneno, password) values(?,?,?)");

ps.setString(1,name);
ps.setString(2,phoneno);
ps.setString(3,password);

ps.executeUpdate();

out.println("<h2>Data inserted successfully</h2>");

Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from users");

while(rs.next()){

out.println("Name: "+rs.getString("name")+"<br>");
out.println("Phone No: "+rs.getString("phoneno")+"<br>");
out.println("Password: "+rs.getString("password")+"<br><br>");

}

con.close();

}catch(Exception e){
out.println(e);
}
%>