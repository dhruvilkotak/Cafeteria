/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class Connect_db {

    static Connection con = null;

    public static Connection getConnection() {
        String db = "seproject";
        String user = "root";
        String pass = "root";

        if (con != null) {
            return con;
        }
        // get db, user, pass from settings file
        return getConnection(db, user, pass);
    }

    private static Connection getConnection(String db_name, String user_name, String password) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/" + db_name + "?user=" + user_name + "&password=" + password);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}
