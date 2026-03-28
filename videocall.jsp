<%@ page import="java.sql.*" %>
<%
    String room = request.getParameter("room");

    // fallback (optional)
    if(room == null){
        String teamname = (String) session.getAttribute("teamname");
        if(teamname != null){
            room = teamname + "_meeting";
        } else {
            room = "TeamHiresDefaultRoom";
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Video Call</title>

    <style>
        body {
            margin: 0;
            font-family: Arial;
            background: #0f2027;
            color: white;
            text-align: center;
        }

        h2 {
            padding: 10px;
            background: #203a43;
            margin: 0;
        }

        iframe {
            width: 100%;
            height: 92vh;
            border: none;
        }
    </style>
</head>
<body>

<h2>TeamHires Meeting Room: <%= room %></h2>

<iframe 
    src="https://meet.jit.si/<%= room %>" 
    allow="camera; microphone; fullscreen">
</iframe>

</body>
</html>