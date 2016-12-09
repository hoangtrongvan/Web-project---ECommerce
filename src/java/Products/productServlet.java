/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Products;

import Customer.User;
import com.javadb.lib.MySqlConnectionManager;
import com.nenjamin.ejb.MailSenderBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nhatduthan2405
 */
@WebServlet(name = "productServlet", urlPatterns = {"/productServlet"})
public class productServlet extends HttpServlet {
        ArrayList<Products> cart2 = new ArrayList();
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
            out.println("<title>Servlet productServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet productServlet at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        HttpSession session = request.getSession(true);
         
         /* Signup Action */
        if (action.equals("addtoCart")){ 
            String product_name = request.getParameter("product_name");
            String color = request.getParameter("color");
            String processor = request.getParameter("Processor");
            String memory = request.getParameter("Memory");
            String uEmail = null;
            String img_url = null;
            String productID = null;
           
     
            
            
            double price = 0.0;
            /* Get userEmail to name the session */
            Cookie[] cookies = request.getCookies();
            if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("uEmail")) uEmail = cookie.getValue();
            }
            }
            String product_fullName = product_name + " - " + color + " - " + processor + " - " + memory;
            
            /* Create MySql Connection */
                 MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");
        
                 sqlConnectionManager.openConnection();
        
                 String sqlStatement ="SELECT * FROM products";
                 ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
         try {
            while(rs.next()){
             if (rs.getString("Name").equals(product_name) && rs.getString("Color").equals(color)) {
                    price = Double.parseDouble(rs.getString("Price"));
                    img_url = rs.getString("img_url");
                    productID = rs.getString("ProductID");
              }
            }
            
                     
                     /* Checking the cart whether it's exist or not */
                     
                     cart2 = (ArrayList<Products>)session.getAttribute(uEmail);
                     if(cart2==null){
                         /* If cart is not exist --> create new cart and add product to it */
                         ArrayList<Products> cart = new ArrayList();
                         /* Create Products Object and set information inside object */
                         Products product = new Products(product_fullName, price, 1, img_url,productID);
                         cart.add(product);
                         session.setAttribute(uEmail,cart);
                         session.setMaxInactiveInterval(24*60*60);
                         
                     }
                     else {
                         /* If cart is exist --> keep adding product to cart */
                         int overlap = 0;
                         for(Products product : cart2){
                             if (product.getName().equals(product_fullName)){
                                 int newAmount = product.getAmount() + 1;
                                 product.setAmount(newAmount);
                                 overlap = 1;
                             }
                                 
                         }
                         if (overlap == 0){
                                Products product = new Products(product_fullName, price, 1, img_url,productID);
                                cart2.add(product);
                         }
                         session.setAttribute(uEmail, cart2 );
                     }        
            /*String sql2 = "INSERT INTO cart (CustomerEmail, Product, Amount, Price, img_url) " +
                   "VALUES (?,?,?,?,?)";
                
                
        
                    PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sql2);
                          preparedStmt.setString (1, uEmail);
                          preparedStmt.setString (2, product_fullName);
                          preparedStmt.setString (3, "1");
                          preparedStmt.setString (4, Double.toString(price));
                          preparedStmt.setString (5, img_url);
                       
                         
                          
                          
                        
                          preparedStmt.execute();
           sqlConnectionManager.closeConnection();
                     */
           
         }
                 catch (SQLException ex) {
            ex.printStackTrace();
        }
        
                     

        
        response.sendRedirect("/Pineapple/Transaction/PineappleCart.jsp");
        }
        else if (action.equals("Remove")){
            String uEmail = null;
                     Cookie[] cookies = request.getCookies();
            if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("uEmail")) uEmail = cookie.getValue();
            }
            }
                    
                    int removeIndex = Integer.parseInt(request.getParameter("remove"));
                     
                     ArrayList<Products> cart = (ArrayList<Products>)session.getAttribute(uEmail);
                    
                     cart.remove(removeIndex); /* Remove the identified index */
                     /* Create session and update cart after removing */
                     
                     session.setAttribute(uEmail, cart);
                     
                     response.sendRedirect("/Pineapple/Transaction/PineappleCart.jsp");
                     
            
        }
        else if (action.equals("update")){
              String uEmail = null;
                     Cookie[] cookies = request.getCookies();
            if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("uEmail")) uEmail = cookie.getValue();
            }
            }
                    
            String updateIndexString = request.getParameter("update");
            int updateIndex = Integer.parseInt(updateIndexString);
            String nameOfQuantity = "quantity" + updateIndexString;
            String newQuantity = request.getParameter(nameOfQuantity);
            ArrayList<Products> cart = (ArrayList<Products>)session.getAttribute(uEmail);
            cart.get(updateIndex).setAmount(Integer.parseInt(newQuantity));
            session.setAttribute(uEmail, cart);
           
            response.sendRedirect("/Pineapple/Transaction/PineappleCart.jsp");
                    
                
                  
                     
                     
        }else if (action.equals("checkout")){
           
            // Instantiate a Date object
            Date dateNow = new Date();
            SimpleDateFormat getDate =  new SimpleDateFormat ("dd/MM/yyyy");
            SimpleDateFormat getTime = new SimpleDateFormat("hh:mm:ss"); 
            String dateFormat = getDate.format(dateNow);
            String timeFormat = getTime.format(dateNow);
            
            /*Take the current user*/
            String uEmail = null;
            Cookie[] cookies = request.getCookies();
            if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("uEmail")) uEmail = cookie.getValue();
            }
            }
            /* Take shipping address */
                String shippingAddress = request.getParameter("shippingAddress");
            /* Take cart */
            ArrayList<Products> cart = (ArrayList<Products>)session.getAttribute(uEmail);
            /* Taking user information */
                 MySqlConnectionManager sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "pineapple", "root", "240596150995");
        
                 sqlConnectionManager.openConnection();
        
                 
                        
         try {
            User loginUser = (User)session.getAttribute("loginUser");
            String firstname = loginUser.getFirst_name();
            String lastname = loginUser.getLast_name();
            String full_name = firstname + " " + lastname;
            String dob = loginUser.getDob();
            String phone_number = loginUser.getPhone_number();
            String address = loginUser.getAddress();
            /* Send Email */
            double total = 0.0;
            
            


            String message = 
                 "<h1>Your Receipt</h1>\n" +
                 "<b>Name: </b>" + full_name + "<br>" +
                 "<b>Birthday: </b>" + dob + "<br>" +
                 "<b>Address: </b>" + address + "<br>" +
                 "<b>Phone number: </b>" + phone_number + "<br>" +
                 "<b>Shipping address: </b>" + shippingAddress + "\n" + "<br><br><br>" +
                   
                 "<table BORDER=1 ALIGN=CENTER>\n" + 
                     "<tr BGCOLOR=\"#FFAD00\">\n" + 
                        "<th>ProductID</th>\n" + 
                        "<th>Product Name</th>\n" + 
                        "<th>Price</th>\n" +
                        "<th>Quantity</th>\n" +
                        
                        "<th>Sub-total</th>\n" +
                    "</tr>\n";
            
             /* Insert Order */
            String sql2 = "INSERT INTO OrderPineapple (Customer, ProductID, Quantity, Date, Time)" +
                   "VALUES (?,?,?,?,?)";
                
                
        
                  
                             
        
                        
            for (Products product : cart){
                /* Insert Order */
                   PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sql2);
                          preparedStmt.setString (1, uEmail);
                          preparedStmt.setString (2, product.getProductID());
                          preparedStmt.setInt(3, product.getAmount());
                          preparedStmt.setString (4, dateFormat);
                          preparedStmt.setString (5, timeFormat);
                         
                     
                      
                        
                          preparedStmt.execute();
                 /* Update content of mail */
                message += 
                
                    "<tr>\n" + 
                        "<th>" + product.getProductID() + "</th>\n" + 
                        "<th>" + product.getName() + "</th>\n" + 
                         "<th>" + "$" + product.getPrice() + "</th>\n" +
                        "<th>" + product.getAmount() + "</th>\n" + 
                        
                        "<th>" + product.getAmount()*product.getPrice() + "</th>\n" + 
                    "</tr>\n";
                total += product.getAmount()*product.getPrice();
            }
            message += "<tr>\n" + 
                            "<th></th>\n" + 
                            "<th></th>\n" + 
                            "<th></th>\n" + 
                            "<th>Total</th>\n" + 
                            "<th>" + "$" + total + "</th>\n" + 
                            
                        "</tr>\n" +
                      "</table>";
            String subject = "[Pineapple]-"+ "Receipt of "  + full_name ;
           
        
            String fromEmail = "truongquangnhat.enactusiu@gmail.com";
            String username = "truongquangnhat.enactusiu@gmail.com";
            String password = "nokialumia1520";
            mailSender.sendEmail(fromEmail, username, password, uEmail, subject, message);
            
            
             /* Reset Cart*/
             session.removeAttribute(uEmail);
            response.sendRedirect("/Pineapple/webpages/index.jsp");
            
            }
                 catch (SQLException ex) {
            ex.printStackTrace();
        }
       
         sqlConnectionManager.closeConnection();
    }
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
