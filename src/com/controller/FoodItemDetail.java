package com.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import com.doa.FoodItem;
import com.doa.cafe;
import com.model.AddFoodItem;
import com.model.Cafeteria_retrive;
import com.model.Cafeterianame;

/**
 * Servlet implementation class cafeterialdetail
 */
public class FoodItemDetail extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FoodItemDetail() {
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


        if (session.getAttribute("user_id") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp?sessionFail=1");

        }
        String action;
        if (ServletFileUpload.isMultipartContent(request)) {
            action = "addtotable";
        } else {
            action = request.getParameter("action1");
        }

        System.out.println("action:" + action);
        if (action.equals("addtotable")) {

            List<FileItem> items;
            try {
                items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                AddFoodItem reg = new AddFoodItem();

                for (FileItem item : items) {
                    if (item.isFormField()) {
                        // Process normal fields here.
                        if (item.getFieldName().equals("ItemDescription")) {
                            reg.setItemDescription(item.getString());

                        }
                        if (item.getFieldName().equals("FoodItemName")) {
                            reg.setFoodItemName(item.getString());
                        }
                        if (item.getFieldName().equals("ItemCategory")) {
                            reg.setItemCategory(item.getString());
                        }
                        if (item.getFieldName().equals("ItemId")) {
                            reg.setItemId(Integer.parseInt(item.getString()));
                        }
                        if (item.getFieldName().equals("ItemPrice")) {
                            reg.setItemPrice(item.getString());
                        }
                        if (item.getFieldName().equals("srNo")) {
                            reg.setSrNo(Integer.parseInt(item.getString()));
                        }
                        System.out.println("fieldname:" + item.getFieldName());
                        System.out.println("value:" + item.getString());
                    } else {
                        // Process <input type="file"> here.
                        InputStream fileContent = item.getInputStream();

                        byte[] contents = IOUtils.toByteArray(fileContent);
                        Blob blob = null;
                        try {
                            blob = new SerialBlob(contents);
                        } catch (SerialException e) {
                            e.printStackTrace();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }

                        reg.setItemImage(blob);
                        System.out.println("len:" + blob.length() + "  name:" + item.getFieldName());
                    }

                }
                System.out.println(reg);
                //reg.setItemImage(ItemImage);
                FoodItem dao = new FoodItem();
                dao.insert(reg);

                List<AddFoodItem> materiallist = new ArrayList<AddFoodItem>();
                AddFoodItem rf = new AddFoodItem();
                FoodItem dao1 = new FoodItem();
                materiallist = dao1.getMaterialFileList(rf);
                request.setAttribute("materiallist", materiallist);
							//RequestDispatcher dispatcher = request.getRequestDispatcher("Addfooditem.jsp");
                //dispatcher.forward(request, response);
                //HttpSession userSession = request.getSession();
                session.setAttribute("successmsg", "Successfully added new Menu item");
                response.sendRedirect(request.getContextPath() + "/admin/admin-maintain-menus.jsp");

            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

            /*
             String FoodItemName=request.getParameter("FoodItemName");
             String ItemCategory=request.getParameter("ItemCategory");
             String ItemDescription=request.getParameter("ItemDescription");
             String ItemPrice=request.getParameter("ItemPrice");
             String ItemImage=request.getParameter("ItemImage");
		
             AddFoodItem reg=new AddFoodItem();
             reg.setFoodItemName(FoodItemName);
             reg.setItemCategory(ItemCategory);
             reg.setItemDescription(ItemDescription);
             reg.setItemPrice(ItemPrice);
             reg.setItemId(Integer.parseInt(request.getParameter("ItemId")));*/
        }

        if (action.equals("viewtable")) {

            List<AddFoodItem> materiallist = new ArrayList<AddFoodItem>();
            AddFoodItem rf = new AddFoodItem();
            FoodItem dao1 = new FoodItem();
            materiallist = dao1.getMaterialFileList(rf);
            request.setAttribute("materiallist", materiallist);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Addfooditem.jsp");
            dispatcher.forward(request, response);
        }

        if (action.equals("deltableentry")) {
            System.out.println("ItemId:" + request.getParameter("ItemId"));
            if (!request.getParameter("ItemId").equals("")) {
                int userId = Integer.parseInt(request.getParameter("ItemId"));
                FoodItem dao = new FoodItem();
                dao.deleteUser(userId);

                List<AddFoodItem> materiallist = new ArrayList<AddFoodItem>();
                AddFoodItem rf = new AddFoodItem();
                FoodItem dao1 = new FoodItem();
                materiallist = dao1.getMaterialFileList(rf);
                request.setAttribute("materiallist", materiallist);
                RequestDispatcher dispatcher = request.getRequestDispatcher("Addfooditem.jsp");
                dispatcher.forward(request, response);
            }

        }

    }

}
