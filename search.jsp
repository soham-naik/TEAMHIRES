<%@ page import="java.sql.*" %>

<%
String teamname = request.getParameter("teamname");

boolean found = false;
String leader="",members="",skills="",experience="",rating="";

if(teamname != null && !teamname.trim().isEmpty()) {

    try{

        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/resgister_db","root","");

        PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM teamdata WHERE teamname=?");

        ps.setString(1, teamname);

        ResultSet rs = ps.executeQuery();

        if(rs.next()){
            found = true;

            leader = rs.getString("teamleader");
            members = rs.getString("teammembers");
            skills = rs.getString("teamskills");
            experience = rs.getString("experience");
            rating = rs.getString("rating");
        }

        rs.close();
        ps.close();
        con.close();

    }catch(Exception e){
        out.println(e);
    }

}
%>

<!DOCTYPE html>
<html>
<head>
<title>Team Search Result</title>

<style>

body{
margin:0;
height:100vh;
display:flex;
justify-content:center;
align-items:center;
font-family:Arial;
background: linear-gradient(135deg,#4facfe,#00f2fe);
}

.card{
background:white;
padding:35px;
border-radius:12px;
box-shadow:0 10px 25px rgba(0,0,0,0.3);
width:420px;
text-align:left;
}

h2{
text-align:center;
color:#333;
margin-bottom:20px;
}

.info{
margin-bottom:10px;
font-size:16px;
color:#555;
}

label{
font-weight:bold;
color:#333;
}

.btn{
display:block;
text-align:center;
margin-top:20px;
padding:12px;
background:#4facfe;
color:white;
text-decoration:none;
border-radius:6px;
font-weight:bold;
transition:0.3s;
}

.btn:hover{
background:#2c7be5;
}

.error{
text-align:center;
color:red;
font-weight:bold;
}

</style>

</head>

<body>

<div class="card">

<%
if(teamname == null || teamname.trim().isEmpty()){
%>

<p class="error">Please enter a team name.</p>

<%
}else if(found){
%>

<h2>Team Found ✅</h2>

<div class="info"><label>Team Name:</label> <%=teamname%></div>
<div class="info"><label>Team Leader:</label> <%=leader%></div>
<div class="info"><label>Team Members:</label> <%=members%></div>
<div class="info"><label>Team Skills:</label> <%=skills%></div>
<div class="info"><label>Experience:</label> <%=experience%></div>
<div class="info"><label>Rating:</label> <%=rating%></div>

<%
}else{
%>

<p class="error">No team found with name: <%=teamname%></p>

<%
}
%>

<a href="search.html" class="btn">Search Another Team</a>

</div>

</body>
</html>