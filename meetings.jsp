<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Meeting History</title>
</head>

<body>

<h2>Meeting History</h2>

<table border="1" cellpadding="10">
<tr>
<th>Team</th>
<th>Client Phone</th>
<th>Room</th>
<th>Time</th>
</tr>

<%
try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/resgister_db","root",""
    );

    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM meetings");

    while(rs.next()){
%>

<tr>
<td><%= rs.getString("teamname") %></td>
<td><%= rs.getString("clientPhone") %></td>
<td><%= rs.getString("room") %></td>
<td><%= rs.getString("meeting_time") %></td>
</tr>

<%
    }

    con.close();

}catch(Exception e){
    out.println(e);
}
%>

</table>

</body>
</html>