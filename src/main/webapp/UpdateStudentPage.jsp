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

    int StudentID = Integer.parseInt(request.getParameter("StudentID"));

    StudentSaveDao studentUpdate = new StudentSaveDao(factoryProvider.getFactory());

    studentEntitiesFirstYear student = (studentEntitiesFirstYear) studentUpdate.getStudentById(StudentID);

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">


        <link rel="stylesheet" href="stylesheet/AddNewStudentStyle.css"/>

        <title>update-student</title>

        <%@include file="common/common-css-js.jsp" %>

    </head>
    <body>

        <!--NAVBAR-->
        <%@include file="common/navbarCommon.jsp" %>
        <!--NAVBAR END-->



        <div class="content">

            <div class="bg_img"></div>
            <div class="form_wrapper" style="border-radius: 10px 10px 0 0; background: #ffffff;">

                <div class="form_container">
                    <div class="title_container">
                        <h2>Update student</h2>
                    </div>

                    <!--ADDING FORM START-->
                    <form action="UpdateStudentServlet" method="post" enctype="multipart/form-data">
                        <div class="row clearfix">
                            <div class="col_half">
                                <label>Name</label>

                                <input type="hidden" name="studentID" value="<%=student.getStudentId()%>"/>

                                <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user"></i></span>
                                    <input type="text" name="name" value="<%=student.getName()%>" required />
                                </div>
                            </div>
                            <div class="col_half">
                                <label>Roll number</label>
                                <div class="input_field"> <span><i class="fa-solid fa-list-ol"></i></span>
                                    <input type="text" name="roll" value="<%=student.getRollNumber()%>" required/>
                                </div>
                            </div>
                        </div>
                        <div class="row clearfix">
                            <div class="col_half">
                                <label>Email</label>
                                <div class="input_field"> <span><i aria-hidden="true" class="fa fa-envelope"></i></span>
                                    <input type="email" name="email" value="<%=student.getEmaiId()%>" required />
                                </div>
                            </div>
                            <div class="col_half">
                                <label>Phone</label>
                                <div class="input_field"> <span><i aria-hidden="true" class="fa fa-phone"></i></span>
                                    <input type="text" name="phone" value="<%=student.getPhoneNumber()%>"  required/>
                                </div>
                            </div>
                        </div>

                        <div class="row clearfix">
                            <div class="col_half">
                                <label>Year</label>

                                <div class="input_fieldOption">

                                    <select class="year" name="StudentCategoryOption" value="<%=student.getStudentYear()%>" required>
                                        <option value="">Select Year</option>
                                        <option value="1st Year">1st Year</option>
                                        <option value="2nd Year">2nd Year</option>
                                        <option value="3rd Year">3rd Year</option>
                                        <option value="4th Year">4th Year</option>
                                    </select>

                                </div>
                            </div>
                            <div class="col_half">
                                <label>Session</label>
                                <div class="input_field"> <span><i class="fa-regular fa-calendar-days"></i></span>
                                    <input type="text" name="studentSession" value="<%=student.getStudentsession()%>" required />
                                </div>
                            </div>
                        </div>

                        <div class="row clearfix">
                            <div class="col_half">
                                <label>Gender</label>
                                <div class="input_field">
                                    <input type="radio" id="gender" name="gender" value="male"  style="position: relative; top: 2px;" required>
                                    Male

                                    <input type="radio" id="gender" name="gender" value="female" style="position: relative; top: 2px; margin-left:5px;" required>
                                    Female

                                </div>
                            </div>
                            <div class="col_half">
                                <label>Photo</label>
                                <div class="input_field" style="width: 100%; overflow: hidden;">

                                    <div class="input_field" style="width: 100%;">
                                        <input type="file" id="myfile" name="picture__input" required/>
                                    </div>


                                </div>
                            </div>
                        </div>


                        <input class="button" type="submit" value="Sumbit" />
                    </form>
                </div>
            </div>

        </div>


        <!--ADDING NEW STUDENTS END-->

        
        
        
        <style>
            
            .search_students{
                  display: none!important;
            }
            
        </style>


    </body>
</html>
