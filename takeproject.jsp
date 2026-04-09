<%@ page import="java.sql.*" %>
<html>
<head>
<title>Apply Project</title>
</head>

<body>

<h2>Apply for Project</h2>

<form method="post">

<table border="1">

<tr>
<td>Team Name</td>
<td><input type="text" name="teamname" required></td>
</tr>

<tr>
<td>Project Name</td>
<td><input type="text" name="projectname" required></td>
</tr>

<tr>
<td></td>
<td><input type="submit" value="Apply"></td>
</tr>

</table>

</form>

<%
String teamname = request.getParameter("teamname");
String projectname = request.getParameter("projectname");

if(teamname != null && projectname != null)
{
    try{

        Class.forName("com.mysql.cj.jdbc.Driver");  <%@ include file="db.jsp" %>

        PreparedStatement ps = con.prepareStatement(
        "insert into project_apply(teamname,projectname,status) values(?,?,?)");

        ps.setString(1, teamname);
        ps.setString(2, projectname);
        ps.setString(3, "Pending");

        int i = ps.executeUpdate();

        if(i>0)
        {
            out.println("<h3 style='color:green'>Project Applied Successfully</h3>");
        }
        else
        {
            out.println("<h3 style='color:red'>Error applying project</h3>");
        }

    }
    catch(Exception e)
    {
        out.println(e);
    }
}
%>

</body>
</html>
