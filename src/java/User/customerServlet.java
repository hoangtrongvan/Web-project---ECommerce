/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

import com.javadb.lib.MySqlConnectionManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nhatduthan2405
 */
public class customerServlet extends HttpServlet {

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
            out.println("<title>Servlet customerServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet customerServlet at " + request.getContextPath() + "</h1>");
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
        /* Create dispatcher */
        RequestDispatcher dispatcher ;
        
        HttpSession session = request.getSession(true);
        String action = request.getParameter("action");

         /* Signup Action */
        if (action.equals("signup")){ 
            
            
              doSIGNUP(session,request,response);   
                
        }
        /* Login Action */
        else if (action.equals("login")){ 
              doLOGIN(session,request,response);  
        }
          /* Sign out Action */
        else if (action.equals("signout")){
             doSIGNOUT(session,request,response);
            
        }

    }

    private void doSIGNOUT(HttpSession session,HttpServletRequest request,HttpServletResponse response)
                                    throws ServletException, IOException {
     Cookie[] cookies = request.getCookies();
            if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("uFirstname") || cookie.getName().equals("uEmail") ){ 
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                    session.removeAttribute("loginUser");
                }
            }
                                }
            response.sendRedirect("/Pineapple/webpages/index.jsp");
}
            private void doLOGIN(HttpSession session,HttpServletRequest request,HttpServletResponse response)
                                    throws ServletException, IOException {
    
                String emailLogin = request.getParameter("emailLogin");
                String passwordLogin = request.getParameter("passwordLogin");
                
               
        

        
    
                /* Create MySql Connection */
                 MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");
        
                 sqlConnectionManager.openConnection();
        
                 String sqlStatement ="SELECT * FROM useraccount";
                 ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
         try {
            while(rs.next()){
             if (rs.getString("email").equals(emailLogin) && rs.getString("password").equals(passwordLogin)) {
              
             
              Cookie uEmailCookie = new Cookie("uEmail",emailLogin);
              
              uEmailCookie.setMaxAge(24*60*60);
              
              response.addCookie(uEmailCookie);
             
             
              
              response.sendRedirect("index.jsp");
              return;
              }
            }
           
            String wrongIDandPass = "Email or Password entered is not correct";
            session.setAttribute("wrongIDandPass", wrongIDandPass);
            gotoPage("/Pineapple/User/login.jsp",request,response);
           
         }
                 catch (SQLException ex) {
            ex.printStackTrace();
        }
        
                     

        sqlConnectionManager.closeConnection();
    
}

        private void doSIGNUP(HttpSession session,HttpServletRequest request,HttpServletResponse response)
                                    throws ServletException, IOException {
    
         String email = request.getParameter("email");
                String password = request.getParameter("password");
                String confirm_password = request.getParameter("confirm_password");
                
                /* Create MySql Connection */
        MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");
        
        sqlConnectionManager.openConnection();
        
        String sqlStatement = "Select * from useraccount";
        ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
        
       
            
            
        
       try {
            while(rs.next()){
             if (rs.getString("email").equals(email)) {
                     String wasRegistered = "It looks like " + email + " was registered, please enter other user account";
                     session.setAttribute("wasRegistered", wasRegistered);
                     gotoPage("/Pineapple/User/signup.jsp", request, response);
                     
              }
            } 
            if(!password.equals(confirm_password)){
                     String notMatch = "Password and Confirm Password not match";
                     session.setAttribute("notMatch", notMatch);
                     gotoPage("/Pineapple/User/signup.jsp", request, response);
                     
                } else {
                
                String first_name = request.getParameter("first_name");
                String last_name = request.getParameter("last_name");
                String birthday = request.getParameter("birthday");
                String address = request.getParameter("address");
                String revieve_info = request.getParameter("recieveInfo");
                String phone_number = request.getParameter("phone_number");
            
                String sql2 = "INSERT INTO useraccount (email, password, first_name, last_name, birthday, phone_number, address, recieved, isManager)  " +
                   "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                
                
        
                    PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sql2);
                          preparedStmt.setString (1, email);
                          preparedStmt.setString (2, password);
                          preparedStmt.setString (3, first_name);
                          preparedStmt.setString (4, last_name);
                          preparedStmt.setString (5, birthday);
                          preparedStmt.setString (6, phone_number);
                          preparedStmt.setString (7, address);
                          preparedStmt.setString (8, revieve_info);
                          preparedStmt.setString (9, "haha");
                        
                          preparedStmt.execute();
                             
                       
                      
                
                       
      
                  /* Close MySql Connection */   
                 sqlConnectionManager.closeConnection();
                 
                 gotoPage("/Pineapple/User/signup.jsp", request, response); 
                }
        
        }catch (SQLException ex) {
            ex.printStackTrace();
        }
        
}
        private void gotoPage(String address, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                RequestDispatcher dispatcher;
                dispatcher = request.getRequestDispatcher(address);
                dispatcher.forward(request, response);
                
} 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
