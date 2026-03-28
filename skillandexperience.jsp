<%@ page import="java.sql.*" %>

<%
String teamname = request.getParameter("teamname");
String teamskills = request.getParameter("teamskills");
String experience = request.getParameter("experience");

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/resgister_db","root","");

PreparedStatement ps = con.prepareStatement(
"UPDATE teamdata SET teamskills=?, experience=? WHERE teamname=?");

ps.setString(1, teamskills);
ps.setString(2, experience);
ps.setString(3, teamname);

int i = ps.executeUpdate();

if(i>0)
{
out.println("Skills Added Successfully");
}
else
{
out.println("Team Not Found");
}

}
catch(Exception e)
{
out.println(e);
}
%>