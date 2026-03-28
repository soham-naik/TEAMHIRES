<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rate Team</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #4facfe, #00f2fe);
            margin: 0;
            padding: 0;
        }

        .container {
            width: 400px;
            margin: 100px auto;
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0px 10px 25px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        table {
            width: 100%;
        }

        td {
            padding: 10px;
            font-size: 14px;
            color: #444;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 8px;
            border-radius: 6px;
            border: 1px solid #ccc;
            outline: none;
            transition: 0.3s;
        }

        input[type="text"]:focus,
        input[type="number"]:focus {
            border-color: #4facfe;
            box-shadow: 0 0 5px rgba(79,172,254,0.5);
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 8px;
            background: #4facfe;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
        }

        input[type="submit"]:hover {
            background: #007bff;
        }
    </style>
</head>

<body>

    <div class="container">
        <h2>Rate a Team</h2>

        <form action="rating.jsp" method="get">
            <table>
                <tr>
                    <td>Team Name:</td>
                    <td><input type="text" name="teamname" required></td>
                </tr>
                <tr>
                    <td>Rating (1-5):</td>
                    <td><input type="number" name="rate" min="1" max="5" required></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Submit Rating">
                    </td>
                </tr>
            </table>
        </form>
    </div>

<div id="viewpage">
    <jsp:include page="viewteams.jsp"/>
</div>

</body>
</html>