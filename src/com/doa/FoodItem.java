package com.doa;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.AddFoodItem;
import com.model.Cafeteria_retrive;
import com.model.Cafeterianame;

public class FoodItem {

    private Integer item_id;
    private String item_name;
    private String item_category;
    private String item_description;
    private String item_price;

    public FoodItem() {
    }

    public FoodItem(Integer item_id) {

        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/seproject", "root", "root");

            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from menu where item_id ='" + item_id + "'");

            while (rs.next()) {
                //out.println(rs.getInt(1) + "  " + rs.getString("first_name") + "  " + rs.getString("last_name") + "  " + rs.getString("email") + "  " + rs.getString("userid") + "  " + rs.getString("password"));
                this.item_id = rs.getInt("item_id");
                this.item_name = rs.getString("item_name");
                this.item_category = rs.getString("item_category");
                this.item_description = rs.getString("item_description");
                this.item_price = rs.getString("item_price");
            }
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }

    }

    public void insert(AddFoodItem reg) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/seproject", "root", "root");
            String sql = "insert into menu(item_id,item_name,item_category,item_description,item_price,item_image,Sr_no) values (?, ?, ?, ?, ?, ?,?)";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, reg.getItemId());
            statement.setString(2, reg.getFoodItemName());
            statement.setString(3, reg.getItemCategory());
            statement.setString(4, reg.getItemDescription());
            statement.setString(5, reg.getItemPrice());
            statement.setBlob(6, reg.getItemImage());
            statement.setInt(7, reg.getSrNo());
            int row = statement.executeUpdate();

            statement.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void deleteUser(int Sr_no) {
        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/seproject", "root", "root");
            PreparedStatement preparedStatement = con.prepareStatement("delete from menu where item_id=?");
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

    public List<AddFoodItem> getMaterialFileList(AddFoodItem rf) {
        // Course course = new Course();
        List<AddFoodItem> materiallist = new ArrayList<AddFoodItem>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/seproject", "root", "root");
            Statement stmt1 = con.createStatement();

            ResultSet rs = stmt1.executeQuery("select * from menu");

            while (rs.next()) {

                AddFoodItem rf1 = new AddFoodItem();
                rf1.setItemId(rs.getInt("item_id"));
                rf1.setFoodItemName(rs.getString("item_name"));
                rf1.setItemCategory(rs.getString("item_category"));
                rf1.setItemDescription(rs.getString("item_description"));
                rf1.setItemPrice(rs.getString("item_price"));
                //rf1.setItemImage(rs.getString("ItemImage"));
                materiallist.add(rf1);

            }

            stmt1.close();
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        return materiallist;

    }

    public static AddFoodItem getMaterial(int materialid) throws ClassNotFoundException, SQLException {
        AddFoodItem coursematerial = new AddFoodItem();
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/seproject", "root", "root");
        Statement st = con.createStatement();
        System.out.println(materialid);
        ResultSet rs = st.executeQuery("select * from menu where item_id='" + materialid + "'");

        rs.next();

        coursematerial.setItemId(rs.getInt("ItemId"));
        coursematerial.setFoodItemName(rs.getString("FoodItemName"));
        coursematerial.setItemCategory(rs.getString("ItemCategory"));
        coursematerial.setItemDescription(rs.getString("ItemDescription"));
        coursematerial.setItemPrice(rs.getString("ItemPrice"));
        //coursematerial.setItemImage(rs.getString("ItemImage"));

        st.close();
        con.close();
        return coursematerial;

    }

    public Integer getItem_id() {
        return item_id;
    }

    public String getItem_name() {
        return item_name;
    }

    public String getItem_category() {
        return item_category;
    }

    public String getItem_description() {
        return item_description;
    }

    public String getItem_price() {
        return item_price;
    }
}
