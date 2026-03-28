<%@ page import="java.sql.*" %>
<%
String teamname = (String)session.getAttribute("teamname");

if(teamname == null){
    response.sendRedirect("teamlogin.html");
}
%>

<!DOCTYPE html>
<html>
<head>
    <title> My Projects</title>

    <style>
        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family: Arial;
        }

        body{
            background:#f4f6f9;
        }

        .container{
            padding:30px;
        }

        h1{
            margin-bottom:25px;
            color:#1e3a5f;
        }

        .project-box{
            background:white;
            padding:20px;
            margin-bottom:20px;
            border-radius:12px;
            box-shadow:0 4px 10px rgba(0,0,0,0.1);
            transition:0.3s;
        }

        .project-box:hover{
            transform:translateY(-5px);
        }

        .title{
            font-size:22px;
            font-weight:bold;
            color:#333;
        }

        .desc{
            margin:10px 0;
            color:#555;
        }

        .info{
            font-size:14px;
            color:#777;
        }

        .status{
            margin-top:10px;
            font-weight:bold;
            color:green;
        }

        .empty{
            background:white;
            padding:20px;
            border-radius:10px;
            text-align:center;
            color:#777;
        }
    </style>

</head>

<body>

<div class="container">

<h1>My Projects</h1>

<%
try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/resgister_db","root",""
    );

    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM project_apply WHERE teamname=?");

    ps.setString(1, teamname);

    ResultSet rs = ps.executeQuery();

    boolean hasData = false;

    while(rs.next()){
        hasData = true;
%>

    <div class="project-box">
        <div class="title">
            <%= rs.getString("projectname") %>
        </div>



        <div class="status">
          Assigned to your team
        </div>
    </div>

<%
    }

    if(!hasData){
%>
        <div class="empty">
            No projects assigned yet
        </div>
<%
    }

}catch(Exception e){
    out.println(e);
}
%>

</div>

</body>
</html>