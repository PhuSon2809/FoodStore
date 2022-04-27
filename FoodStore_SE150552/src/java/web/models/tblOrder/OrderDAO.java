/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblOrder;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import web.utils.DBUtils;

/**
 *
 * @author Trần Phú Sơn
 */
public class OrderDAO {
    
    private static final String ADD = "INSERT INTO tblOrder(orderID, orderDate, total, userID, status) VALUES(?,?,?,?,1)";
    
    public boolean addOrder(OrderDTO order) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADD);
                ptm.setString(1, order.getOrderID());
                ptm.setString(2, order.getOrderDate());
                ptm.setFloat(3, order.getTotal());
                ptm.setString(4, order.getUserID());
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}
