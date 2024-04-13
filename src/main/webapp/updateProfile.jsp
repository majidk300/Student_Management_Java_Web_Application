<%@page import="com.Dao.userDao"%>
<%@page import="com.entities.loginEntitty"%>
<%@page import="com.helper.factoryProvider"%>

<%
    
     loginEntitty userDash = (loginEntitty) session.getAttribute("user");

      
    String userName = (String) session.getAttribute("userName");
    String userPassword = (String) session.getAttribute("userPassword");
    

    loginEntitty userInfo = (loginEntitty) session.getAttribute("user");

    if (userInfo == null) {
        response.sendRedirect("index.jsp");
        return;
    }
  
    userDao conn = new userDao(factoryProvider.getFactory());

   loginEntitty userFetch = conn.checkValidAdmin(userName, userPassword);


%>

<head>
    <meta charset="UTF-8">
    <title>update profile</title>

    <link rel="stylesheet" href="stylesheet/admin.css" />

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Font Awesome -->
    <link
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
        rel="stylesheet"
        />

</head>

<body>
    
    <a href="studentManagementPanel.jsp"><i class="fa-solid fa-arrow-left" style="font-size: 50px; color: blue;padding: 15px;"></i></a>

    <form action="UpdateProfileServlet" method="post" enctype="multipart/form-data" style="margin-top:30px;">

        <h2>Update Profile</h2>


        <div class="messages" style="position: relative; left: -10px;">
            <%@include file="errorMessages/IncorrectMessage.jsp" %>
        </div>

            <input type="hidden" name="userId" class="text-field"  value="<%=userFetch.getId()%>" required/>

        <input type="text" name="username" class="text-field"  value="<%=userFetch.getName()%>" required/>
        <input type="password" name="password" class="text-field" value="<%=userFetch.getPassword()%>" required=""/>

        <div class="col-md-2 col-sm-offset-5 ">
            <div class="picture-container">
                <div class="picture">
                    <img src="assets/img/Images.png" class="picture-src" id="wizardPicturePreview" title=""/>
                    <input type="file" name="adminPhoto" id="wizard-picture"  required/>
                </div>
                <h6>Choose Picture</h6>
            </div>
        </div>


        <a href=""><input type="submit"  class="button" value="Submit" /></a>

    </form>


    <style>
        .picture-container {
            position: relative;
            cursor: pointer;
            text-align: center;
        }
        .picture {
            width: 106px;
            height: 106px;
            background-color: #999999;
            border: 4px solid #CCCCCC;
            color: #FFFFFF;
            border-radius: 50% ;
            margin: 5px auto;
            overflow: hidden;
            transition: all 0.2s;
            -webkit-transition: all 0.2s;
        }
        .picture-src {
            width: 100% ;
            height: 100% ;
        }

        .picture:hover {
            border-color: #4caf50;
        }

        .picture input[type="file"] {
            cursor: pointer;
            display: block;
            height: 100% ;
            left: 0;
            opacity: 0 !important;
            position: absolute;
            top: 0;
            width: 100% ;
        }




        .choice {
            text-align: center;
            cursor: pointer;
        }

        .choice input[type="radio"], .choice input[type="checkbox"] {
            position: absolute;
            left: -10000px;
            z-index: - 1;
        }

        .choice .icon {
            text-align: center;
            vertical-align: middle;
            height: 106px;
            width: 106px;
            border-radius: 50% ;
            color: #999999;
            margin: 5px auto;
            border: 4px solid #CCCCCC;
            transition: all 0.2s;
            -webkit-transition: all 0.2s;
            overflow: hidden;
        }

        .choice .icon:hover {
            border-color: #4caf50;
        }

        .choice.active .icon {
            border-color: #2ca8ff;
        }

    </style>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


    <script>

        // Prepare the preview for profile picture
        $("#wizard-picture").change(function () {
            readURL(this);
        });
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#wizardPicturePreview').attr('src', e.target.result).fadeIn('slow');
                };
                reader.readAsDataURL(input.files[0]);
            }
        }

    </script>

</body>

</html>
