/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Products;

import Color.Color;
import ColorProduct.ColorProdDAO;
import ColorProduct.ColorProduct;
import Customer.User;
import Customer.UserDAO;
import ModelProduct.ModelProdDAO;
import ModelProduct.ModelProduct;
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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

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
            String productID = request.getParameter("productID");
            String color = request.getParameter("color");
            String modelID = request.getParameter("Model");
            ProductDAO productDAO = new ProductDAO();
            ModelProdDAO modelDAO = new ModelProdDAO();
            ModelProduct modelProd = new ModelProduct();
            Products product = new Products();
            ColorProduct colorProd = new ColorProduct();
            ColorProdDAO colorDAO = new ColorProdDAO();
            try {
                colorProd = colorDAO.getColorProductByProdID(color,productID);
                product = productDAO.getOneProduct(productID) ;
                modelProd =   modelDAO.getModelByID(Integer.parseInt(modelID));
            } catch (SQLException ex) {
                Logger.getLogger(productServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            String uEmail = null;
            String img_url = null;
            
           
     
            
            
            double price = 0.0;
            /* Get userEmail to name the session */
            Cookie[] cookies = request.getCookies();
            if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("uEmail")) uEmail = cookie.getValue();
            }
            }
            String product_fullName = product.getName() + " - " + color + " - Model" + modelProd.getModelID();
            
           
         
                    price = modelProd.getPrice() ;
                    img_url = colorProd.getColorProd_url() ;
                    String description = modelProd.getGeneralInfo();
            
            
                     
                     /* Checking the cart whether it's exist or not */
                     
                     cart2 = (ArrayList<Products>)session.getAttribute(uEmail);
                     if(cart2==null){
                         /* If cart is not exist --> create new cart and add product to it */
                         ArrayList<Products> cart = new ArrayList();
                         /* Create Products Object and set information inside object */
                         Products productinCart = new Products(product_fullName, price, 1, img_url,productID,description);
                         cart.add(productinCart);
                         session.setAttribute(uEmail,cart);
                         session.setMaxInactiveInterval(24*60*60);
                         
                     }
                     else {
                         /* If cart is exist --> keep adding product to cart */
                         int overlap = 0;
                         for(Products productinCart : cart2){
                             if (productinCart.getName().equals(product_fullName)){
                                 int newAmount = productinCart.getAmount() + 1;
                                 productinCart.setAmount(newAmount);
                                 overlap = 1;
                             }
                                 
                         }
                         if (overlap == 0){
                                Products productinCart = new Products(product_fullName, price, 1, img_url,productID,description);
                                cart2.add(productinCart);
                         }
                         session.setAttribute(uEmail, cart2 );
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
            String sql2 = "INSERT INTO OrderPineapple (Customer, ProductID, Quantity, Date, Time, ProductName)" +
                   "VALUES (?,?,?,?,?,?)";
                
                
        
                  
                             
        
                        
            for (Products product : cart){
                /* Insert Order */
                   PreparedStatement preparedStmt = sqlConnectionManager.getConnection().prepareStatement(sql2);
                          preparedStmt.setString (1, uEmail);
                          preparedStmt.setString (2, product.getProductID());
                          preparedStmt.setInt(3, product.getAmount());
                          preparedStmt.setString (4, dateFormat);
                          preparedStmt.setString (5, timeFormat);
                          preparedStmt.setString (6, product.getName());
                         
                     
                      
                        
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
    }else if (action.equals("addnewProduct")){
        String category = request.getParameter("Category");
        final Part fileAva = request.getPart("avaProd");
        final Part fileimg_desc1 = request.getPart("img_desc1");
        final Part fileimg_desc2 = request.getPart("img_desc2");
        final Part fileLarge_img = request.getPart("large_img");
        final Part fileSmall_icon = request.getPart("small_icon");
        String caption = request.getParameter("caption"); 
        String brief_desc = request.getParameter("briefdescription");
        String desc1 = request.getParameter("description1");
        String desc2 = request.getParameter("description2");
        final String path = "E:\\Web\\Github\\Web-project---ECommerce\\web\\ProductsContainer";
        String prodID = request.getParameter("prodID");
        String prodName = request.getParameter("prodName");
        ProductDAO productDAO = new ProductDAO();
        String ava_url = productDAO.addIMG(prodID + "Ava", fileAva, path);
        String img_desc1 = productDAO.addIMG(prodID + "desc1", fileimg_desc1, path);
        String img_desc2 = productDAO.addIMG(prodID + "desc2", fileimg_desc2, path);
        String large_img = productDAO.addIMG(prodID + "largeIMG", fileLarge_img, path);
        String Small_icon = productDAO.addIMG(prodID + "smallIcon", fileSmall_icon, path);
        Products product = new Products(prodID, prodName, ava_url, brief_desc, desc1, desc2, img_desc1, img_desc2, large_img, category, Small_icon, caption);
        productDAO.addProduct(product);
        String[] color = request.getParameterValues("color");
        String modelAmount = request.getParameter("modelAmount");
        ArrayList<ColorProduct> chosenColors = new ArrayList<>();
        ColorProduct colorProduct = new ColorProduct();
            for (String color1 : color) {
                colorProduct = new ColorProduct(prodID, color1);
                chosenColors.add(colorProduct);
            }
        session.setAttribute("chosenColors", chosenColors);
        session.setMaxInactiveInterval(2*60*60);
        session.setAttribute("color", color);
      
        
           
        session.setAttribute("modelAmount", modelAmount);
        response.sendRedirect("/Pineapple/Manager/AddInfoProd.jsp");
        
    }else if (action.equals("addProduct")){
        /* Add color for product */
        ArrayList<ColorProduct> chosenColors = (ArrayList<ColorProduct>)session.getAttribute("chosenColors");
        session.removeAttribute("chosenColors");
        final String path = "E:\\Web\\Github\\Web-project---ECommerce\\web\\colorProducts";
        ColorProdDAO colorProdDAO = new ColorProdDAO();
        for(ColorProduct colorProd : chosenColors){
            
            final Part filePart = request.getPart(colorProd.getColor());
            
            colorProdDAO.addColorProd(colorProd, filePart, path);
            
            
        }
        /* Add model for product */
        
        
        String prodID = request.getParameter("prodID");
        String modelAmount = (String)session.getAttribute("modelAmount");
        session.removeAttribute("modelAmount");
        int amount = Integer.parseInt(modelAmount);
        ModelProdDAO modelprodDAO = new ModelProdDAO();
        ModelProduct modelProd = new ModelProduct();
        for (int i=0;i<amount;i++){
        String index = Integer.toString(i);
        
        String generalInformation = request.getParameter("generalInformation" + index);
        String price = request.getParameter("price" + index);
            modelProd = new ModelProduct(prodID, generalInformation, Float.valueOf(price));
            modelprodDAO.addModelProd(modelProd);
        }
        response.sendRedirect("/Pineapple/Manager/Product-List.jsp");
    }else if (action.equals("removeProduct")){
        String prodID = request.getParameter("remove"); 
        ProductDAO productDAO = new ProductDAO();
        productDAO.removeProduct(prodID);
        response.sendRedirect("/Pineapple/Manager/Product-List.jsp");
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
