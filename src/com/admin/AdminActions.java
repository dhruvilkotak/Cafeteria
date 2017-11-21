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
import java.sql.Statement;
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
public class AdminActions extends HttpServlet {

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
            out.println("<title>Servlet AdminActions</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminActions at " + request.getContextPath() + "</h1>");
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
        //string.replace('', '');
        PrintWriter out = response.getWriter();

        try {
            //out.println(request.getParameter("name").trim());
            //out.println(request.getParameter("mobile_number").trim());
            //out.println(request.getParameter("email-id").trim());
            //out.println(request.getParameter("userid").trim());
            //out.println(request.getParameter("gender").trim());
            //out.println(request.getParameter("role").trim());

            Statement stmt = Connect_db.getConnection().createStatement();

            String sql = "update register "
                    + "set firstname= '" + request.getParameter("name").trim() + "', "
                    + "`mobile_number`='" + request.getParameter("mobile_number").trim() + "', "
                    + "`email_id`='" + request.getParameter("email-id").trim() + "', "
                    + "gender='" + request.getParameter("gender").trim() + "', "
                    + "role='" + request.getParameter("role").trim() + "' "
                    + "where userid like '" + request.getParameter("userid").trim() + "' limit 1";

            int count = stmt.executeUpdate(sql);
            switch (count) {
                case 1:
                    out.println("case 1: " + count);
                    HttpSession session = request.getSession();
                    session.setAttribute("successmsg", "Successfully updated profile for userid: " + request.getParameter("userid"));
                    request.setAttribute("successmsg", "Successfully updated profile for userid: " + request.getParameter("userid"));

                    String referer = request.getHeader("Referer");

                    if (referer.toLowerCase().contains("my-profile.jsp")) { //redirect to food menu
                        //response.sendRedirect(request.getContextPath() + "/controller?actionCode=doGetListofItems");
                        RequestDispatcher rd = getServletContext().getRequestDispatcher("/controller?actionCode=doGetListofItems");
                        rd.forward(request, response);
                    } else {
                        response.sendRedirect(request.getContextPath() + "/admin/people.jsp#user-list"); //else assuming form was submitted from admin page
                        //RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/people.jsp#user-list");
                        //rd.forward(request, response);
                    }
                    break;
                default:
                    out.println("Error case 0");
                    break;
            }

        } catch (Exception e) {
            System.err.println(e);
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

}
