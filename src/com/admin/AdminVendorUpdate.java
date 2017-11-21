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
public class AdminVendorUpdate extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected boolean deleteVendorID(HttpServletRequest request, HttpServletResponse response, Integer vid)
            throws IOException {

        PrintWriter out = response.getWriter();
        try {
            Statement stmt = Connect_db.getConnection().createStatement();
            int rows = stmt.executeUpdate("delete from vendor where vid ='" + vid + "' limit 1");
            //out.println(rows + " rows updated");

            if (rows > 0) {
                HttpSession userSession = request.getSession();
                userSession.setAttribute("successmsg", "Successfully deleted Vendor ID: " + vid + ", " + rows + " rows deleted");
                response.sendRedirect(request.getContextPath() + "/admin/admin-add-delete-vendor.jsp");
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

    protected boolean addVendor(HttpServletRequest request, HttpServletResponse response, String vendor)
            throws IOException {

        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/seproject", "root", "root");

            Statement s = con.createStatement();
            int rows = s.executeUpdate("insert into vendor (name) values ('" + vendor.trim() + "')");
            //out.println(rows + " rows updated");

            if (rows > 0) {
                HttpSession userSession = request.getSession();
                userSession.setAttribute("successmsg", "Successfully Added Vendor: " + vendor + ", " + rows + " rows updated");
                response.sendRedirect(request.getContextPath() + "/admin/admin-add-delete-vendor.jsp");
                con.close();
                return true;
            } else {
                return false;
            }

        } catch (ClassNotFoundException | SQLException | IOException e) {
            out.println(e);
        }
        return false;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action").trim();

        switch (action) {
            case "delete":
                Integer vid = Integer.parseInt(request.getParameter("vid").trim());
                deleteVendorID(request, response, vid);
                break;
            case "add":
                String vendor = request.getParameter("name").trim();
                addVendor(request, response, vendor);
                //System.out.println(vendorName);
                break;

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
        processRequest(request, response);
        
        HttpSession session = request.getSession();
		
		
        if (session.getAttribute("user_id") == null)
        {
        
        		response.sendRedirect(request.getContextPath()+ "/login.jsp");
        		return;
        		
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
