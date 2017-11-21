package com.doa;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.ListOfOrders;

public class listdao {

    public List<ListOfOrders> list() throws SQLException {

        List<ListOfOrders> materiallist = new ArrayList<ListOfOrders>();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/seproject", "root", "root");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from order1,menu where order1.item_id=menu.item_id order by order1.orderid  ASC ");

            /*ResultSet rs = st.executeQuery("SELECT * FROM seproject.order1;");
             */
            while (rs.next()) {

                ListOfOrders rf1 = new ListOfOrders();
                /*
                 String userid;
                 int itemId;
                 int itemquantity;
                 int orderid;
                 String status;
                 String itemName;
                 String itemCategory;
                 String itemDescription;
                 String itemPrice;
                 int locationId;
                 */
                rf1.setUserid(rs.getString("userid"));
                rf1.setItemId(rs.getInt("item_id"));
                rf1.setItemquantity(rs.getInt("qty"));
                rf1.setOrderid(rs.getInt("orderid"));
                rf1.setStatus(rs.getString("status"));
                rf1.setItemName(rs.getString("item_name"));
                rf1.setItemCategory(rs.getString("item_category"));
                rf1.setItemDescription(rs.getString("item_description"));
                rf1.setItemPrice(rs.getString("item_price"));
                rf1.setLocationId(rs.getInt("Sr_no"));
                materiallist.add(rf1);
            }

            st.close();
            con.close();

            //System.out.println("material:" + materiallist);

        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return materiallist;

    }

}
