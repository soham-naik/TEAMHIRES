<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Team Dashboard</title>

<style>

body{
    font-family: Arial, sans-serif;
    background: #f4f6f9;
    margin:0;
}

.header{
    background:#4CAF50;
    color:white;
    padding:20px;
    text-align:center;
}

.container{
    width:80%;
    margin:40px auto;
}

table{
    width:100%;
    border-collapse: collapse;
    background:white;
    box-shadow:0 5px 15px rgba(0,0,0,0.2);
}

th,td{
    padding:12px;
    text-align:center;
}

th{
    background:#4CAF50;
    color:white;
}

tr:nth-child(even){
    background:#f2f2f2;
}

tr:hover{
    background:#ddd;
}

</style>

</head>

<body>

<div class="header">
<h1>TEAMHIRES Dashboard</h1>
</div>

<div class="container">

<table border="1">

<tr>
<th>Team ID</th>
<th>Team Name</th>
<th>Leader</th>
<th>Members</th>
<th>Email</th>
</tr>

<%

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/resgister_db","root","");

Statement st = con.createStatement();

ResultSet rs = st.executeQuery("SELECT * FROM teamdata");

while(rs.next()){
%>

<tr>

<td><%= rs.getInt("teamid") %></td>
<td><%= rs.getString("teamname") %></td>
<td><%= rs.getString("leader") %></td>
<td><%= rs.getString("members") %></td>
<td><%= rs.getString("email") %></td>

</tr>

<%
}

con.close();

}catch(Exception e){
out.println(e);
}

%>

</table>

</div>

</body>
</html>