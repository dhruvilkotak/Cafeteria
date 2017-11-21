package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RegServlet
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 
 	try {
 		String fname=request.getParameter("fnm");
                String mobile=request.getParameter("mobile");
                String email=request.getParameter("emailid");
                String uid=request.getParameter("userid");
                String passwd=request.getParameter("pswd");
                String cpassword=request.getParameter("cpass");
                String gender=request.getParameter("gender");
                String lname=request.getParameter("lnm");
       
                PrintWriter out=response.getWriter();
        
       		 Integer a=Integer.parseInt(uid);
       		HttpSession userSession = request.getSession();
	
         Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/seproject","root","root");
		
		    String insert="insert into register values"+"(?,?,?,?,?,?,?,?)";
		    PreparedStatement pstm=connection.prepareStatement(insert);
		      pstm.setString(1,fname );
		      pstm.setString(2,mobile);
                      pstm.setString(3,email);
                      pstm.setInt(4,a);
                      pstm.setString(5,passwd);
                      pstm.setString(6,gender);
		      pstm.setString(7, "user");
                      pstm.setString(8,lname );
		      pstm.executeUpdate();
		      
		                  userSession.setAttribute("fname", fname); 
		                   userSession.setAttribute("lname", lname);
		                    userSession.setAttribute("em", email);
		                    userSession.setAttribute("phone", mobile);
		        
		      /*inserting in login*/
		      
		      String insert1="insert into login values"+"(?,?)";
		      PreparedStatement pstm2=connection.prepareStatement(insert1);
		      pstm2.setInt(1, a);
		      pstm2.setString(2,passwd);
		      pstm2.executeUpdate();
		      
		      
		      request.setAttribute("msg", "You are successfully registered");
				request.getRequestDispatcher("login.jsp").forward(request, response);
		        
		} catch (Exception e) {
			// TODO Auto-generated catch block
                        System.err.print(e);
			 request.setAttribute("error", "Invalid credentials");
			request.getRequestDispatcher("register.jsp").forward(request, response);
			
		}  
		 }
         
	
		
	

}
