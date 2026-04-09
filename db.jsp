<%@ page import="java.sql.*" %>
<%
Connection con = DriverManager.getConnection(
"jdbc:mysql://gateway01.ap-southeast-1.prod.aws.tidbcloud.com:4000/resgister_db?useSSL=true&requireSSL=true&verifyServerCertificate=false",
"9TdfWo2rauHotdR.root",
"gt8U1IUyLKA3X8JT"
);
%>
