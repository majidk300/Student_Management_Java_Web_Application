
<%@page import="com.entities.loginEntitty"%>

<%

    loginEntitty userInfo = (loginEntitty) session.getAttribute("user");

    if (userInfo == null) {
        response.sendRedirect("index.jsp");
        return;
    }

%>

<%@include file="common/common-css-js.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>


        <%@include file="dashboard/dashboard.jsp" %>


    </body>
</html>
