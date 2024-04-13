/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

import com.Dao.userDao;
import com.entities.loginEntitty;
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
import javax.servlet.http.Part;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Majid
 */
@MultipartConfig
public class UpdateProfileServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            int userId = Integer.parseInt(request.getParameter("userId"));
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            Part adminPhoto = request.getPart("adminPhoto");

            try {
//                out.println(userId);
//                out.println(username);
//                out.println(password);
//                out.println(adminPhoto.getSubmittedFileName());

                userDao adminlogin = new userDao(factoryProvider.getFactory());
                loginEntitty Profile = new loginEntitty(userId, username, password, adminPhoto.getSubmittedFileName());
                adminlogin.updateProfile(Profile);

            } catch (Exception e) {
                e.printStackTrace();
            }

            HttpSession httpSession = request.getSession();

            httpSession.setAttribute("NewAdminCreated", "updated");

//            User Data For Send 
            httpSession.setAttribute("userName", username);
            httpSession.setAttribute("userPassword", password);

            response.sendRedirect("updateProfile.jsp");

            // SAVE IMAGE
            String path = request.getRealPath("StudentImages") + File.separator + adminPhoto.getSubmittedFileName();

//            CREATING FOLDER IF NOT IMAGE FOLDER IS NOT PRESENTED
            File file = new File(path);
            File parentDir = file.getParentFile();
            if (!parentDir.exists()) {
                parentDir.mkdirs(); // This will create all necessary parent directories
            }

            FileOutputStream fos = new FileOutputStream(path);
            InputStream is = adminPhoto.getInputStream();

            byte[] data = new byte[is.available()];

            is.read(data);
            fos.write(data);

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
