package com.controller;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.doa.ResetPasswordDAO;


@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String security_code = request.getParameter("security");
		//check with database
		
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn;
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/seproject","root","root");
			String q="select mobile_number from seproject.register where userid=?";
			HttpSession session=request.getSession();
	        String username = session.getAttribute("username").toString(); 
			PreparedStatement ps=conn.prepareStatement(q);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			String message="";
		if(rs.next() && security_code.equals(rs.getString("mobile_number").toString().substring(3,7)))
		{
		PrintWriter out=response.getWriter();
		String password=request.getParameter("password");
		String cpassword=request.getParameter("cpassword");
		ResetPasswordDAO rp=new ResetPasswordDAO();
		boolean flag=rp.updatePassword(username, password, cpassword);
		
		if(flag)
		{
			RequestDispatcher rd;
			response.setContentType("text/html");
			out.println("password has been reset");
			message="password has been reset";
			request.setAttribute("message", message);
			rd=request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
			username=null;
			
		}
		
		else
		{
			RequestDispatcher rd;
			response.setContentType("text/html");
			out.println("username or passwords dont match");
			message="username or passwords dont match";
			request.setAttribute("message", message);
			rd=request.getRequestDispatcher("resetpassword.jsp");
			
			rd.forward(request, response);
			
		}
		}
		else
		{
			RequestDispatcher rd;
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			out.println("Invalid security code");
			message="Invalid security code";
			request.setAttribute("message", message);
			rd=request.getRequestDispatcher("resetpassword.jsp");
			
			rd.forward(request, response);
			
		}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		
		
	}

	
	

}