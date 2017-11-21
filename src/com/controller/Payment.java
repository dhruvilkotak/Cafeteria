package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.Connect_db;

/**
 * Servlet implementation class Payment
 */
@WebServlet("/Payment")
public class Payment extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Payment() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

        String name = request.getParameter("name");
        String card = request.getParameter("card");
        String cvv = request.getParameter("cvv");
        String month = request.getParameter("mm");
        String year = request.getParameter("yy");
        PrintWriter out = response.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        Connection connection = null;
        try {
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/seproject", "root", "root");
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        String insert = "insert into payment values" + "(?,?,?,?,?)";
        PreparedStatement pstm;
        try {
            pstm = connection.prepareStatement(insert);

            pstm.setString(1, name);
            pstm.setString(2, card);
            pstm.setString(3, cvv);
            pstm.setString(4, month);
            pstm.setString(5, year);
            pstm.executeUpdate();
            pstm.close();
            connection.close();
            int userid = (int) request.getSession().getAttribute("user_id");
            String fetch = "select * from register where userid=" + userid + ";";

            try { // check if userid and pwd combination exist in db
                Statement stmt = Connect_db.getConnection().createStatement();
                ResultSet rs = stmt.executeQuery(fetch);

                while (rs.next()) {
                    //System.out.println(rs.getString("role"));
                    String firstname = rs.getString("firstname");
                    String lastname = rs.getString("lastname");
                    String email = rs.getString("email_id");
                    String phn = rs.getString("mobile_number");
                    request.setAttribute("fname", firstname);
                    request.setAttribute("lname", lastname);
                    request.setAttribute("em", email);
                    request.setAttribute("phone", phn);

                    out.println("before final page");
                    request.getRequestDispatcher("finalpage.jsp").forward(request, response);
                }
                rs.close();
                //con.close();
            } catch (Exception e) {
                System.err.println(e);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}
