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

            socket.onopen = function () {
                sendCoordsRecursively(this);
            };
            socket.onmessage = function (event) {
                addCoordinate(JSON.parse(event.data));
            };
        }
        function sendCoordsRecursively(socket) {
            socket.send(JSON.stringify(
                {
                    x:Math.random(),
                    y:Math.random()
                }));
            setTimeout(function(){ return sendCoordsRecursively(socket); }, 2000);
        }
        function addCoordinate(coords) {
            var para = document.createElement("p");
            var node = document.createTextNode("X: " + coords.x + " Y: " + coords.y);
            para.appendChild(node);
            document.getElementById("generatedCoords").appendChild(para);
        }
    </script>
    <body onLoad="startSendingCoords()">
        <h1>Sending of coordinates is started...</h1>
        <div id="generatedCoords"></div>
    </body>
</html>
