<%@page import="com.helper.factoryProvider"%>
<head>
    <meta charset="UTF-8">
    <title>Log In</title>

    <link rel="stylesheet" href="stylesheet/admin.css" />

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>

<body>

    <nav><a href="#" class="focus">Log In</a></nav>

    <form action="adminServlet" method="post">

        <h2>Admin Login</h2>

        <input type="text" name="username" class="text-field" placeholder="Username"  required/>
        <input type="password" name="password" class="text-field" placeholder="Password"  required=""/>

        <div class="messages">
            <%@include file="errorMessages/IncorrectMessage.jsp" %>
        </div>


        <a href=""><input type="submit"  class="button" value="Log In" /></a>

    </form>

</body>

</html>
