<!DOCTYPE html>
<html lang="en">
<head>
    <title>Document</title>
</head>
<body>
    <%
    int a,b,c;
    a =Integer.parseInt(request.getParameter("t1"));
    b =Integer.parseInt(request.getParameter("t2"));
    c=a+b;
    out.println("Addition is "+c);
    %>
</body>
</html>