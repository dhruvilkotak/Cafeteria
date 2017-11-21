package com.doa;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.Cafeteria_retrive;
import com.model.Cafeterianame;

public class cafe {

    public void insert(Cafeterianame reg) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/seproject", "root", "root");
            Statement st = con.createStatement();
            st.executeUpdate("insert into cafeteria_details(CafetariaName,cafeteria_location) values('" + reg.getCafeName() + "','" + reg.getCafeLocation() + "')");
            st.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void deleteUser(int Sr_no) {
        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/seproject", "root", "root");
            PreparedStatement preparedStatement = con.prepareStatement("delete from cafeteria_details where Sr_no=?");
            // Parameters start with 1
            preparedStatement.setInt(1, Sr_no);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public List<Cafeteria_retrive> getMaterialFileList(Cafeteria_retrive rf) {
        // Course course = new Course();
        List<Cafeteria_retrive> materiallist = new ArrayList<Cafeteria_retrive>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/seproject", "root", "root");
            Statement stmt1 = con.createStatement();

            ResultSet rs = stmt1.executeQuery("select * from cafeteria_details");

            while (rs.next()) {

                Cafeteria_retrive rf1 = new Cafeteria_retrive();
                rf1.setSr_no(rs.getInt("Sr_no"));
                rf1.setCafeName(rs.getString("CafetariaName"));
                rf1.setCafeLocation(rs.getString("cafeteria_location"));
                materiallist.add(rf1);

            }

            stmt1.close();
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        return materiallist;

    }

    public static Cafeteria_retrive getMaterial(int materialid) throws ClassNotFoundException, SQLException {
        Cafeteria_retrive coursematerial = new Cafeteria_retrive();
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/seproject", "root", "root");
        Statement st = con.createStatement();
        System.out.println(materialid);
        ResultSet rs = st.executeQuery("select * from cafeteria_details where Sr_no ='" + materialid + "'");

        rs.next();

        coursematerial.setSr_no(rs.getInt("Sr_no"));
        coursematerial.setCafeName(rs.getString("CafetariaName"));
        coursematerial.setCafeLocation(rs.getString("cafeteria_location"));

        st.close();
        con.close();
        return coursematerial;

    }

}
