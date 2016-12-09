/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nenjamin.servlet;

import com.javadb.lib.MySqlConnectionManager;
import com.nenjamin.ejb.MailSenderBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nhatduthan2405
 */
@WebServlet(name = "MailDispatcherServlet", urlPatterns = {"/MailDispatcherServlet"})
public class MailDispatcherServlet extends HttpServlet {

    
    private MailSenderBean mailSender;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MailDispatcherServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MailDispatcherServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
         HttpSession session = request.getSession(true);
        String passwordRecovered = null;
        /* Create dispatcher */
        RequestDispatcher dispatcher ;
        String toEmail = request.getParameter("recoverToMail");
        
         MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");
        
        sqlConnectionManager.openConnection();
        
        String sqlStatement = "Select * from useraccount";
        ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
        
       
            
            
        
       try {
            while(rs.next()){
             if (rs.getString("email").equals(toEmail)) {
                   passwordRecovered = rs.getString("password");
                   
              }
            } 
           
        }catch (SQLException ex) {
            ex.printStackTrace();
        }
        sqlConnectionManager.closeConnection();
        String subject = "[RECOVER PASSWORD]-"+ "["  + toEmail + "]";
        String message = "Your Password is : " + passwordRecovered;
        
        String fromEmail = "truongquangnhat.enactusiu@gmail.com";
        String username = "truongquangnhat.enactusiu@gmail.com";
        String password = "nokialumia1520";
        
        mailSender.sendEmail(fromEmail, username, password, toEmail, subject, message);
        
        String sent = "Your password has been sent to your email";
        session.setAttribute("wrongIDandPass", sent);
        response.sendRedirect("/Pineapple/User/login.jsp");
       
    }
     private void gotoPage(String address, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                RequestDispatcher dispatcher;
                dispatcher = request.getRequestDispatcher(address);
                dispatcher.forward(request, response);
                
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
