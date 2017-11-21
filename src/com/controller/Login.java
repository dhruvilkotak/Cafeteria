package com.controller;

import com.admin.Connect_db;
import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login")
public class Login extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String uid = request.getParameter("uid").trim();
        String pass = request.getParameter("passwd").trim();

        String pswd = null;
        String fname = null;
        String lname = null;
        String userRole = null;
        String mobile=null;
        String email=null;
       
        PrintWriter out = response.getWriter();

        HttpSession userSession = null;

        try {
            Integer a = Integer.parseInt(uid);
            Statement stmt = Connect_db.getConnection().createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * from register where userid=" + a + "");

            if (rs.next()) {
                pswd = rs.getString("password");
                fname=rs.getString("firstname");
                lname=rs.getString("lastname");
                mobile=rs.getString("mobile_number");
                email=rs.getString("email_id");
            }

            userRole = getUserRole(a); //get user role from database

            if (pass.equals(pswd)) {
            	
                userSession = request.getSession();
                userSession.setAttribute("user_id", a);
                userSession.setAttribute("fname", fname); 
                userSession.setAttribute("lname", lname);
                userSession.setAttribute("em", email);
                userSession.setAttribute("phone", mobile);
                switch (userRole) { //check user role and redirect
                    case "user":
                        response.sendRedirect(request.getContextPath() + "/controller?actionCode=doGetListofItems");

                        break;
                    case "admin":
                        response.sendRedirect(request.getContextPath() + "/admin-home.jsp");
                        break;
                    case "vendor":
                        response.sendRedirect(request.getContextPath() + "/vendor-home.jsp");
                        break;
                    default:
                        request.setAttribute("errormsg", "Invalid Credentials");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                        break;
                }
            } else {
                request.setAttribute("errormsg", "Invalid Credentials");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            out.println("SQLException: " + e.getMessage());
        } catch (Exception e) {
            request.setAttribute("errormsg", "Invalid Credentials");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    public String getUserRole(Integer a) {

        String userRole = "";

        try { // check if userid and pwd combination exist in db
            Statement stmt = Connect_db.getConnection().createStatement();
            ResultSet rs = stmt.executeQuery("select role from register where userid='" + a + "'");

            while (rs.next()) {
                //System.out.println(rs.getString("role"));
                return userRole = rs.getString("role");
            }
            rs.close();
            //con.close();
        } catch (Exception e) {
            System.err.println(e);
        }
        return "Null";
    }
}