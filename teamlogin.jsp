<<%@ page import="java.sql.*" %>

<%
String teamname = request.getParameter("teamname");
String password = request.getParameter("password");

if(teamname != null && password != null){

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/resgister_db","root","");

        PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM teamdata WHERE teamname=? AND teampassword=?");

        ps.setString(1, teamname);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();

        if(rs.next()){
            session.setAttribute("teamname", teamname);
            response.sendRedirect("teamdashboard.jsp");
        }else{
            out.println("<h3 style='color:red;text-align:center;'>Invalid Team Name or Password</h3>");
        }

    }catch(Exception e){
        out.println(e);
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Team Login</title>
<style>
body{
    font-family: Arial;
    background-color: whitesmoke;
}

form{
    width: 300px;
    margin: 150px auto;
    padding: 20px;
    background-color: white;
    border-radius: 10px;
    text-align: center;
}

input{
    width: 90%;
    padding: 10px;
    margin: 10px;
}

button{
    padding: 10px 20px;
    background-color: rgb(22,76,134);
    color: white;
    border: none;
}
</style>
</head>

<body>

<form method="post">
    <h2>Team Login</h2>

    <input type="text" name="teamname" placeholder="Enter Team Name" required>
    <input type="password" name="password" placeholder="Enter Password" required>

    <button type="submit">Login</button>
</form>

</body>
</html>