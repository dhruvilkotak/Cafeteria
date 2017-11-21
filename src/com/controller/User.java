package com.controller;

import com.admin.Connect_db;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Admin
 */
public class User {

    private String name;
    private String gender;
    private String phone;
    private String emailid;
    private Integer userid;
    private String role;

    public User(Integer userid) {

        try {

            Statement stmt = Connect_db.getConnection().createStatement();
            ResultSet rs = stmt.executeQuery("select * from register where userid ='" + userid + "'");

            while (rs.next()) {
                //out.println(rs.getInt(1) + "  " + rs.getString("first_name") + "  " + rs.getString("last_name") + "  " + rs.getString("email") + "  " + rs.getString("userid") + "  " + rs.getString("password"));
                this.name = rs.getString("firstname");
                this.phone = rs.getString("mobile_number");
                this.emailid = rs.getString("email_id");
                this.userid = rs.getInt("userid");
                this.gender = rs.getString("gender");
                this.role = rs.getString("role");
            }
            //con.close();

        } catch (Exception e) {
            System.out.println(e);
        }

    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmailid() {
        return emailid;
    }

    public void setEmailid(String emailid) {
        this.emailid = emailid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "User{" + "name=" + name + ", gender=" + gender + ", phone=" + phone + ", emailid=" + emailid + ", userid=" + userid + ", role=" + role + '}';
    }
}
