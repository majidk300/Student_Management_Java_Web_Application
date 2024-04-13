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

    String year = (String) session.getAttribute("year");

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

    AttendenceDao attendence = new AttendenceDao(factoryProvider.getFactory());

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>first-year-student</title>

        <link rel="stylesheet" href="stylesheet/StudentAllYearTableStyle.css"/>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <%@include file="common/common-css-js.jsp" %>

    </head>
    <body>

        <!--NAVBAR-->
        <%@include file="common/navbarCommon.jsp" %>
        <!--NAVBAR END-->

        <section class="antialiased bg-gray-100 text-gray-600 h-screen px-4 p-5">
            <div class="flex flex-col p-0 h-full">
                <!-- Table -->
                <div class="w-full max-w-6xl mx-auto bg-white shadow-lg rounded-sm border border-gray-200">
                    <header class="px-5 py-4 border-b border-gray-100">
                        <h2 class="font-semibold text-gray-800"><%=year%></h2>
                    </header>
                    <!--MESSAGE FOR DELETE START-->
                    <div class="messages">
                        <%@include file="errorMessages/IncorrectMessage.jsp" %>
                    </div>
                    <!--MESSAGE FOR DELETE END-->
                    <div class="p-3">
                        <div class="overflow-x-auto">
                            <table class="table-auto w-full" id="customerTable">
                                <thead class="text-xs font-semibold uppercase text-gray-400 bg-gray-50">
                                    <tr>
                                        <th class="p-2 whitespace-nowrap">
                                            <div class="font-semibold text-left">Name</div>
                                        </th>
                                        <th class="p-2 whitespace-nowrap">
                                            <div class="font-semibold text-left">Roll no.</div>
                                        </th>
                                        <th class="p-2 whitespace-nowrap">
                                            <div class="font-semibold text-left">Email</div>
                                        </th>
                                        <th class="p-2 whitespace-nowrap">
                                            <div class="font-semibold text-left">Phone no.</div>
                                        </th>
                                        <th class="p-2 whitespace-nowrap">
                                            <div class="font-semibold text-left">Year</div>
                                        </th>
                                        <th class="p-2 whitespace-nowrap">
                                            <div class="font-semibold text-center">Session</div>
                                        </th>
                                        <th class="p-2 whitespace-nowrap">
                                            <div class="font-semibold text-left">Gender</div>
                                        </th>
                                        <th class="p-2 whitespace-nowrap">
                                            <div class="font-semibold text-left">Attendence</div>
                                        </th>
                                        <th class="p-2 whitespace-nowrap">
                                            <div class="font-semibold text-left">Action</div>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody class="text-sm divide-y divide-gray-100">

                                    <!--PRINTING STUDENT DATA-->
                                    <%                for (studentEntitiesFirstYear studentsData : stYear) {

                                    %>

                                    <tr>
                                        <td class="p-2 whitespace-nowrap">
                                            <div class="flex items-center">
                                                <div class="w-10 h-10 flex-shrink-0 mr-2 sm:mr-3"><img class="rounded-full" src="StudentImages/<%=studentsData.getPhoto()%>" width="40" height="40" alt="Alex Shatov"></div>
                                                <div class="font-medium text-gray-800" style="font-weight: bold;"><%=studentsData.getName()%></div>
                                            </div>
                                        </td>
                                        <td class="p-2 whitespace-nowrap">
                                            <div class="text-left"><%=studentsData.getRollNumber()%></div>
                                        </td>
                                        <td class="p-2 whitespace-nowrap">
                                            <div class="text-left"><%=studentsData.getEmaiId()%></div>
                                        </td>
                                        <td class="p-2 whitespace-nowrap">
                                            <div class="text-left"><%=studentsData.getPhoneNumber()%></div>
                                        </td>
                                        <td class="p-2 whitespace-nowrap">
                                            <div class="text-left"><%=studentsData.getStudentYear()%></div>
                                        </td>
                                        <td class="p-2 whitespace-nowrap">
                                            <div class="text-left font-medium text-green-500"><%=studentsData.getStudentsession()%></div>
                                        </td>
                                        <td class="p-2 whitespace-nowrap">
                                            <div class="text-left"><%=studentsData.getGender()%></div>
                                        </td>
                                        <td class="p-2 whitespace-nowrap">

                                            <!--GETTING NUMBER OF PERSENTAGE-->
                                            <%
                                                int StId = studentsData.getStudentId();
                                                Long TotalDays = attendence.countAttendenceSingleStudent(StId);
                                                Long countPresent = attendence.countAttendenceSingleStudenPresentt(StId, "present");

                                                if (TotalDays != null && TotalDays != 0) {
                                                    Long persentage = (countPresent * 100) / TotalDays;
                                            %>
                                            <div class="text-left"><%= persentage%>%</div>
                                            <%
                                            } else {
                                            %>
                                            <div class="text-left">no</div>
                                            <%
                                                }
                                            %>

                                        </td>
                                        <td class="p-2 whitespace-nowrap">
                                            <div class="text-left actionIcons"><div class="text-left">
                                                    <a href="UpdateStudentPage.jsp?StudentID=<%=studentsData.getStudentId()%>"><i class="fa-regular fa-pen-to-square"></i></a>
                                                    <a href="DeleteStudentServlet?StudentID=<%=studentsData.getStudentId()%>"><i class="fa-solid fa-delete-left"></i></a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>


                                    <%

                                        }
                                    %>
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


        <!--FILTER-->
        <script>
            // Filter Search Functionality
            const searchInput = document.getElementById('searchInput');
            const table = document.getElementById('customerTable');
            const rows = table.getElementsByTagName('tr');

            searchInput.addEventListener('keyup', function () {
                const searchTerm = searchInput.value.toLowerCase();
                for (let i = 1; i < rows.length; i++) {
                    const name = rows[i].getElementsByTagName('td')[0].textContent.toLowerCase();
                    const email = rows[i].getElementsByTagName('td')[1].textContent.toLowerCase();
                    const spent = rows[i].getElementsByTagName('td')[2].textContent.toLowerCase();
                    const country = rows[i].getElementsByTagName('td')[3].textContent.toLowerCase();
                    if (name.includes(searchTerm) || email.includes(searchTerm) || spent.includes(searchTerm) || country.includes(searchTerm)) {
                        rows[i].style.display = '';
                    } else {
                        rows[i].style.display = 'none';
                    }
                }
            });
        </script>


    </body>
</html>
