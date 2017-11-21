package com.doa;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ResetPasswordDAO {

	public boolean updatePassword(String username,String password,String cpassword)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/seproject","root","root");
			
			
			
			
				 if(password.equals(cpassword))
			 {	
				String q="update seproject.login set password=? where userid=?";
				 PreparedStatement stmt=conn.prepareStatement(q);
				 stmt.setString(2, username);
				 stmt.setString(1, password);
				 
				 String q1="update seproject.register set password=? where userid=?";
				 PreparedStatement stmt1=conn.prepareStatement(q1);
				 stmt1.setString(2, username);
				 stmt1.setString(1, password);
				 
				 stmt.executeUpdate();
				 stmt1.executeUpdate();
				 System.out.println("updated");
				 
				 return true;
				 
			 }
			
			
			else
				return false;
			
		} catch (Exception e) {
			
			e.printStackTrace();
			return false;
		}
		
		
	}
	
	
}