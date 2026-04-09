<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Available Teams</title>

<style>
body{
    font-family: Arial;
    background: #f5f5f5;
}

#teams{
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px;
    margin-top: 50px;
}

.team-card{
    width: 280px;
    background: white;
    padding: 15px;
    border-radius: 10px;
    box-shadow: 0px 3px 10px rgba(0,0,0,0.1);
    text-align: center;
}

.team-card:hover{
    box-shadow: 10px 10px 10px rgba(0, 0, 0, 0.242);
    transition: 0.2s;
}

button{
    padding: 8px 15px;
    background-color: #007bff;
    color: rgb(255, 255, 255);
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin:5px;
}


.chat-btn{
    background: #007bff;
}

.chat-btn:hover{
    background: #0056b3;
}

.call-btn{
    background: #28a745;
}

.call-btn:hover{
    background: #218838;
}
</style>
</head>

<body>

<h2 align="center" style="background-color: rgb(143, 163, 216);">Available Teams</h2>

<div id="teams">

<%
try{
    Class.forName("com.mysql.cj.jdbc.Driver");
<%@ include file="db.jsp" %>

    Statement st = con.createStatement();

    ResultSet rs = st.executeQuery("SELECT * FROM teamdata");

    while(rs.next()){

        String teamname = rs.getString("teamname");

        
        String meetingRoom = teamname + "_meeting";
%>

<div class="team-card">

    <h3><%= teamname %></h3>

    <p><b>Leader:</b> <%= rs.getString("teamleader") %></p>

    <p><b>Members:</b><br>
    <%= rs.getString("teammembers") %></p>

 
    <a href="chat.jsp?receiver=<%= teamname %>">
        <button class="chat-btn">Chat</button>
    </a>

   
    <a href="videocall.jsp?room=<%= meetingRoom %>">
        <button class="call-btn">Video Call</button>
    </a>

</div>

<%
    }

    con.close();

}catch(Exception e){
    out.println("Error: " + e);
}
%>

</div>

</body>
</html>
