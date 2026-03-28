<%@ page import="java.sql.*" %>
<%
String sender = request.getParameter("sender");
String receiver = request.getParameter("receiver");
String message = request.getParameter("message");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/resgister_db","root","");

    PreparedStatement ps = con.prepareStatement("INSERT INTO chat_messages(sender, receiver, message) VALUES (?,?,?)");
    ps.setString(1, sender);
    ps.setString(2, receiver);
    ps.setString(3, message);
    ps.executeUpdate();

    response.sendRedirect("chat.jsp");

} catch(Exception e) {
    out.println(e);
}
%>