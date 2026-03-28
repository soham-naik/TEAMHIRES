<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login page</title>
</head>
<body>
    <form name="f1" method='post' action="">
        <table width="100%" border="2">
            <tr>
                <td colspan="2" style="background-color: rgb(200, 131, 131); color: white;">Login form</td>

            </tr>
            <tr>
                <td>Enter username</td>
                <td><input type="text" name="t1" size="40"></td>
            </tr>
            <tr>
                <td>Enter password</td>
                <td><input type="password" name="t2" size="40"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Login" name="b1"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <%
                    if(request.getParameter("b1")!=null)
                    {
                        String un=request.getParameter("t1");
                        String pw =request.getParameter("t2");
                            if(un.equals("soham") && pw.equals("soham2039"))
                            {%>
                                <jsp:forward page="home.jsp" />
                                <%} 

                    else
                    {
                       response.sendRedirect("error.jsp");
                    }
                }
                %>
                </td>

        </table>
    </form>
    
</body>
</html>