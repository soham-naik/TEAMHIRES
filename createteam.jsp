<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Team Created</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #43cea2, #185a9d);
            margin: 0;
            padding: 0;
        }

        .container {
            width: 500px;
            margin: 80px auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0,0,0,0.2);
            text-align: center;
        }

        h2 {
            color: green;
        }

        .team-box {
            margin-top: 20px;
            padding: 15px;
            background: #f5f5f5;
            border-left: 5px solid #43cea2;
            border-radius: 5px;
            text-align: left;
        }

        p {
            margin: 8px 0;
            font-size: 15px;
        }

        .error {
            color: red;
            font-weight: bold;
        }

        .btn {
            margin-top: 20px;
            padding: 10px 15px;
            background: #185a9d;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
        }

        .btn:hover {
            background: #0f3c6e;
        }
    </style>

</head>

<body>

<div class="container">

<%
String teamname = request.getParameter("teamname");
String teamleader = request.getParameter("teamleader");
String teammembers = request.getParameter("teammembers");
String teampassword = request.getParameter("teampassword");
String EMAIL = request.getParameter("EMAIL");

Connection con = null;
PreparedStatement ps = null;
PreparedStatement ps2 = null;
ResultSet rs = null;

try{
    Class.forName("com.mysql.cj.jdbc.Driver");
<%@ include file="db.jsp" %>

    ps = con.prepareStatement(
        "INSERT INTO teamdata(teamname, teamleader, teammembers, teampassword, EMAIL) VALUES(?,?,?,?,?)"
    );

    ps.setString(1, teamname);
    ps.setString(2, teamleader);
    ps.setString(3, teammembers);
    ps.setString(4, teampassword);
    ps.setString(5, EMAIL);

    ps.executeUpdate();

    out.println("<h2>Team Created Successfully</h2>");

    // FETCH DATA
    ps2 = con.prepareStatement(
        "SELECT * FROM teamdata WHERE teamname = ?"
    );

    ps2.setString(1, teamname);
    rs = ps2.executeQuery();

    if(rs.next()){
%>

        <div class="team-box">
            <p><strong>Team Name:</strong> <%= rs.getString("teamname") %></p>
            <p><strong>Team Leader:</strong> <%= rs.getString("teamleader") %></p>
            <p><strong>Team Members:</strong> <%= rs.getString("teammembers") %></p>
            <p><strong>Email:</strong> <%= rs.getString("EMAIL") %></p>
        </div>

<%
    }

}catch(Exception e){
%>
    <p class="error"> Error: <%= e.getMessage() %></p>
<%
} finally {
    try { if(rs != null) rs.close(); } catch(Exception e){}
    try { if(ps != null) ps.close(); } catch(Exception e){}
    try { if(ps2 != null) ps2.close(); } catch(Exception e){}
    try { if(con != null) con.close(); } catch(Exception e){}
}
%>

    <a href="frontpage.jsp" class="btn"> Back to Home</a>

</div>

</body>
</html>
