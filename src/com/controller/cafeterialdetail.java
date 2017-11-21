package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import com.doa.cafe;
import com.model.Cafeteria_retrive;
import com.model.Cafeterianame;

/**
 * Servlet implementation class cafeterialdetail
 */
public class cafeterialdetail extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public cafeterialdetail() {
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

        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        if (session.getAttribute("user_id") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp?sessionFail=1");

        }

        if (action.equals("addtotable")) {

            String Cafeterianame = request.getParameter("Cafeterianame");
            String Cafeterialocation = request.getParameter("Cafeterialocation");
            if (!Cafeterianame.equals("") && !Cafeterialocation.equals("")) {
                Cafeterianame reg = new Cafeterianame();
                reg.setCafeName(Cafeterianame);
                reg.setCafeLocation(Cafeterialocation);
                cafe dao = new cafe();
                dao.insert(reg);

                List<Cafeteria_retrive> materiallist = new ArrayList<Cafeteria_retrive>();
                Cafeteria_retrive rf = new Cafeteria_retrive();
                cafe dao1 = new cafe();
                materiallist = dao1.getMaterialFileList(rf);
                request.setAttribute("materiallist", materiallist);
                //RequestDispatcher dispatcher = request.getRequestDispatcher("SearchCafeteria.jsp");
                response.sendRedirect(request.getContextPath() + "/admin/admin-cafeteria-update.jsp");
                //dispatcher.forward(request, response);
            } else {

                List<Cafeteria_retrive> materiallist = new ArrayList<Cafeteria_retrive>();
                Cafeteria_retrive rf = new Cafeteria_retrive();
                cafe dao1 = new cafe();
                materiallist = dao1.getMaterialFileList(rf);
                request.setAttribute("materiallist", materiallist);
                request.setAttribute("errorMessage1", "Please do not leave blank any field");
                RequestDispatcher dispatcher = request.getRequestDispatcher("SearchCafeteria.jsp");
                dispatcher.forward(request, response);

            }
        }

        if (action.equals("viewtable")) {

            List<Cafeteria_retrive> materiallist = new ArrayList<Cafeteria_retrive>();
            Cafeteria_retrive rf = new Cafeteria_retrive();
            cafe dao1 = new cafe();
            materiallist = dao1.getMaterialFileList(rf);
            request.setAttribute("materiallist", materiallist);
            RequestDispatcher dispatcher = request.getRequestDispatcher("SearchCafeteria.jsp");
            dispatcher.forward(request, response);
        }

        if (action.equals("deltableentry")) {
            System.out.println("srno:" + request.getParameter("srno"));
            if (!request.getParameter("srno").equals("")) {
                int userId = Integer.parseInt(request.getParameter("srno"));
                cafe dao = new cafe();
                dao.deleteUser(userId);

                List<Cafeteria_retrive> materiallist = new ArrayList<Cafeteria_retrive>();
                Cafeteria_retrive rf = new Cafeteria_retrive();
                cafe dao1 = new cafe();
                materiallist = dao1.getMaterialFileList(rf);
                request.setAttribute("materiallist", materiallist);
                //RequestDispatcher dispatcher = request.getRequestDispatcher("SearchCafeteria.jsp");
                response.sendRedirect(request.getContextPath() + "/admin/admin-cafeteria-update.jsp");
                //dispatcher.forward(request, response);
            }

        }

    }

}
