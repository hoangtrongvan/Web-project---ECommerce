package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.logging.Logger;
import java.util.logging.Level;
import java.sql.*;
import Data.JDBCConnection;

public final class pMacBook_002dpro_005fpage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>TODO supply a title</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("           <link href=\"https://fonts.googleapis.com/css?family=Oswald\" rel=\"stylesheet\">\n");
      out.write("          <link href=\"https://fonts.googleapis.com/css?family=Raleway:200,400|Roboto+Slab:100\" rel=\"stylesheet\">\n");
      out.write("        \n");
      out.write("  <link href=\"https://fonts.googleapis.com/css?family=Open+Sans\" rel=\"stylesheet\">\n");
      out.write("  <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js\"></script>\n");
      out.write(" \n");
      out.write("  <style>\n");
      out.write("      .submit-button{\n");
      out.write("                width: 100px;\n");
      out.write("                background-color: #333;\n");
      out.write("                color: white;\n");
      out.write("                padding: 14px 20px;\n");
      out.write("                margin: 8px 0;\n");
      out.write("                border : none;\n");
      out.write("                border-radius: 4px;\n");
      out.write("                cursor : pointer;\n");
      out.write("                    \n");
      out.write("            }\n");
      out.write("            .submit-button:hover{\n");
      out.write("                background-color: black;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            .sub-nav-buy{\n");
      out.write("              margin: 0;\n");
      out.write("              display: table;\n");
      out.write("                width: 94%;\n");
      out.write("                display: block;\n");
      out.write("                overflow: auto;\n");
      out.write("                padding: 15px 40px 15px 40px;\n");
      out.write("                \n");
      out.write("                text-align: center;\n");
      out.write("                list-style: none;\n");
      out.write("                border-bottom: 1px solid #d5d5d5;\n");
      out.write("                background-color: rgba(251,251,251,0.8);\n");
      out.write("                \n");
      out.write("                \n");
      out.write("              \n");
      out.write("            }\n");
      out.write("            .sub-nav-buy li{\n");
      out.write("                display: inline-block;\n");
      out.write("            }\n");
      out.write("             .clr{\n");
      out.write("                clear:both;\n");
      out.write("                 font-size:0;\n");
      out.write("            }\n");
      out.write("             .test{\n");
      out.write("                \n");
      out.write("             width: 100%;\n");
      out.write("             height: 600px;\n");
      out.write("             overflow:hidden;\n");
      out.write("             z-index: 0;\n");
      out.write("\n");
      out.write("  \n");
      out.write("            }\n");
      out.write("            .test .img_test{\n");
      out.write("               min-height:100%;\n");
      out.write("                \n");
      out.write("                z-index: 0;\n");
      out.write("    \n");
      out.write("                width:100%;\n");
      out.write("            }\n");
      out.write("            .test p{\n");
      out.write("                z-index: 1;\n");
      out.write("                margin-top: 10px;\n");
      out.write("            }\n");
      out.write("            .info-text{\n");
      out.write("                text-align: center;\n");
      out.write("               \n");
      out.write("                display: block;\n");
      out.write("                font-size: 17pt;\n");
      out.write("                width: 60%;\n");
      out.write("                margin: 0 auto; \n");
      out.write("                \n");
      out.write("            }\n");
      out.write("            .info-product{\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("             .NameandPrice{\n");
      out.write("                padding : 35px 0 35px 0;\n");
      out.write("            }\n");
      out.write("            .itemName{\n");
      out.write("                \n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("            .card_price{\n");
      out.write("                text-align: center;\n");
      out.write("                padding: 5px;\n");
      out.write("                background-color: #151515;\n");
      out.write("                color: #ffffff;\n");
      out.write("                border: 1px solid #151515;\n");
      out.write("                border-radius: 4px;\n");
      out.write("                font-size: 24pt;\n");
      out.write("            }\n");
      out.write("            hr.style-one {\n");
      out.write("    border: 0;\n");
      out.write("    height: 1px;\n");
      out.write("    background: #333;\n");
      out.write("    background-image: linear-gradient(to right, #ccc, #333, #ccc);\n");
      out.write("    width: 600px;\n");
      out.write("}\n");
      out.write("  </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
 try{
            JDBCConnection conn = new JDBCConnection("root", "pineapple");
            conn.getConnection();
            String command = "SELECT proname,prodesc,img_url,price FROM product";
            ResultSet rs = conn.executeQuery(command);
            while(rs.next()){
        
      out.write("\n");
      out.write("         \n");
      out.write("         ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "navbar.jsp", out, false);
      out.write("\n");
      out.write("            <ul class=\"sub-nav-buy\" id=\"wrap\">\n");
      out.write("                <li style=\"float:left;font-size: 14pt;\"><p>Pacbook Pro</p></li>\n");
      out.write("                <li style=\"float:right;font-size: 14pt;\"><a href=\"buy-pMacBookpro.jsp\"><input class=\"submit-button\" type=\"submit\" value=\"Buy\"></a></li>\n");
      out.write("            </ul>\n");
      out.write("        <div class=\"info-product\">\n");
      out.write("            <div class=\"NameandPrice\">\n");
      out.write("                <div class=\"itemName\">\n");
      out.write("                    <span style=\"font-family: 'Oswald', sans-serif;font-size: 24pt;\">");
out.print(rs.getString("proname"));
      out.write("</span><br>\n");
      out.write("                    <hr class=\"style-one\">\n");
      out.write("                    <br><br>\n");
      out.write("                    <span style=\"font-family: 'Roboto Slab', serif;;font-size: 50pt;\">");
out.print(rs.getString("prodesc"));
      out.write("</span><br><br>\n");
      out.write("                    \n");
      out.write("                </div><br>\n");
      out.write("                <div  style=\"text-align : center;\"> \n");
      out.write("                <span class=\"card_price\">$");
out.print(rs.getString("price"));
      out.write("</span>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        <div class=\"test\">\n");
      out.write("            \n");
      out.write("            <img class=\"img_test\" src = \"");
rs.getString("img_url");
      out.write("\"  >\n");
      out.write("            \n");
      out.write("           \n");
      out.write("            ");
}}
            catch (SQLException ex) {
            ex.printStackTrace();
        }  
      out.write("\n");
      out.write("        </div>\n");
      out.write("            <div class=\"info-text\">\n");
      out.write("             <p>It’s faster and more powerful than before, \n");
      out.write("                yet remarkably thinner and lighter. It has the brightest, most colorful Mac notebook display ever. \n");
      out.write("                And it introduces the Touch Bar — a Multi-Touch enabled strip of glass built into the keyboard for \n");
      out.write("                instant access to the tools you want, right when you want them. The new MacBook Pro is built on \n");
      out.write("                groundbreaking ideas. And it’s ready for yours.</p>\n");
      out.write("            </div>\n");
      out.write("             <div class=\"test\" style=\"height:900px;\">\n");
      out.write("            \n");
      out.write("            <img class=\"img_test\" src=\"images/mac/endframe_intro_models_large.jpg\"  >\n");
      out.write("           \n");
      out.write("           \n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("             <div class=\"info-text\">\n");
      out.write("             <p>The Touch Bar replaces the function keys that have long occupied the top of your keyboard with something much more versatile and capable.2 It changes automatically based on what you’re doing to show you relevant tools you already know how to use — system controls like volume and brightness, interactive ways to adjust or browse through content, intelligent typing features like emoji and predictive text, and more. And for the first time, Touch ID is available on a Mac, enabling instant access to logins and fast, secure online purchases with Apple Pay.</p>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("      ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\n");
      out.write("            <script>\n");
      out.write("    var elementPosition = $('#wrap').offset();\n");
      out.write("\n");
      out.write("    $(window).scroll(function () {\n");
      out.write("        if ($(window).scrollTop() > elementPosition.top) {\n");
      out.write("            $('#wrap').css('position', 'fixed').css('top', '0').css('width','94%');\n");
      out.write("        } else {\n");
      out.write("            $('#wrap').css('position', 'static');\n");
      out.write("        }\n");
      out.write("     });\n");
      out.write("</script>\n");
      out.write("    </body>\n");
      out.write("    \n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
