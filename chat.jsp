<!DOCTYPE html>
<html>
<head>
    <title>TeamHires Chat</title>
    <style>
        body { font-family: Arial; }
        #chatbox {
            width: 400px;
            height: 400px;
            border: 1px solid #ccc;
            overflow-y: scroll;
            padding: 10px;
        }
        input { margin: 5px; }
    </style>
</head>
<body>

<h2>Chat System</h2>

<div id="chatbox">
    <iframe src="display.jsp" width="100%" height="100%" frameborder="0"></iframe>
</div>

<form action="send.jsp" method="post">
    Your Name: <input type="text" name="sender" required><br>
    Send To: <input type="text" name="receiver" required><br>
    Message: <input type="text" name="message" required>
    <input type="submit" value="Send">
</form>

<script>
    setInterval(function(){
        document.querySelector("iframe").src = "display.jsp";
    }, 2000);
</script>

</body>
</html>
