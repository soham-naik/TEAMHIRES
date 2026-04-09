<%@ page import="java.sql.*" %>

<%
String name = (String) session.getAttribute("name");

if(name == null){
    response.sendRedirect("log.html");
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Dashboard</title>

<style>
body{
font-family:Arial;
background:#f4f6f9;
margin:0;
}

.nav{
background:#2c3e50;
color:white;
padding:15px;
display:flex;
justify-content:space-between;
}

.container{
padding:20px;
}

.card{
background:white;
padding:20px;
margin-bottom:20px;
border-radius:10px;
}

button{
padding:8px 15px;
background:#27ae60;
color:white;
border:none;
}
</style>

</head>

<body>

<div class="nav">
<h2>Welcome <%=name%></h2>
<a href="log.html" style="color:white;">Logout</a>
</div>

<div class="container">

<div class="card">
<h3>Post New Project</h3>

<form action="postproject.jsp" method="post">
<jsp:include page="postproject.html" />
</form>
</div>

<div class="card">
<h3>Your Projects</h3>

<table border="1" width="100%">
<tr>
<th>Project</th>
<th>REQUIREMENTS</th>
</tr>

<%
try{<%@ include file="db.jsp" %>

PreparedStatement ps = con.prepareStatement(
"select * from projectdata where clientname=?");

ps.setString(1,name);
ResultSet rs = ps.executeQuery();

while(rs.next()){
%>

<tr>
<td><%=rs.getString("projectname")%></td>
<td><%=rs.getString("REQUIREMENTS")%></td>
</tr>

<%
}
}catch(Exception e){
out.println(e);
}
%>

</table>

</div>

</div>

</body>
</html>
