package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Random;
import java.util.Date;

import com.admin.Connect_db;
import com.model.CartItemList;
import com.service.EmailSend;

import java.util.ArrayList;

/**
 * Servlet implementation class Order
 */
@WebServlet("/Order")
public class Order extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession userSession = request.getSession();
        String Email = request.getParameter("mail");
        String time = request.getParameter("pickup");
        //values for order table
        Integer id = (Integer) userSession.getAttribute("user_id");
        Integer item_id = 0;
        Integer qty = 0;
        Integer order_id = 0;
        Integer user_id = (Integer) userSession.getAttribute("user_id");
        ArrayList<CartItemList> citems = new ArrayList<>();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String sqlQuery = "jdbc:mysql://localhost:3306/seproject?allowMultiQueries=true";

            Connection conn = DriverManager.getConnection(sqlQuery, "root", "root");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * from cart where userid=" + id + "");

            while (rs.next()) {
                CartItemList c = new CartItemList();
                c.setId(rs.getInt("id"));
                c.setItemId(rs.getInt("item_id"));
                c.setQty(rs.getString("qty"));
                citems.add(c);
            }
            System.out.println(citems.toString());

            Integer orderid = getMaxOrderIdPlusOne(); //get max order id for insert

            for (CartItemList o : citems) {
                String insert = "insert into order1 values" + "(?,?,?,?,?)";
                PreparedStatement pstm = conn.prepareStatement(insert);
                pstm.setInt(1, user_id);
                pstm.setInt(2, o.getItemId());
                pstm.setString(3, o.getQty());
                pstm.setInt(4, orderid);
                pstm.setString(5, "pending");
                pstm.executeUpdate();
            }

            PreparedStatement pstm = conn.prepareStatement("delete from cart where userid =" + user_id);
            pstm.executeUpdate();
           
            System.out.println("SUccessfully updated");

            conn.close();
            EmailSend email = new EmailSend(Email,time);
            request.getRequestDispatcher("thanks.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Integer getMaxOrderIdPlusOne() {
        Integer order_id = 0;
        try {
            //get max(orderid)+1 from db to be used later
            Statement s = Connect_db.getConnection().createStatement();
            ResultSet rs2 = s.executeQuery("select ifnull(max(orderid),0)+1 as orderid from order1");

            if (rs2.next()) {
                order_id = rs2.getInt("orderid");
            }
        } catch (Exception e) {
            System.err.println("Error: " + e);
        }
        return order_id;
    }

}