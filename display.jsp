<%@ page import="java.sql.*" %>
<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");<%@ include file="db.jsp" %>

    ResultSet rs = con.createStatement().executeQuery("SELECT * FROM chat_messages ORDER BY id DESC");

    while(rs.next()){
        out.println("<b>" + rs.getString("sender") + "</b>: " + rs.getString("message") + "<br>");
    }

} catch(Exception e) {
    out.println(e);
}
%>
