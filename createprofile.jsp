<%@ page import="java.sql.*" %>
<%

String Teamname = request.getParameter("Teamname");
String Teamleader = request.getParameter("Teamleader");
String members = request.getParameter("members");
String noofmembers = request.getParameter("noofmembers");

String email = request.getParameter("email");
String phone = request.getParameter("phone");
String roles = request.getParameter("roles");
String teampassword = request.getParameter("teampassword");

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/resgister_db","root","");

PreparedStatement ps = con.prepareStatement(
"insert into profile(Teamname,Teamleader,members,noofmembers,email,phone,roles,teampassword) values(?,?,?,?,?,?,?,?)"
);

ps.setString(1, Teamname);
ps.setString(2, Teamleader);
ps.setString(3, members);
ps.setString(4, noofmembers);
ps.setString(5, email);
ps.setString(6, phone);
ps.setString(7, roles);
ps.setString(8, teampassword);

int i = ps.executeUpdate();

if(i>0){
out.println("Team created successfully");
}
else{
out.println("Error creating team");
}

}catch(Exception e){
out.println(e);
}

%>