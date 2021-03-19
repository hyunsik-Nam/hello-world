/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.39
 * Generated at: 2020-12-22 06:31:03 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.layout;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class memberlayout_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<title>W3.CSS Template</title>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://www.w3schools.com/w3css/4/w3.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css?family=Raleway\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\r\n");
      out.write("<style>\r\n");
      out.write("body,h1,h2,h3,h4,h5,h6 {font-family: \"Raleway\", sans-serif}\r\n");
      out.write("</style>\r\n");
      out.write("<body class=\"w3-light-grey w3-content\" style=\"max-width:1600px\">\r\n");
      out.write("\r\n");
      out.write("<!-- Sidebar/menu -->\r\n");
      out.write("<nav class=\"w3-sidebar w3-collapse w3-white w3-animate-left\" style=\"z-index:3;width:300px;\" id=\"mySidebar\"><br>\r\n");
      out.write("  <div class=\"w3-container\">\r\n");
      out.write("    <a href=\"#\" onclick=\"w3_close()\" class=\"w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey\" title=\"close menu\">\r\n");
      out.write("      <i class=\"fa fa-remove\"></i>\r\n");
      out.write("    </a>\r\n");
      out.write("    <img src=\"/w3images/avatar_g2.jpg\" style=\"width:45%;\" class=\"w3-round\"><br><br>\r\n");
      out.write("    <h4><b>PORTFOLIO</b></h4>\r\n");
      out.write("    <p class=\"w3-text-grey\">Template by W3.CSS</p>\r\n");
      out.write("  </div>\r\n");
      out.write("  <div class=\"w3-bar-block\">\r\n");
      out.write("    <a href=\"#portfolio\" onclick=\"w3_close()\" class=\"w3-bar-item w3-button w3-padding w3-text-teal\"><i class=\"fa fa-th-large fa-fw w3-margin-right\"></i>PORTFOLIO</a> \r\n");
      out.write("    <a href=\"#about\" onclick=\"w3_close()\" class=\"w3-bar-item w3-button w3-padding\"><i class=\"fa fa-user fa-fw w3-margin-right\"></i>ABOUT</a> \r\n");
      out.write("    <a href=\"#contact\" onclick=\"w3_close()\" class=\"w3-bar-item w3-button w3-padding\"><i class=\"fa fa-envelope fa-fw w3-margin-right\"></i>CONTACT</a>\r\n");
      out.write("  </div>\r\n");
      out.write("  <div class=\"w3-panel w3-large\">\r\n");
      out.write("    <i class=\"fa fa-facebook-official w3-hover-opacity\"></i>\r\n");
      out.write("    <i class=\"fa fa-instagram w3-hover-opacity\"></i>\r\n");
      out.write("    <i class=\"fa fa-snapchat w3-hover-opacity\"></i>\r\n");
      out.write("    <i class=\"fa fa-pinterest-p w3-hover-opacity\"></i>\r\n");
      out.write("    <i class=\"fa fa-twitter w3-hover-opacity\"></i>\r\n");
      out.write("    <i class=\"fa fa-linkedin w3-hover-opacity\"></i>\r\n");
      out.write("  </div>\r\n");
      out.write("</nav>\r\n");
      out.write("\r\n");
      out.write("<!-- Overlay effect when opening sidebar on small screens -->\r\n");
      out.write("<div class=\"w3-overlay w3-hide-large w3-animate-opacity\" onclick=\"w3_close()\" style=\"cursor:pointer\" title=\"close side menu\" id=\"myOverlay\"></div>\r\n");
      out.write("\r\n");
      out.write("<!-- !PAGE CONTENT! -->\r\n");
      out.write("<div class=\"w3-main\" style=\"margin-left:300px\">\r\n");
      out.write("\r\n");
      out.write("  <!-- Header -->\r\n");
      out.write("  <header id=\"portfolio\">\r\n");
      out.write("    <a href=\"#\"><img src=\"/w3images/avatar_g2.jpg\" style=\"width:65px;\" class=\"w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity\"></a>\r\n");
      out.write("    <span class=\"w3-button w3-hide-large w3-xxlarge w3-hover-text-grey\" onclick=\"w3_open()\"><i class=\"fa fa-bars\"></i></span>\r\n");
      out.write("    <div class=\"w3-container\">\r\n");
      out.write("    <h1><b>My Portfolio</b></h1>\r\n");
      out.write("    <div class=\"w3-section w3-bottombar w3-padding-16\">\r\n");
      out.write("      <span class=\"w3-margin-right\">Filter:</span> \r\n");
      out.write("      <button class=\"w3-button w3-black\">ALL</button>\r\n");
      out.write("      <button class=\"w3-button w3-white\"><i class=\"fa fa-diamond w3-margin-right\"></i>Design</button>\r\n");
      out.write("      <button class=\"w3-button w3-white w3-hide-small\"><i class=\"fa fa-photo w3-margin-right\"></i>Photos</button>\r\n");
      out.write("      <button class=\"w3-button w3-white w3-hide-small\"><i class=\"fa fa-map-pin w3-margin-right\"></i>Art</button>\r\n");
      out.write("    </div>\r\n");
      out.write("    </div>\r\n");
      out.write("  </header>\r\n");
      out.write("  \r\n");
      out.write("  <!-- First Photo Grid-->\r\n");
      out.write("  <div class=\"w3-row-padding\">\r\n");
      out.write("    <div class=\"w3-third w3-container w3-margin-bottom\">\r\n");
      out.write("      <img src=\"/w3images/mountains.jpg\" alt=\"Norway\" style=\"width:100%\" class=\"w3-hover-opacity\">\r\n");
      out.write("      <div class=\"w3-container w3-white\">\r\n");
      out.write("        <p><b>Lorem Ipsum</b></p>\r\n");
      out.write("        <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"w3-third w3-container w3-margin-bottom\">\r\n");
      out.write("      <img src=\"/w3images/lights.jpg\" alt=\"Norway\" style=\"width:100%\" class=\"w3-hover-opacity\">\r\n");
      out.write("      <div class=\"w3-container w3-white\">\r\n");
      out.write("        <p><b>Lorem Ipsum</b></p>\r\n");
      out.write("        <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"w3-third w3-container\">\r\n");
      out.write("      <img src=\"/w3images/nature.jpg\" alt=\"Norway\" style=\"width:100%\" class=\"w3-hover-opacity\">\r\n");
      out.write("      <div class=\"w3-container w3-white\">\r\n");
      out.write("        <p><b>Lorem Ipsum</b></p>\r\n");
      out.write("        <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("  </div>\r\n");
      out.write("  \r\n");
      out.write("  <!-- Second Photo Grid-->\r\n");
      out.write("  <div class=\"w3-row-padding\">\r\n");
      out.write("    <div class=\"w3-third w3-container w3-margin-bottom\">\r\n");
      out.write("      <img src=\"/w3images/p1.jpg\" alt=\"Norway\" style=\"width:100%\" class=\"w3-hover-opacity\">\r\n");
      out.write("      <div class=\"w3-container w3-white\">\r\n");
      out.write("        <p><b>Lorem Ipsum</b></p>\r\n");
      out.write("        <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"w3-third w3-container w3-margin-bottom\">\r\n");
      out.write("      <img src=\"/w3images/p2.jpg\" alt=\"Norway\" style=\"width:100%\" class=\"w3-hover-opacity\">\r\n");
      out.write("      <div class=\"w3-container w3-white\">\r\n");
      out.write("        <p><b>Lorem Ipsum</b></p>\r\n");
      out.write("        <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"w3-third w3-container\">\r\n");
      out.write("      <img src=\"/w3images/p3.jpg\" alt=\"Norway\" style=\"width:100%\" class=\"w3-hover-opacity\">\r\n");
      out.write("      <div class=\"w3-container w3-white\">\r\n");
      out.write("        <p><b>Lorem Ipsum</b></p>\r\n");
      out.write("        <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("  </div>\r\n");
      out.write("\r\n");
      out.write("  <!-- Pagination -->\r\n");
      out.write("  <div class=\"w3-center w3-padding-32\">\r\n");
      out.write("    <div class=\"w3-bar\">\r\n");
      out.write("      <a href=\"#\" class=\"w3-bar-item w3-button w3-hover-black\">«</a>\r\n");
      out.write("      <a href=\"#\" class=\"w3-bar-item w3-black w3-button\">1</a>\r\n");
      out.write("      <a href=\"#\" class=\"w3-bar-item w3-button w3-hover-black\">2</a>\r\n");
      out.write("      <a href=\"#\" class=\"w3-bar-item w3-button w3-hover-black\">3</a>\r\n");
      out.write("      <a href=\"#\" class=\"w3-bar-item w3-button w3-hover-black\">4</a>\r\n");
      out.write("      <a href=\"#\" class=\"w3-bar-item w3-button w3-hover-black\">»</a>\r\n");
      out.write("    </div>\r\n");
      out.write("  </div>\r\n");
      out.write("\r\n");
      out.write("  <!-- Images of Me -->\r\n");
      out.write("  <div class=\"w3-row-padding w3-padding-16\" id=\"about\">\r\n");
      out.write("    <div class=\"w3-col m6\">\r\n");
      out.write("      <img src=\"/w3images/avatar_g.jpg\" alt=\"Me\" style=\"width:100%\">\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"w3-col m6\">\r\n");
      out.write("      <img src=\"/w3images/me2.jpg\" alt=\"Me\" style=\"width:100%\">\r\n");
      out.write("    </div>\r\n");
      out.write("  </div>\r\n");
      out.write("\r\n");
      out.write("  <div class=\"w3-container w3-padding-large\" style=\"margin-bottom:32px\">\r\n");
      out.write("    <h4><b>About Me</b></h4>\r\n");
      out.write("    <p>Just me, myself and I, exploring the universe of unknownment. I have a heart of love and an interest of lorem ipsum and mauris neque quam blog. I want to share my world with you. Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla. Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>\r\n");
      out.write("    <hr>\r\n");
      out.write("    \r\n");
      out.write("    <h4>Technical Skills</h4>\r\n");
      out.write("    <!-- Progress bars / Skills -->\r\n");
      out.write("    <p>Photography</p>\r\n");
      out.write("    <div class=\"w3-grey\">\r\n");
      out.write("      <div class=\"w3-container w3-dark-grey w3-padding w3-center\" style=\"width:95%\">95%</div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <p>Web Design</p>\r\n");
      out.write("    <div class=\"w3-grey\">\r\n");
      out.write("      <div class=\"w3-container w3-dark-grey w3-padding w3-center\" style=\"width:85%\">85%</div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <p>Photoshop</p>\r\n");
      out.write("    <div class=\"w3-grey\">\r\n");
      out.write("      <div class=\"w3-container w3-dark-grey w3-padding w3-center\" style=\"width:80%\">80%</div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <p>\r\n");
      out.write("      <button class=\"w3-button w3-dark-grey w3-padding-large w3-margin-top w3-margin-bottom\">\r\n");
      out.write("        <i class=\"fa fa-download w3-margin-right\"></i>Download Resume\r\n");
      out.write("      </button>\r\n");
      out.write("    </p>\r\n");
      out.write("    <hr>\r\n");
      out.write("    \r\n");
      out.write("    <h4>How much I charge</h4>\r\n");
      out.write("    <!-- Pricing Tables -->\r\n");
      out.write("    <div class=\"w3-row-padding\" style=\"margin:0 -16px\">\r\n");
      out.write("      <div class=\"w3-third w3-margin-bottom\">\r\n");
      out.write("        <ul class=\"w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off\">\r\n");
      out.write("          <li class=\"w3-black w3-xlarge w3-padding-32\">Basic</li>\r\n");
      out.write("          <li class=\"w3-padding-16\">Web Design</li>\r\n");
      out.write("          <li class=\"w3-padding-16\">Photography</li>\r\n");
      out.write("          <li class=\"w3-padding-16\">1GB Storage</li>\r\n");
      out.write("          <li class=\"w3-padding-16\">Mail Support</li>\r\n");
      out.write("          <li class=\"w3-padding-16\">\r\n");
      out.write("            <h2>$ 10</h2>\r\n");
      out.write("            <span class=\"w3-opacity\">per month</span>\r\n");
      out.write("          </li>\r\n");
      out.write("          <li class=\"w3-light-grey w3-padding-24\">\r\n");
      out.write("            <button class=\"w3-button w3-teal w3-padding-large w3-hover-black\">Sign Up</button>\r\n");
      out.write("          </li>\r\n");
      out.write("        </ul>\r\n");
      out.write("      </div>\r\n");
      out.write("      \r\n");
      out.write("      <div class=\"w3-third w3-margin-bottom\">\r\n");
      out.write("        <ul class=\"w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off\">\r\n");
      out.write("          <li class=\"w3-teal w3-xlarge w3-padding-32\">Pro</li>\r\n");
      out.write("          <li class=\"w3-padding-16\">Web Design</li>\r\n");
      out.write("          <li class=\"w3-padding-16\">Photography</li>\r\n");
      out.write("          <li class=\"w3-padding-16\">50GB Storage</li>\r\n");
      out.write("          <li class=\"w3-padding-16\">Endless Support</li>\r\n");
      out.write("          <li class=\"w3-padding-16\">\r\n");
      out.write("            <h2>$ 25</h2>\r\n");
      out.write("            <span class=\"w3-opacity\">per month</span>\r\n");
      out.write("          </li>\r\n");
      out.write("          <li class=\"w3-light-grey w3-padding-24\">\r\n");
      out.write("            <button class=\"w3-button w3-teal w3-padding-large w3-hover-black\">Sign Up</button>\r\n");
      out.write("          </li>\r\n");
      out.write("        </ul>\r\n");
      out.write("      </div>\r\n");
      out.write("      \r\n");
      out.write("      <div class=\"w3-third\">\r\n");
      out.write("        <ul class=\"w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off\">\r\n");
      out.write("          <li class=\"w3-black w3-xlarge w3-padding-32\">Premium</li>\r\n");
      out.write("          <li class=\"w3-padding-16\">Web Design</li>\r\n");
      out.write("          <li class=\"w3-padding-16\">Photography</li>\r\n");
      out.write("          <li class=\"w3-padding-16\">Unlimited Storage</li>\r\n");
      out.write("          <li class=\"w3-padding-16\">Endless Support</li>\r\n");
      out.write("          <li class=\"w3-padding-16\">\r\n");
      out.write("            <h2>$ 25</h2>\r\n");
      out.write("            <span class=\"w3-opacity\">per month</span>\r\n");
      out.write("          </li>\r\n");
      out.write("          <li class=\"w3-light-grey w3-padding-24\">\r\n");
      out.write("            <button class=\"w3-button w3-teal w3-padding-large w3-hover-black\">Sign Up</button>\r\n");
      out.write("          </li>\r\n");
      out.write("        </ul>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("  </div>\r\n");
      out.write("  \r\n");
      out.write("  <!-- Contact Section -->\r\n");
      out.write("  <div class=\"w3-container w3-padding-large w3-grey\">\r\n");
      out.write("    <h4 id=\"contact\"><b>Contact Me</b></h4>\r\n");
      out.write("    <div class=\"w3-row-padding w3-center w3-padding-24\" style=\"margin:0 -16px\">\r\n");
      out.write("      <div class=\"w3-third w3-dark-grey\">\r\n");
      out.write("        <p><i class=\"fa fa-envelope w3-xxlarge w3-text-light-grey\"></i></p>\r\n");
      out.write("        <p>email@email.com</p>\r\n");
      out.write("      </div>\r\n");
      out.write("      <div class=\"w3-third w3-teal\">\r\n");
      out.write("        <p><i class=\"fa fa-map-marker w3-xxlarge w3-text-light-grey\"></i></p>\r\n");
      out.write("        <p>Chicago, US</p>\r\n");
      out.write("      </div>\r\n");
      out.write("      <div class=\"w3-third w3-dark-grey\">\r\n");
      out.write("        <p><i class=\"fa fa-phone w3-xxlarge w3-text-light-grey\"></i></p>\r\n");
      out.write("        <p>512312311</p>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <hr class=\"w3-opacity\">\r\n");
      out.write("    <form action=\"/action_page.php\" target=\"_blank\">\r\n");
      out.write("      <div class=\"w3-section\">\r\n");
      out.write("        <label>Name</label>\r\n");
      out.write("        <input class=\"w3-input w3-border\" type=\"text\" name=\"Name\" required>\r\n");
      out.write("      </div>\r\n");
      out.write("      <div class=\"w3-section\">\r\n");
      out.write("        <label>Email</label>\r\n");
      out.write("        <input class=\"w3-input w3-border\" type=\"text\" name=\"Email\" required>\r\n");
      out.write("      </div>\r\n");
      out.write("      <div class=\"w3-section\">\r\n");
      out.write("        <label>Message</label>\r\n");
      out.write("        <input class=\"w3-input w3-border\" type=\"text\" name=\"Message\" required>\r\n");
      out.write("      </div>\r\n");
      out.write("      <button type=\"submit\" class=\"w3-button w3-black w3-margin-bottom\"><i class=\"fa fa-paper-plane w3-margin-right\"></i>Send Message</button>\r\n");
      out.write("    </form>\r\n");
      out.write("  </div>\r\n");
      out.write("\r\n");
      out.write("  <!-- Footer -->\r\n");
      out.write("  <footer class=\"w3-container w3-padding-32 w3-dark-grey\">\r\n");
      out.write("  <div class=\"w3-row-padding\">\r\n");
      out.write("    <div class=\"w3-third\">\r\n");
      out.write("      <h3>FOOTER</h3>\r\n");
      out.write("      <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>\r\n");
      out.write("      <p>Powered by <a href=\"https://www.w3schools.com/w3css/default.asp\" target=\"_blank\">w3.css</a></p>\r\n");
      out.write("    </div>\r\n");
      out.write("  \r\n");
      out.write("    <div class=\"w3-third\">\r\n");
      out.write("      <h3>BLOG POSTS</h3>\r\n");
      out.write("      <ul class=\"w3-ul w3-hoverable\">\r\n");
      out.write("        <li class=\"w3-padding-16\">\r\n");
      out.write("          <img src=\"/w3images/workshop.jpg\" class=\"w3-left w3-margin-right\" style=\"width:50px\">\r\n");
      out.write("          <span class=\"w3-large\">Lorem</span><br>\r\n");
      out.write("          <span>Sed mattis nunc</span>\r\n");
      out.write("        </li>\r\n");
      out.write("        <li class=\"w3-padding-16\">\r\n");
      out.write("          <img src=\"/w3images/gondol.jpg\" class=\"w3-left w3-margin-right\" style=\"width:50px\">\r\n");
      out.write("          <span class=\"w3-large\">Ipsum</span><br>\r\n");
      out.write("          <span>Praes tinci sed</span>\r\n");
      out.write("        </li> \r\n");
      out.write("      </ul>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"w3-third\">\r\n");
      out.write("      <h3>POPULAR TAGS</h3>\r\n");
      out.write("      <p>\r\n");
      out.write("        <span class=\"w3-tag w3-black w3-margin-bottom\">Travel</span> <span class=\"w3-tag w3-grey w3-small w3-margin-bottom\">New York</span> <span class=\"w3-tag w3-grey w3-small w3-margin-bottom\">London</span>\r\n");
      out.write("        <span class=\"w3-tag w3-grey w3-small w3-margin-bottom\">IKEA</span> <span class=\"w3-tag w3-grey w3-small w3-margin-bottom\">NORWAY</span> <span class=\"w3-tag w3-grey w3-small w3-margin-bottom\">DIY</span>\r\n");
      out.write("        <span class=\"w3-tag w3-grey w3-small w3-margin-bottom\">Ideas</span> <span class=\"w3-tag w3-grey w3-small w3-margin-bottom\">Baby</span> <span class=\"w3-tag w3-grey w3-small w3-margin-bottom\">Family</span>\r\n");
      out.write("        <span class=\"w3-tag w3-grey w3-small w3-margin-bottom\">News</span> <span class=\"w3-tag w3-grey w3-small w3-margin-bottom\">Clothing</span> <span class=\"w3-tag w3-grey w3-small w3-margin-bottom\">Shopping</span>\r\n");
      out.write("        <span class=\"w3-tag w3-grey w3-small w3-margin-bottom\">Sports</span> <span class=\"w3-tag w3-grey w3-small w3-margin-bottom\">Games</span>\r\n");
      out.write("      </p>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("  </div>\r\n");
      out.write("  </footer>\r\n");
      out.write("  \r\n");
      out.write("  <div class=\"w3-black w3-center w3-padding-24\">Powered by <a href=\"https://www.w3schools.com/w3css/default.asp\" title=\"W3.CSS\" target=\"_blank\" class=\"w3-hover-opacity\">w3.css</a></div>\r\n");
      out.write("\r\n");
      out.write("<!-- End page content -->\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("// Script to open and close sidebar\r\n");
      out.write("function w3_open() {\r\n");
      out.write("    document.getElementById(\"mySidebar\").style.display = \"block\";\r\n");
      out.write("    document.getElementById(\"myOverlay\").style.display = \"block\";\r\n");
      out.write("}\r\n");
      out.write(" \r\n");
      out.write("function w3_close() {\r\n");
      out.write("    document.getElementById(\"mySidebar\").style.display = \"none\";\r\n");
      out.write("    document.getElementById(\"myOverlay\").style.display = \"none\";\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
