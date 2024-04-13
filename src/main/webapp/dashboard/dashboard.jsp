<%@page import="com.entities.studentEntitiesFirstYear"%>
<%@page import="java.util.List"%>
<%@page import="com.Dao.userDao"%>
<%@page import="com.helper.factoryProvider"%>
<%@page import="com.Dao.StudentSaveDao"%>
<%@page import="com.entities.loginEntitty"%>

<%

    loginEntitty userDash = (loginEntitty) session.getAttribute("user");

    String userName = (String) session.getAttribute("userName");
    String userPassword = (String) session.getAttribute("userPassword");

    if (userDash == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    StudentSaveDao countAllStudents = new StudentSaveDao(factoryProvider.getFactory());
    Long countStudents = countAllStudents.countAllStudents();

    List<studentEntitiesFirstYear> limitStudent = countAllStudents.getAllStudentsByYearLimitedStudent();

    Long allStudent = countAllStudents.countAllStudents();

    userDao conn = new userDao(factoryProvider.getFactory());

    loginEntitty userFetch = conn.checkValidAdmin(userName, userPassword);


%>


<div class="side-menu" >
    <div class="brand-name">
        <img src="imageIcons/anslogo.png" class="anslogo">
    </div>
    <ul >

        <a href="studentManagementPanel.jsp"><li><img src="imageIcons/dashboard.png" alt="" height="35px">&nbsp; <span>Dashboard</span> </li></a>

        <ul>
            <li id="studentsToggle"><img src="imageIcons/student.png" alt="" height="35px">&nbsp;<span>Students</span></li>
            <div class="dropDown" style="display: none;">

                <a href="FetchStudentByYear?value=1st Year"><li style="font-size: 14px;"><img src="imageIcons/reading-book (1).png" alt="">&nbsp;<span>BCA 1st Year</span></li></a>
                <a href="FetchStudentByYear?value=2nd Year"><li style="font-size: 14px;"><img src="imageIcons/reading-book (1).png" alt="">&nbsp;<span>BCA 2nd Year</span></li></a>
                <a href="FetchStudentByYear?value=3rd Year"><li style="font-size: 14px;"><img src="imageIcons/reading-book (1).png" alt="">&nbsp;<span>BCA 3rd Year</span></li></a>
                <a href="FetchStudentByYear?value=4th Year"><li style="font-size: 14px;"><img src="imageIcons/reading-book (1).png" alt="">&nbsp;<span>BCA 4th Year</span></li></a>
            </div>
        </ul>

        <a href="Teacher.jsp"><li><img src="imageIcons/teacher.png" alt="" height="35px">&nbsp;<span>Teachers</span> </li></a>
        <a href="#"onclick="toggleYears()"><li><img src="imageIcons/immigration.png" alt="" height="35px">&nbsp;<span>Attendence</span> </li></a>

        <div id="yearContainer" style="display: none;">
            <a href="StudentAttendence.jsp?value=1st Year"><li style="font-size: 14px;"><img src="imageIcons/reading-book (1).png" alt="">&nbsp;<span>1st Year</span></li></a>
            <a href="StudentAttendence.jsp?value=2nd Year"><li style="font-size: 14px;"><img src="imageIcons/reading-book (1).png" alt="">&nbsp;<span>2nd Year</span></li></a>
            <a href="StudentAttendence.jsp?value=3rd Year"><li style="font-size: 14px;"><img src="imageIcons/reading-book (1).png" alt="">&nbsp;<span>3rd Year</span></li></a>
            <a href="StudentAttendence.jsp?value=4th Year"><li style="font-size: 14px;"><img src="imageIcons/reading-book (1).png" alt="">&nbsp;<span>4th Year</span></li></a>
        </div>
        <a href="AddNewAdmin.jsp"><li><img src="imageIcons/admin.png" alt="" height="35px">&nbsp;<span>New Admin</span> </li></a>
        <a href="Aboutme.jsp"><li><img src="imageIcons/subjects.png" alt="" height="35px">&nbsp; <span>About Me</span></li></a>
        <li><img src="imageIcons/cogwheel.png" alt="" height="35px">&nbsp;<span>Settings</span> </li>
    </ul>
</div>
<div class="container">
    <div class="header" style="z-index: 11111">
        <div class="nav">
            <div class="search">
                <input type="text" placeholder="Search..">
                <button type="submit"><img src="imageIcons/search.png" alt=""></button>
            </div>
            <div class="user">
                <a href="AddValCheckServlet" class="btn" value="val">Add New</a>
                <img src="imageIcons/notifications.png" alt="">
                <div class="img-case">

                    <%                        if (userName.equals("admin") && userPassword.equals("majidadmin")) {
                    %>
                    <img src="StudentImages/user.png" style="border-radius: 50%;">
                    <%
                    } else {

                    %>

                    <img src="StudentImages/<%=(userFetch.getAdminPhoto() != null) ? userFetch.getAdminPhoto() : "user.png"%>" style="border-radius: 50%;">
                    <%
                        }
                    %>

                    <!--DROPDOWN PROFILE START-->
                    <div class="userDropdown">

                        <a href="updateProfile.jsp" style="color: #333333"><li class="userprofile"><i class="fa-regular fa-user"></i> Profile</li></a>
                        <a href="AllAdmins.jsp" style="color: #333333"><li class="userprofile"><i class="fa-solid fa-user-tie "></i> Admins</li></a>
                        <a href="signoutServlet" style="color: #333333"><li class="userprofile"><i class="fa-solid fa-arrow-right-from-bracket"></i></i> Sign Out</li></a>

                    </div>
                    <!--DROPDOWN PROFILE END-->

                </div>
            </div>
        </div>
    </div>

    <!--DASHBOARD START-->

    <%        String val = (String) session.getAttribute("checkAddVal");
        if (val != null && val.equals("checkAddVal")) {

    %>

    <link rel="stylesheet" href="stylesheet/AddNewStudentStyle.css"/>

    <div class="content">

        <div class="bg_img"></div>
        <div class="form_wrapper" style="border-radius: 10px 10px 0 0;">

            <div class="form_container">
                <div class="title_container">
                    <h2>Add New Student</h2>
                </div>

                <!--MESSAGE FOR SAVE STUDENT-->
                <%                    String saveStudentMessage = (String) session.getAttribute("saveStudentMessage");

                    if (saveStudentMessage != null) {
                %>

                <p class="messages"><%=saveStudentMessage%></p>


                <style>

                    .messages{
                        position: relative;
                        height:10px;
                        color:green;
                        font-size:18px;
                        top: -8px;
                        font-weight: bold;
                    }

                </style>

                <%

                        session.removeAttribute("saveStudentMessage");
                    }
                %>
                <!--ADDING FORM START-->
                <form action="AddStudentServlet" method="post" enctype="multipart/form-data">
                    <div class="row clearfix">
                        <div class="col_half">
                            <label>Name</label>
                            <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user"></i></span>
                                <input type="text" name="name" placeholder="name" required />
                            </div>
                        </div>
                        <div class="col_half">
                            <label>Roll number</label>
                            <div class="input_field"> <span><i class="fa-solid fa-list-ol"></i></span>
                                <input type="text" name="roll" placeholder="12345" required/>
                            </div>
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="col_half">
                            <label>Email</label>
                            <div class="input_field"> <span><i aria-hidden="true" class="fa fa-envelope"></i></span>
                                <input type="email" name="email" placeholder="johndoe@gmail.com" required />
                            </div>
                        </div>
                        <div class="col_half">
                            <label>Phone</label>
                            <div class="input_field"> <span><i aria-hidden="true" class="fa fa-phone"></i></span>
                                <input type="text" name="phone" placeholder="123456789"  required/>
                            </div>
                        </div>
                    </div>

                    <div class="row clearfix">
                        <div class="col_half">
                            <label>Year</label>

                            <div class="input_fieldOption">

                                <select class="year" name="StudentCategoryOption" required>
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
                                <input type="text" name="studentSession" placeholder="2021-2024" required />
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


    <%        session.removeAttribute("checkAddVal");

    } else {

    %>

    <div class="content">

        <div class="cards">

            <div class="card">
                <div class="box">
                    <h1><%=countStudents%></h1>
                    <h3>Total Students</h3>
                </div>
                <div class="icon-case">
                    <img src="imageIcons/students.png" alt="">
                </div>
            </div>
            <div class="card">
                <div class="box">
                    <h1>20+</h1>
                    <h3>Teachers</h3>
                </div>
                <div class="icon-case">
                    <img src="imageIcons/teachers.png" alt="">
                </div>
            </div>
            <div class="card">
                <div class="box">
                    <h1>5</h1>
                    <h3>Subjects</h3>
                </div>
                <div class="icon-case">
                    <img src="imageIcons/schools.png" alt="">
                </div>
            </div>
            <div class="card">
                <div class="box">
                    <h1>&#8377 14000</h1>
                    <h3>Fees</h3>
                </div>
                <div class="icon-case">
                    <img src="imageIcons/income.png" alt="">
                </div>
            </div>
        </div>
        <div class="content-2">
            <div class="recent-payments">
                <div class="title">
                    <h2>NEW BCA ADMITS</h2>
                    <a href="FetchStudentByYear?value=1st Year" class="btn">View All</a>
                </div>
                <table>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Session</th>
                        <th>Option</th>
                    </tr>
                    <%for (studentEntitiesFirstYear limited : limitStudent) {
                    %>
                    <tr>
                        <td><%=limited.getName()%></td>
                        <td><%=limited.getEmaiId()%></td>
                        <td><%=limited.getStudentsession()%></td>
                        <td><a href="FetchStudentByYear?value=1st Year" class="btn">View</a></td>
                    </tr>
                    <%
                        }
                    %>


                </table>
            </div>
            <div class="new-students" style="margin:20px;">
                <div class="title">
                    <h2>New Students</h2>
                    <a href="FetchStudentByYear?value=1st Year" class="btn">View All</a>
                </div>
                <table>
                    <tr>
                        <th>Profile</th>
                        <th>Name</th>
                        <th>option</th>
                    </tr>
                    <%for (studentEntitiesFirstYear limited : limitStudent) {
                    %>
                    <tr>
                        <td><img src="StudentImages/<%=limited.getPhoto()%>" alt="" style="border-radius: 50%"></td>
                        <td><%=limited.getName()%></td>
                        <td><img src="imageIcons/info.png" alt=""></td>
                    </tr>
                    <%
                        }
                    %>

                </table>
            </div>
        </div>
    </div>


    <%            }


    %>

</div>




<script>

    //        STUDENT SESSION
    document.getElementById('studentsToggle').addEventListener('click', function () {
        var dropDown = document.querySelector('.dropDown');
        if (dropDown.style.display === 'none') {
            dropDown.style.display = 'block';
        } else {
            dropDown.style.display = 'none';
        }
    });
    //    USER DROPDOWN
    document.addEventListener("DOMContentLoaded", function () {
        var imgCase = document.querySelector(".img-case");
        var userDropdown = document.querySelector(".userDropdown");
        imgCase.addEventListener("click", function () {
            userDropdown.classList.toggle("active");
        });
        var dropdownItems = document.querySelectorAll(".userprofile");
        dropdownItems.forEach(function (item) {
            item.addEventListener("click", function () {
                userDropdown.classList.remove("active");
            });
        });
    });
//    DROP DOWN FOR ATTENDENCE 
    function toggleYears() {
        var yearContainer = document.getElementById('yearContainer');
        if (yearContainer.style.display === 'none') {
            yearContainer.style.display = 'block';
        } else {
            yearContainer.style.display = 'none';
        }
    }


</script>
