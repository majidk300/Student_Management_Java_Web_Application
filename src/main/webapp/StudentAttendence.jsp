<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.factoryProvider"%>
<%@page import="com.Dao.StudentSaveDao"%>
<%@page import="com.entities.studentEntitiesFirstYear"%>
<%@page import="com.entities.loginEntitty"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    loginEntitty userDash = (loginEntitty) session.getAttribute("user");

    if (userDash == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    String year = request.getParameter("value");

    session.setAttribute("year", year);

    StudentSaveDao StudentsFetchByYear = new StudentSaveDao(factoryProvider.getFactory());
    List<studentEntitiesFirstYear> stYear = null;

    if (year != null && year.equals("1st Year")) {
        stYear = StudentsFetchByYear.getAllStudentsByYear();
    } else if (year != null && year.equals("2nd Year")) {
        stYear = StudentsFetchByYear.getAllStudentsBySecondYear();
    } else if (year != null && year.equals("3rd Year")) {
        stYear = StudentsFetchByYear.getAllStudentsByThirdYear();
    } else if (year != null && year.equals("4th Year")) {
        stYear = StudentsFetchByYear.getAllStudentsByFourthYear();
    }


%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">


        <link rel="stylesheet" href="stylesheet/AddNewStudentStyle.css"/>

        <script src="https://cdn.tailwindcss.com"></script>

        <title>student-attendence</title>

        <%@include file="common/common-css-js.jsp" %>

    </head>
    <body>

        <!--NAVBAR-->
        <%@include file="common/navbarCommon.jsp" %>
        <!--NAVBAR END-->


        <!--Table--> 
        <div class="container" style="padding: 40px 0 40px 0; max-height: 200vh; overflow-y: scroll;">
            <h1 style="color: #1e1e1e; margin-bottom: 20px;">Attendence Table <strong> [ <%=year%> ]</strong></h1>

            <table class="rwd-table">
                <tbody>

                    <tr>
                        <th>S.no</th>
                        <th>Name</th>
                        <th>Roll number</th>
                        <th>Present</th>
                        <th>Absent</th>
                        <th>Action</th>

                    </tr>

                    <%                            int i = 1;
                        for (studentEntitiesFirstYear student : stYear) {

                    %>
                <form action="AttendenceServlet" method="post">
                    <div class="messages" style="float: left; color: green ">
                        <%@include file="errorMessages/IncorrectMessage.jsp" %>
                    </div>
                    
                        <!--Date-->
                        <% LocalDate myObj = LocalDate.now();%>
                        <input type="hidden" name="attendenceDate" value="<%=myObj%>"/>
                      
                   
                    <tr class="StudentDetails">
                        <td data-th="Supplier Code">
                            <%=i++%>

                        </td>
                       
                    <input type="hidden" name="StudentId"  value="<%=student.getStudentId()%>" />
                    <input type="hidden" name="StudentName"  value="<%=student.getName()%>"/>
                    <input type="hidden" name="StudentRollNumber"  value="<%=student.getRollNumber()%>"/>

                    <td data-th="Supplier Name">
                        <%=student.getName()%>
                    </td>
                    <td data-th="Invoice Number">
                        <%=student.getRollNumber()%>
                    </td>
                    <td data-th="Due Date">
                        <input type="radio" name="attendence" value="present" required/>
                    </td>
                    <td data-th="Net Amount">
                        <input type="radio" name="attendence" value="absent"  required/>
                    </td>
                    <td data-th="Net Amount">
                        <input type="submit" value="Submit" class="btnSubmit">
                    </td>
                    </tr>

                </form>
                <%
                    }
                %>


                </tbody>
            </table>


        </div>

        <style>

            .search_students{
                display: none!important;
            }

            * {
                font-family: 'Open Sans', sans-serif;
            }

            .rwd-table {
                margin: auto;
                min-width: 300px;
                max-width: 100%;
                border-collapse: collapse;
            }

            .rwd-table tr:first-child {
                border-top: none;
                background: #428bca;
                color: #fff;
            }

            .rwd-table tr {
                border-top: 1px solid #ddd;
                border-bottom: 1px solid #ddd;
                background-color: #f5f9fc;
            }

            .rwd-table tr:nth-child(odd):not(:first-child) {
                background-color: #ebf3f9;
            }

            .rwd-table th {
                display: none;
            }

            .rwd-table td {
                display: block;
            }

            .rwd-table td:first-child {
                margin-top: .5em;
            }

            .rwd-table td:last-child {
                margin-bottom: .5em;
            }

            .rwd-table td:before {
                content: attr(data-th) ": ";
                font-weight: bold;
                width: 120px;
                display: inline-block;
                color: #000;
            }

            .rwd-table th,
            .rwd-table td {
                text-align: left;
            }

            .rwd-table {
                color: #333;
                border-radius: .4em;
                overflow: hidden;
            }

            .rwd-table tr {
                border-color: #bfbfbf;
            }

            .rwd-table th,
            .rwd-table td {
                padding: .5em 1em;
            }
            @media screen and (max-width: 601px) {
                .rwd-table tr:nth-child(2) {
                    border-top: none;
                }
            }
            @media screen and (min-width: 600px) {
                .rwd-table tr:hover:not(:first-child) {
                    background-color: #d8e7f3;
                }
                .rwd-table td:before {
                    display: none;
                }
                .rwd-table th,
                .rwd-table td {
                    display: table-cell;
                    padding: .25em .5em;
                }
                .rwd-table th:first-child,
                .rwd-table td:first-child {
                    padding-left: 0;
                }
                .rwd-table th:last-child,
                .rwd-table td:last-child {
                    padding-right: 0;
                }
                .rwd-table th,
                .rwd-table td {
                    padding: 1em !important;
                }
            }


            /* THE END OF THE IMPORTANT STUFF */

            /* Basic Styling */
            body {
                background: #4B79A1;
                background: -webkit-linear-gradient(to left, #4B79A1 , #283E51);
                background: linear-gradient(to left, #4B79A1 , #283E51);
                
            }
            h1 {
                text-align: center;
                font-size: 2.4em;
                color: #f2f2f2;
            }
            .container {
                display: block;
                text-align: center;
            }

            .btnSubmit{
                background: #428bca;
                color: #ffffff;
                padding:5px 15px;
                transition: 0.1s ease-in-out;
                margin-top: 20px;
                border-radius: 5px;
            }


            .btnSubmit:hover{
                background: #006600;
            }


        </style>


    </body>
</html>
