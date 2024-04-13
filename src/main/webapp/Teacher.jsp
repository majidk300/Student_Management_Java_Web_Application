<%@page import="com.entities.loginEntitty"%>

<% loginEntitty userDash = (loginEntitty) session.getAttribute("user");

    if (userDash == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script src="https://cdn.tailwindcss.com"></script>
        <%@include file="common/common-css-js.jsp" %>

        <title>teacher-profile</title>

    </head>
    <body>

        <!--NAVBAR-->
        <%@include file="common/navbarCommon.jsp" %>
        <!--NAVBAR END-->

        <div class="teacher-head" style="text-align: center; padding: 20px;">

            <h1 >Teachers</h1>
            
            <span style="color: #FFFFFF; background: #0033ff; padding: 30px; border-radius:20px;; position: relative; top: 50px;">20+</span>
            

        </div>

        <style>

            .search_students{
                display: none!important;
            }

        </style>

    </body>
</html>
