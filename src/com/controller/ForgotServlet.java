package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.*;

@WebServlet("/ForgotServlet")
public class ForgotServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username=request.getParameter("username");
		String email=request.getParameter("email");
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
	
	
try
		
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/seproject","root","root");
			String q="select email_id, mobile_number from seproject.register where userid=?"; //Correct field name for email
			PreparedStatement ps=conn.prepareStatement(q);
			ps.setString(1, username);
			
			ResultSet rs=ps.executeQuery();
			if(rs.next() && rs.getString(1).equals(email))
			{	
			String mobile_number = rs.getString("mobile_number").toString().substring(3, 7);
			PwdResetEmail p = new PwdResetEmail(email,mobile_number);
			HttpSession session=request.getSession();
	        session.setAttribute("username",username);
				out.println("<a href=resetpassword.jsp>reset password</a>");
			}
		else
                        {
                            out.println("Please enter the correct Username and E-Mail :)");
                        }
	}
catch(Exception e)
{
	e.printStackTrace();
	}

	
}
}