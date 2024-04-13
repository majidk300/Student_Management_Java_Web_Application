<%

    String errorMessage = (String) session.getAttribute("InvalidMessage");

    String signoutMessage = (String) session.getAttribute("signout");

    String StudentUpdate = (String) session.getAttribute("StudentUpdate");

    String deleteStudentMessage = (String) session.getAttribute("deleteStudentMessage");

    String attendenceMessage = (String) session.getAttribute("attendenceMessage");
    String StudentRollNumber = (String) session.getAttribute("StudentRollNumber");

    String NewAdminCreated = (String) session.getAttribute("NewAdminCreated");
    
    String deleteAdmin = (String) session.getAttribute("deleteAdmin");

    if (errorMessage != null) {

%>

<p><%=errorMessage%></p>


<style>

    .messages{
        height:10px;
        color:red;
        font-size:14px;
    }

</style>

<%

    session.removeAttribute("InvalidMessage");

} else if (signoutMessage != null) {

%>

<p><%=signoutMessage%></p>


<style>

    .messages{
        height:10px;
        color:green;
        font-size:14px;
    }

</style>

<%

    session.removeAttribute("signout");
} else if (StudentUpdate != null) {

%>

<p><%=StudentUpdate%></p>


<style>

    .messages{
        height:10px;
        color:#006600;
        font-size:18px;
        padding:0 0 15px 25px;
    }

</style>

<%
    session.removeAttribute("StudentUpdate");

} else if (deleteStudentMessage != null) {

%>

<p><%=deleteStudentMessage%></p>


<style>

    .messages{
        height:10px;
        color:#ff0000;
        font-size:18px;
        padding:0 0 15px 25px;
    }

</style>

<%

    session.removeAttribute("deleteStudentMessage");
} else if (attendenceMessage != null) {

%>

<p>roll number : <%=StudentRollNumber + " " + attendenceMessage%></p>


<style>

    .messages{
        height:10px;
        color:#003300;
        font-size:18px;
        padding:0 0 15px 25px;
    }

</style>

<%        session.removeAttribute("attendenceMessage");
    session.removeAttribute(StudentRollNumber);
} else if (NewAdminCreated != null) {

%>

<p><%=NewAdminCreated%></p>


<style>

    .messages{
        height:10px;
        color:green;
        font-size:18px;
        padding:0 0 15px 25px;
    }

</style>

<%        session.removeAttribute("NewAdminCreated");
} else if (deleteAdmin != null) {

%>

<p><%=deleteAdmin%></p>


<style>

    .messages{
        height:10px;
        color:green;
        font-size:18px;
        padding:0 0 15px 25px;
    }

</style>

<%        session.removeAttribute("deleteAdmin");
    }
%>