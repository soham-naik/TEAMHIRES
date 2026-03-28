<%@ page import="java.sql.*" %>
<%
String teamname = (String)session.getAttribute("teamname");

if(teamname == null){
    response.sendRedirect("teamlogin.html");
}

String leader="", members="", email="";

try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/resgister_db","root","");

    PreparedStatement ps = con.prepareStatement("SELECT * FROM teamdata WHERE teamname=?");
    ps.setString(1, teamname);

    ResultSet rs = ps.executeQuery();

    if(rs.next()){
        leader = rs.getString("teamleader");
        members = rs.getString("teammembers");
        email = rs.getString("email");
    }

}catch(Exception e){
    out.println(e);
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Team Dashboard</title>

    <style>
        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family: Arial, sans-serif;
        }

        body{
            background:#f4f6f9;
        }

        .container{
            display:flex;
        }


        .sidebar{
            width:230px;
            height:100vh;
            background:#1e3a5f;
            color:white;
            padding:20px;
        }

        .sidebar h2{
            margin-bottom:30px;
        }

        .sidebar a{
            display:block;
            color:white;
            text-decoration:none;
            margin:15px 0;
            padding:10px;
            border-radius:8px;
            transition:0.3s;
        }

        .sidebar a:hover{
            background:#3b82f6;
        }


        .main{
            flex:1;
            padding:20px;
        }

        .topbar{
            margin-bottom:20px;
        }

        .topbar h1{
            color:#333;
        }

  
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
            transition:0.3s;
        }

        .card:hover{
            transform:translateY(-5px);
        }

        .card h3{
            margin-bottom:10px;
            color:#1e3a5f;
        }

        .card p{
            color:#555;
        }

       
        @media(max-width:768px){
            .container{
                flex-direction:column;
            }

            .sidebar{
                width:100%;
                height:auto;
                display:flex;
                justify-content:space-around;
            }

            .sidebar a{
                margin:5px;
            }
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

        <div class="topbar">
            <h1>Welcome, <%= teamname %> </h1>
        </div>

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

    </div>

</div>

<a href="videocall.jsp?team=<%= teamName %>">
    <button style="padding:10px 20px; background:green; color:white; border:none;">
        Join Video Call
    </button>
</a>


</body>
</html>