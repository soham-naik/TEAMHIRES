<%@ page import="java.sql.*" %>
<%
String teamname = (String)session.getAttribute("teamname");

if(teamname == null){
    response.sendRedirect("teamlogin.html");
    return;
}

String leader="", members="", email="";


String meetingRoom = teamname + "_meeting";

try{
    Class.forName("com.mysql.cj.jdbc.Driver"); 
<%@ include file="db.jsp" %>

    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM teamdata WHERE teamname=?"
    );
    ps.setString(1, teamname);

    ResultSet rs = ps.executeQuery();

    if(rs.next()){
        leader = rs.getString("teamleader");
        members = rs.getString("teammembers");
        email = rs.getString("email");
    }

    con.close();

}catch(Exception e){
    out.println("Error: " + e);
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Team Dashboard</title>

<style>
*{margin:0;padding:0;box-sizing:border-box;font-family:Arial;}
body{background:#f4f6f9;}
.container{display:flex;}

.sidebar{
    width:230px;
    height:100vh;
    background:#1e3a5f;
    color:white;
    padding:20px;
}

.sidebar h2{margin-bottom:30px;}

.sidebar a{
    display:block;
    color:white;
    text-decoration:none;
    margin:15px 0;
    padding:10px;
    border-radius:8px;
}

.sidebar a:hover{background:#3b82f6;}

.main{flex:1;padding:20px;}

.cards{
    display:flex;
    gap:20px;
    flex-wrap:wrap;
}

.card{
    background:white;
    padding:20px;
    flex:1;
    min-width:250px;
    border-radius:12px;
    box-shadow:0 4px 10px rgba(0,0,0,0.1);
}

.videobtn{margin-top:25px;}

.videobtn button{
    padding:12px 25px;
    background:#28a745;
    color:white;
    border:none;
    border-radius:8px;
    font-size:16px;
    cursor:pointer;
}

.invite{
    margin-top:25px;
}

.invite input{
    padding:8px;
    margin:5px 0;
    width:250px;
}

.invite button{
    padding:10px 20px;
    background:#007bff;
    color:white;
    border:none;
    border-radius:6px;
    cursor:pointer;
}
</style>
</head>

<body>

<div class="container">


<div class="sidebar">
    <h2>TEAMHIRES</h2>
    <a href="#">Dashboard</a>
    <a href="project.jsp">Projects</a>
    <a href="chat.jsp">Chat</a>
    <a href="log.jsp">Logout</a>
</div>


<div class="main">

<h1>Welcome, <%= teamname %></h1>

<div class="cards">
    <div class="card">
        <h3>Team Leader</h3>
        <p><%= leader %></p>
    </div>

    <div class="card">
        <h3>Team Members</h3>
        <p><%= members %></p>
    </div>

    <div class="card">
        <h3>Email</h3>
        <p><%= email %></p>
    </div>
</div>


<div class="videobtn">
    <a href="videocall.jsp?room=<%= meetingRoom %>">
        <button> Start Team / Client Meeting</button>
    </a>
</div>


<div class="invite">
    <h3>Invite Client</h3>

    <form action="invite.jsp" method="post">
        <input type="text" name="clientPhone" placeholder="Enter client phone" required><br>

        <input type="hidden" name="room" value="<%= meetingRoom %>">

        <button type="submit">Send Invite</button>
    </form>
</div>
<a href="meetings.jsp">Meetings</a>
</div>
</div>

</body>
</html>
