/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class AdminDeleteUser extends HttpServlet {

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
            out.println("<title>Servlet AdminDeleteUser</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminDeleteUser at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);

        PrintWriter out = response.getWriter();
        String action = request.getParameter("action").trim();
        String userid = request.getParameter("userid").trim();

        switch (action) {
            case "delete":
                try {

                    Statement stmt = Connect_db.getConnection().createStatement();

                    String du = "delete from register where userid like '"
                            + userid
                            + "' limit 1";

                    String du2 = "delete from login where userid like '"
                            + userid
                            + "' limit 1";

                    int c1 = stmt.executeUpdate(du);
                    int c2 = stmt.executeUpdate(du2);

                    if ((c1 > 0) || (c2 > 0)) {
                        HttpSession userSession = null;
                        //redirect user to people.jsp
                        userSession = request.getSession();
                        userSession.setAttribute("successmsg", "Successfully deleted profile for userid: " + request.getParameter("userid"));
                        userSession.removeAttribute("errormsg");
                        response.sendRedirect(request.getContextPath() + "/admin/people.jsp#user-list");
                    }
                } catch (SQLException | IOException e) {
                    out.println(e);
                }

                break;
        }
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
        //processRequest(request, response);

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
