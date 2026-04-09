<%@ page import="java.sql.*" %>
<%
String selectteam = request.getParameter("selectteam");
try{
    Class.forName("com.mysql.cj.jdbc.Driver");
  <%@ include file="db.jsp" %>
    PreparedStatement ps = con.prepareStatement("select * from teamdata where teamname = ?");
    ps.setString(1, selectteam);
    ResultSet rs = ps.executeQuery();
    if(rs.next()){
        out.println("team selected: " + selectteam + "<br>");
        out.println("Team Name: " + rs.getString("teamname") + "<br>");
        out.println("Team Leader: " + rs.getString("teamleader") + "<br>");
        out.println("Team Members: " + rs.getString("teammembers"));
    }
    else{
        out.println("No team found with name: " + selectteam);
    }
}catch(Exception e){
    out.println(e);
}
%>
