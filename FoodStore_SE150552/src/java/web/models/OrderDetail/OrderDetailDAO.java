/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.OrderDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import web.utils.DBUtils;

/**
 *
 * @author Trần Phú Sơn
 */
public class OrderDetailDAO {
    
    private static final String SAVE_ORDERDETAIL = "INSERT INTO tblOrder(orderID, orderDate, image, price) VALUES(?,?,?,?)";

    public boolean saveOrderDetail(OrderDetailDTO orderDetail) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SAVE_ORDERDETAIL);
                ptm.setString(1, orderDetail.getOrderID());
                ptm.setFloat(2, orderDetail.getPrice());
                ptm.setInt(3, orderDetail.getQuantity());
                ptm.setString(4, orderDetail.getOrderID());
                ptm.setString(5, orderDetail.getProductID());
                int row = ptm.executeUpdate();
                if (row > 0) {
                    check = true;
                }
            }
        } catch (Exception e) {
        }
        return check;
    }
}
