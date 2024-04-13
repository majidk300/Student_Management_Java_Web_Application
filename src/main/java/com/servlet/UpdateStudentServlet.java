/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

import com.Dao.StudentSaveDao;
import com.entities.studentEntitiesFirstYear;
import com.helper.factoryProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Majid
 */
@MultipartConfig
public class UpdateStudentServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            int studentId = Integer.parseInt(request.getParameter("studentID"));
            String name = request.getParameter("name");
            String roll = request.getParameter("roll");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String StudentCategoryOption = request.getParameter("StudentCategoryOption");
            String studentSession = request.getParameter("studentSession");
            String gender = request.getParameter("gender");
            Part picture__input = request.getPart("picture__input");

            try {

                studentEntitiesFirstYear studentDetail = new studentEntitiesFirstYear(studentId, name, roll, email, phone, StudentCategoryOption, studentSession, gender, picture__input.getSubmittedFileName());

                StudentSaveDao studentUpdate = new StudentSaveDao(factoryProvider.getFactory());

                studentUpdate.UpdateStudent(studentDetail);

            } catch (Exception e) {
                e.printStackTrace();
            }

//            SAVE IMAGE
            String path = request.getRealPath("StudentImages") + File.separator + picture__input.getSubmittedFileName();

            FileOutputStream fos = new FileOutputStream(path);
            InputStream is = picture__input.getInputStream();

            byte[] data = new byte[is.available()];

            is.read(data);
            fos.write(data);

            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("StudentUpdate", "student updated");

            response.sendRedirect("FirstYearStudentDetails.jsp");

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
