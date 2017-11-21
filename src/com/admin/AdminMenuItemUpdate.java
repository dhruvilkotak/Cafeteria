package com.admin;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
public class AdminMenuItemUpdate extends HttpServlet {

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
        doPost(request, response);
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

        String action = request.getParameter("action").trim();

        switch (action) {
            case "edit":
                Integer item_id = Integer.parseInt(request.getParameter("item_id").trim());
                updateMenuItemID(request, response, item_id);
                break;
            case "delete":
                item_id = Integer.parseInt(request.getParameter("item_id").trim());
                deleteMenuItemID(request, response, item_id);
                break;
        }

    }

    protected boolean updateMenuItemID(HttpServletRequest request, HttpServletResponse response, Integer item_id)
            throws IOException {

        PrintWriter out = response.getWriter();

        out.println(request.getParameter("item_id").trim());
        out.println(request.getParameter("item_name").trim());
        out.println(request.getParameter("item_category").trim());
        out.println(request.getParameter("item_description").trim());
        out.println(request.getParameter("item_price").trim());

        try {
            Statement stmt = Connect_db.getConnection().createStatement();
            String sql = "update menu "
                    + "set item_id = '" + request.getParameter("item_id").trim() + "',"
                    + "item_name='" + request.getParameter("item_name").trim() + "', "
                    + "item_category='" + request.getParameter("item_category").trim() + "', "
                    + "item_description='" + request.getParameter("item_description").trim() + "', "
                    + "item_price='" + request.getParameter("item_price").trim() + "' "
                    + "where item_id like '" + request.getParameter("item_id").trim() + "'";

            int count = stmt.executeUpdate(sql);
            if (count > 0) {
                HttpSession session = request.getSession();
                session.setAttribute("successmsg", "Successfully updated profile for item_id: " + request.getParameter("item_id") + ", item_name: " + request.getParameter("item_name"));
                request.setAttribute("successmsg", "Successfully updated profile for userid: " + request.getParameter("item_id"));
                response.sendRedirect(request.getContextPath() + "/admin/admin-maintain-menus.jsp");
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            out.println(e);
        }
        return false;
    }

    protected boolean deleteMenuItemID(HttpServletRequest request, HttpServletResponse response, Integer item_id)
            throws IOException {

        PrintWriter out = response.getWriter();
        try {
            Statement stmt = Connect_db.getConnection().createStatement();
            int rows = stmt.executeUpdate("delete from menu where item_id ='" + item_id + "' limit 1");
            //out.println(rows + " rows updated");

            if (rows > 0) {
                HttpSession userSession = request.getSession();
                userSession.setAttribute("successmsg", "Successfully deleted Vendor ID: " + item_id + ", " + rows + " rows deleted");
                response.sendRedirect(request.getContextPath() + "/admin/admin-maintain-menus.jsp");
                //con.close();
                return true;
            } else {
                return false;
            }

        } catch (SQLException | IOException e) {
            out.println(e);
        }
        return false;
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
