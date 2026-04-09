<%@ page import="java.sql.*" %>
<%
String clientPhone = request.getParameter("clientPhone");
String room = request.getParameter("room");
String teamname = (String)session.getAttribute("teamname");

try{
    Class.forName("com.mysql.cj.jdbc.Driver"  
<%@ include file="db.jsp" %>

  
    PreparedStatement ps = con.prepareStatement(
        "INSERT INTO meetings(teamname, clientPhone, room) VALUES(?,?,?)"
    );

    ps.setString(1, teamname);
    ps.setString(2, clientPhone);
    ps.setString(3, room);

    ps.executeUpdate();

    con.close();

}catch(Exception e){
    out.println("Error: " + e);
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Invite Client</title>
</head>

<body>

<h2>Client Meeting Link</h2>

<p>Send this link to client:</p>

<a href="videocall.jsp?room=<%= room %>">
http://localhost:8080/myjsp/videocall.jsp?room=<%= room %>
</a>

<br><br>

<a href="teamdashboard.jsp"> Back</a>

</body>
</html>
