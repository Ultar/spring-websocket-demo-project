<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <!--script src="http://cdn.sockjs.org/sockjs-0.3.min.js"></script-->
    <script type="text/javascript">
        function startSendingCoords() {
            //var socket = new SockJS("/test/myHandler");
            var socket = new WebSocket("ws://localhost:8080/test/myHandler");
            socket.send("HELLO WORLD");
            /*var stompClient = Stomp.over(socket);

            stompClient.connect({}, function(frame) {

            });*/
            //setTimeout(startSendingCoords, 2000);
        }
    </script>
    <body onLoad="startSendingCoords()">
        <h1>Sending of coordinates is started...</h1>
    </body>
</html>
