package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.doa.listdao;
import com.model.ListOfOrders;

/**
 * Servlet implementation class list
 */
@WebServlet("/list")
public class list extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public list() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doPost(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        listdao Listdao = new listdao();
        List<ListOfOrders> list = null;
        try {
            list = Listdao.list();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        System.out.println("list:" + list);
        request.setAttribute("listOrder", list);
        //RequestDispatcher rd = request.getRequestDispatcher("/list_of_order.jsp");
        //RequestDispatcher rd = request.getRequestDispatcher("admin/view-list-of-orders.jsp");
        //rd.forward(request, response);
        getServletContext().getRequestDispatcher("/admin/view-list-of-orders.jsp").forward(request, response);
    }

}
