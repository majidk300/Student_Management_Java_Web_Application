<%@page import="com.Dao.userDao"%>
<%@page import="com.Dao.AttendenceDao"%>
<%@page import="com.Dao.StudentSaveDao"%>
<%@page import="com.helper.factoryProvider"%>
<%@page import="com.entities.studentEntitiesFirstYear"%>
<%@page import="java.util.List"%>
<%@page import="com.entities.loginEntitty"%>
<%
    loginEntitty userDash = (loginEntitty) session.getAttribute("user");

    if (userDash == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    userDao uDao = new userDao(factoryProvider.getFactory());
    List<loginEntitty> users = uDao.getAllUsers();

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>all-admins</title>

        <link rel="stylesheet" href="stylesheet/StudentAllYearTableStyle.css"/>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <%@include file="common/common-css-js.jsp" %>

    </head>
    <body>

        <!--NAVBAR-->
        <%@include file="common/navbarCommon.jsp" %>
        <!--NAVBAR END-->

        <section class="antialiased bg-gray-100 text-gray-600 h-screen px-2 py-2">
            <div class="flex flex-col p-0 h-full">
                <!-- Table -->
                <div class="w-full max-w-4xl mx-auto bg-white shadow-lg rounded-sm border border-gray-200">
                    <header class="px-3 py-2 border-b border-gray-100">
                        <h2 class="font-semibold text-gray-800">ADMINS</h2>
                    </header>
                    <!--MESSAGE FOR DELETE START-->
                    <div class="messages">
                        <%@include file="errorMessages/IncorrectMessage.jsp" %>
                    </div>
                    <!--MESSAGE FOR DELETE END-->
                    <div class="p-2 text-center">
                        <div class="overflow-x-auto">
                            <table class="table-auto w-full" id="customerTable">
                                <thead class="text-xs font-semibold uppercase text-gray-400 bg-gray-50">
                                    <tr>
                                        <th class="p-1 whitespace-nowrap">
                                            <div class="font-semibold text-left">Name</div>
                                        </th>
                                        <th class="p-1 whitespace-nowrap">
                                            <div class="font-semibold text-left">Password</div>
                                        </th>
                                        <th class="p-1 whitespace-nowrap">
                                            <div class="font-semibold text-left">Action</div>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody class="text-sm divide-y divide-gray-100">
                                    <!--PRINTING STUDENT DATA-->
                                    <% for (loginEntitty adminUsers : users) {%>
                                    <tr>
                                        <td class="p-1 whitespace-nowrap">
                                            <div class="flex items-center">
                                                <div class="w-8 h-8 flex-shrink-0 mr-1 sm:mr-2"><img class="rounded-full" src="StudentImages/<%=adminUsers.getAdminPhoto()%>" width="32" height="32" alt="Alex Shatov"></div>
                                                <div class="font-medium text-gray-800" style="font-weight: bold;"><%=adminUsers.getName()%></div>
                                            </div>
                                        </td>
                                        <td class="p-1 whitespace-nowrap">
                                            <div class="text-left"><%=adminUsers.getPassword()%></div>
                                        </td>
                                        <td class="p-1 whitespace-nowrap">
                                            <div class="text-left actionIcons">
                                                <div class="text-left">
                                                    <a href="DeleteAdminServlet?adminId=<%=adminUsers.getId()%>"><i class="fa-solid fa-delete-left"></i></a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <% }%>
                                    <!-- Add other table rows here -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <!--TAILWIND--> 
        <script src="https://cdn.tailwindcss.com"></script>


        <style>

            .search_students{
                display: none!important;
            }

        </style>


    </body>
</html>
