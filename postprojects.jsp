<%@ page import="java.sql.*" %>
<%
String clientname = request.getParameter("clientname");
String projectname = request.getParameter("projectname");
String REQUIREMENTS = request.getParameter("REQUIREMENTS");
String phoneno = request.getParameter("phoneno");
String instagramID = request.getParameter("instagramID");

try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/resgister_db","root","");

PreparedStatement ps = con.prepareStatement(
"insert into projectdata(clientname,projectname, REQUIREMENTS,Phoneno,instagramID) values(?,?,?,?,?)");

ps.setString(1,clientname);
ps.setString(2, projectname);
ps.setString(3, REQUIREMENTS);
ps.setString(4, phoneno);
ps.setString(5, instagramID);

ps.executeUpdate();
%>

<!DOCTYPE html>
<html>
<head>
<title>Project Posted</title>

<style>

body{
font-family: Arial, Helvetica, sans-serif;
background: linear-gradient(135deg,#4facfe,#00f2fe);
height:100vh;
display:flex;
justify-content:center;
align-items:center;
margin:0;
}

.card{
background:white;
padding:40px;
border-radius:12px;
box-shadow:0 10px 25px rgba(0,0,0,0.2);
text-align:center;
width:400px;
}

h2{
color:#2ecc71;
margin-bottom:20px;
}

p{
color:#555;
}

.btn{
display:inline-block;
margin-top:20px;
padding:12px 25px;
background:#4facfe;
color:white;
text-decoration:none;
border-radius:8px;
font-weight:bold;
transition:0.3s;
}

.btn:hover{
background:#2c7be5;
}

</style>

</head>

<body>

<div class="card">

<h2> Project Posted Successfully</h2>

<p>Your project <b><%=projectname%></b> has been added.</p>

<a href="search.html" class="btn">Search for Teams</a>

</div>

</body>
</html>

<%
}
catch(Exception e){
out.println(e);
}
%>