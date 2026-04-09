<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Apply Project</title>

<style>

body{
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg,#667eea,#764ba2);
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
}

.container{
    background:white;
    padding:40px;
    border-radius:10px;
    text-align:center;
    width:400px;
    box-shadow:0 10px 25px rgba(0,0,0,0.2);
}

.success{
    color:green;
    font-size:22px;
}

.error{
    color:red;
    font-size:22px;
}

p{
    font-size:16px;
}

button{
    margin-top:20px;
    padding:10px 20px;
    border:none;
    background:#667eea;
    color:white;
    border-radius:5px;
    cursor:pointer;
}

button:hover{
    background:#4b5bdc;
}

</style>

</head>

<body>

<div class="container">

<%
String teamname = request.getParameter("teamname");
String projectname = request.getParameter("projectname");
String status = request.getParameter("status");

try{

Class.forName("com.mysql.cj.jdbc.Driver");
<%@ include file="db.jsp" %>

PreparedStatement ps = con.prepareStatement(
"INSERT INTO project_apply (teamname,projectname,status) VALUES (?,?,?)");

ps.setString(1, teamname);
ps.setString(2, projectname);
ps.setString(3, status);

int i = ps.executeUpdate();

if(i>0){
%>

<h2 class="success">Project Taken Successfully</h2>
<p>Wish you good luck!</p>

<%
}else{
%>

<h2 class="error">Project Not Found</h2>

<%
}

con.close();

}catch(Exception e){
%>

<h2 class="error"><%= e %></h2>

<%
}
%>

<button onclick="window.location.href='dashboard.jsp'>Back to Dashboard</button>

</div>

</body>
</html>
