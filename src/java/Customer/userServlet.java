/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Customer;

import Products.Products;
import com.javadb.lib.MySqlConnectionManager;
import static com.sun.xml.internal.ws.spi.db.BindingContextFactory.LOGGER;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


/**
 *
 * @author nhatduthan2405
 */
@WebServlet(name = "userServlet", urlPatterns = {"/userServlet"})
public class userServlet extends HttpServlet {

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
            out.println("<title>Servlet userServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet userServlet at " + request.getContextPath() + "</h1>");
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
         else if (action.equals("updateInfo")){
                String first_name = request.getParameter("first_name");
                String last_name = request.getParameter("last_name");
                String birthday = request.getParameter("birthday");
                String address = request.getParameter("address");
                String email = request.getParameter("email");
                String phone_number = request.getParameter("phone_number");
                UserDAO userDAO = new UserDAO();
                session.setAttribute("test", address);
                
            try {
                userDAO.updateUserInfo(first_name, last_name, birthday, phone_number, address, email);
            } catch (SQLException ex) {
                Logger.getLogger(userServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            String infoUpdated  = "Profile Updated";
            session.setAttribute("SuccessUpdated", infoUpdated);
            response.sendRedirect("/Pineapple/User/account.jsp");
         }
        else if (action.equals("updatePassword")){
                String valid = ""; 
                User loginUser = (User)session.getAttribute("loginUser");
                 
                String oldPass = request.getParameter("old_password");
                String newPass = request.getParameter("new_password");
                String newPass_Confirm = request.getParameter("confirm_newpassword");
                String loginEmail = loginUser.getEmail();
                UserDAO userDAO = new UserDAO();
                
                boolean check = false;
            try {
                check = userDAO.checkPassword(loginUser.getEmail(), oldPass);
            } catch (SQLException ex) {
                Logger.getLogger(userServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
                if(check==false){
                     valid  = "Old password incorrect";
                     session.setAttribute("Valid", valid);
                    
                    response.sendRedirect("/Pineapple/User/account.jsp");
                }else if(!newPass.equals(newPass_Confirm)){
                    valid   = "Confim Password not match";
                    session.setAttribute("Valid", valid);
                    response.sendRedirect("/Pineapple/User/account.jsp");
                }else{
                    
                    try {
                        
                        userDAO.updatePassword(loginEmail,newPass);
                    } catch (SQLException ex) {
                        Logger.getLogger(userServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    valid   = "Password Updated";
                    session.setAttribute("Valid", valid);
                    response.sendRedirect("/Pineapple/User/account.jsp");
                }
        }else if(action.equals("changeAvatar")){
            
            final String path = "E:\\Web\\Github\\Web-project---ECommerce\\web\\avatars";
            final Part filePart = request.getPart("file");
            
            User loginUser = (User)session.getAttribute("loginUser");
            
            UserDAO userDAO = new UserDAO();
            
            userDAO.changeAvatar(loginUser, filePart, path);
            try {
                Thread.sleep(12000);
            } catch(InterruptedException ex) {
            Thread.currentThread().interrupt();
            }
            
            response.sendRedirect("/Pineapple/User/account.jsp");
            

        }else if(action.equals("setManager")){
            
            
            int uID = Integer.parseInt(request.getParameter("setManager"));
            UserDAO userDAO = new UserDAO();
            
            userDAO.setManager(uID);
            response.sendRedirect("/Pineapple/Manager/Manager-List.jsp");
            

        }else if(action.equals("removeManager")){
            
            
            int uID = Integer.parseInt(request.getParameter("removeManager"));
            UserDAO userDAO = new UserDAO();
            
            userDAO.removeManager(uID);
            response.sendRedirect("/Pineapple/Manager/Manager-List.jsp");
            

        }else if(action.equals("removeUser")){
            
            
            String uEmail = request.getParameter("removeUser");
            UserDAO userDAO = new UserDAO();
            
            userDAO.removeUser(uEmail);
            response.sendRedirect("/Pineapple/Manager/Customer-List.jsp");
            

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
            /* Check checkout or login*/ 
            String userEmail = "";
            
            /* Get userEmail to name the session */
            Cookie[] cookies = request.getCookies();
            if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("uEmail")) userEmail = cookie.getValue();
            }
            }         
           /* Get available cart from session and display it on screen */ 
           ArrayList<Products> cart = (ArrayList<Products>)session.getAttribute(userEmail);
           
           
           if(emailLogin.equals(userEmail)){
           if (cart!=null && !cart.isEmpty()){
              response.sendRedirect("/Pineapple/Transaction/checkout.jsp"); 
              return;
           }
           }else{
              
              Cookie uEmailCookie = new Cookie("uEmail",emailLogin);
              
              uEmailCookie.setMaxAge(24*60*60);
              
              response.addCookie(uEmailCookie);
             
             
             
              response.sendRedirect("/Pineapple/webpages/index.jsp");
              return;
           }
              }
            }
           
            String wrongIDandPass = "Email or Password entered is not correct";
            session.setAttribute("wrongIDandPass", wrongIDandPass);
            response.sendRedirect("/Pineapple/User/login.jsp");
           
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
                     response.sendRedirect("/Pineapple/User/signup.jsp");
                     return;
                     
              }
            } 
            if(!password.equals(confirm_password)){
                     String notMatch = "Password and Confirm Password not match";
                     session.setAttribute("notMatch", notMatch);
                     response.sendRedirect("/Pineapple/User/signup.jsp");
                     return;
                     
                } else {
                
                String first_name = request.getParameter("first_name");
                String last_name = request.getParameter("last_name");
                String birthday = request.getParameter("birthday");
                String address = request.getParameter("address");
                String revieve_info = request.getParameter("recieveInfo");
                String phone_number = request.getParameter("phone_number");
                String ava_url = "..\\avatars\\defaultAvatar.png";
            
                String sql2 = "INSERT INTO useraccount (email, password, first_name, last_name, birthday, phone_number, address, recieved, isManager, ava_url)  " +
                   "VALUES (?,?,?,?,?,?,?,?,?,?)";
                
                
        
                    PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sql2);
                          preparedStmt.setString (1, email);
                          preparedStmt.setString (2, password);
                          preparedStmt.setString (3, first_name);
                          preparedStmt.setString (4, last_name);
                          preparedStmt.setString (5, birthday);
                          preparedStmt.setString (6, phone_number);
                          preparedStmt.setString (7, address);
                          preparedStmt.setString (8, revieve_info);
                          preparedStmt.setString (9, "0");
                          preparedStmt.setString (10, ava_url);
                          preparedStmt.execute();
                             
                       
                      
                
                       
      
                  /* Close MySql Connection */   
                 sqlConnectionManager.closeConnection();
                 
                
                 response.sendRedirect("/Pineapple/webpages/index.jsp");
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
