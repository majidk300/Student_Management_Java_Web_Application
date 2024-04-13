/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

import com.Dao.userDao;
import com.entities.loginEntitty;
import com.helper.factoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Majid
 */
public class adminServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            userDao adminlogin = new userDao(factoryProvider.getFactory());
            
            loginEntitty Userlogin =adminlogin.checkValidAdmin(username, password);
            
            if(username.equals("admin") && password.equals("majidadmin")){
                
                String user="admin";
                String pass="majidadmin";
                
                Userlogin = new loginEntitty(user, pass,"user.png");
                
            }
            
            
            try{
                
                
                  HttpSession  httpSession = request.getSession();
                
                if(Userlogin==null){
                    
                    httpSession.setAttribute("InvalidMessage", "Incorrect user or passowrd");
                   
                    response.sendRedirect("index.jsp");
                    
                }
                else{
                    
                    httpSession.setAttribute("user", Userlogin);
                     
                    httpSession.setAttribute("userName", username);
                    httpSession.setAttribute("userPassword", password);
                    
                    response.sendRedirect("studentManagementPanel.jsp");
                    
                }
                
            }catch(Exception e){
                e.printStackTrace();
            }
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
