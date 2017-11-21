package com.controller;

import com.admin.Connect_db;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class AdminCreatesUser extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException {

        response.setContentType("text/html;charset=UTF-8");

        String name = request.getParameter("name").trim();
        String phone = request.getParameter("phone").trim();
        String email = request.getParameter("email").trim();
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String gender = request.getParameter("gender").trim();
        String role = "user";

        boolean uid = validateUserid(username, response);
        boolean pwd = validatePassword(password);

        HttpSession userSession = null;

        		        
        if (uid && pwd) {

            try (PrintWriter out = response.getWriter()) { //save info in db

                Statement stmt = Connect_db.getConnection().createStatement();
                stmt.executeUpdate("insert into register (`firstname`, `mobile_number`, `email_id`, userid, `password`, gender, role) VALUE ('" + name + "','" + phone + "','" + email + "','" + username + "','" + password + "','" + gender + "','" + role + "')");
                stmt.executeUpdate("insert into login (userid, `password`) values ('" + username + "','" + password + "')"); //insert into login table again ?? check this

                //con.close();
                //redirect user to people.jsp
                userSession = request.getSession();
                userSession.setAttribute("successmsg", "Successfully registered userid: ");
                userSession.removeAttribute("errormsg");
                response.sendRedirect(request.getContextPath() + "/admin/people.jsp");
                return;
            }
        } else if (!uid) {
            //redirect user to people.jsp and set errormsg
            userSession = request.getSession();
            userSession.setAttribute("errormsg", "Userid already exist. Cannot create duplicate");
            userSession.removeAttribute("successmsg");
            response.sendRedirect(request.getContextPath() + "/admin/people.jsp");
            return;
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
        //processRequest(request, response);
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AdminCreatesUser.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AdminCreatesUser.class.getName()).log(Level.SEVERE, null, ex);
        }
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

    public boolean validateUserid(String userid, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        //if (userid.matches("[0-9]+")) { //if userid is numeric
        try { // check if there is an existing user
            Statement stmt = Connect_db.getConnection().createStatement();
            ResultSet rs = stmt.executeQuery("select * from register where userid like '" + userid.trim() + "'");

            rs.last();
            int reccount = (int) rs.getRow();
            //con.close();

            if (reccount < 1) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            out.println(e);
        }
        //}
        return false;
    }

    public boolean validatePassword(String password) {
        if (password.matches("[a-zA-Z]+")) { //if password is an alphabetic string
            //if (Objects.equals("test", password)) { //if password equals "test"
            return true;
            //}
        }
        return false;
    }

}
