<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form name="f1" method="get" action="">
        <table width="100%" border="2">
            <tr>
                <td colspan="2" style="background-color: rgb(200, 131, 131); color: white;">Auto post back</td>
                <td>program adding two numbers</td>
            </tr>
            <tr>
                <td>Enter first number</td>
                <td><input type="text" name="t1" size="40"></td>
            </tr>
            <tr>
                <td>Enter second number</td>
                <td><input type="text" name="t2" size="40"></td>
            </tr>
            <tr>
                <td></td>
                <td colspan="2"><input type="submit" value="Add" name="b1"></td>
            </tr>
            <tr>
                <td>
                    <%
                    int a,b,c;
                    if(request.getParameter("b1")!=null)
                    {
                        a=Integer.parseInt(request.getParameter("t1"));
                        b=Integer.parseInt(request.getParameter("t2"));
                        c=a+b;
                        out.println("Sum is "+c);
                    }
                    %>
                </td>
            </tr>
        </table>

    </form>
</body>
</html>