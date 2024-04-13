package com.servlet;

import com.Dao.AttendenceDao;
import com.Dao.StudentSaveDao;
import com.entities.AttendenceEntities;
import com.helper.factoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Majid
 */
public class AttendenceServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String StudentName = request.getParameter("StudentName");
            String StudentRollNumber = request.getParameter("StudentRollNumber");
            int StudentId = Integer.parseInt(request.getParameter("StudentId"));
            String attendence = request.getParameter("attendence");
            String attendenceDate = (String) request.getParameter("attendenceDate");

            try {

                AttendenceEntities studentAttendenceData = new AttendenceEntities(StudentName, StudentRollNumber, StudentId, attendence, attendenceDate);

                AttendenceDao studentAttendence = new AttendenceDao(factoryProvider.getFactory());

                studentAttendence.TakeAttendece(studentAttendenceData);

            } catch (Exception e) {
                e.printStackTrace();
            }

            HttpSession httpSession = request.getSession();
            
            httpSession.setAttribute("StudentRollNumber", StudentRollNumber);

            if (attendence != null && attendence.equals("present")) {

                httpSession.setAttribute("attendenceMessage", "present");
              
            } else if (attendence != null && attendence.equals("absent")) {

                httpSession.setAttribute("attendenceMessage", "absent");
                
            }

            String year = (String) httpSession.getAttribute("year");

            response.sendRedirect("StudentAttendence.jsp?value=" + year);

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
