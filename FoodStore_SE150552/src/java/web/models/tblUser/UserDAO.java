/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblUser;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import web.utils.DBUtils;

/**
 *
 * @author Trần Phú Sơn
 */
public class UserDAO {
    
    private static final String LOGIN = "SELECT fullName, roleID, address, birthday, phone, email, status FROM tblUsers WHERE userID=? AND password=?";
    private static final String LOGIN_GOOGLE = "SELECT userID, fullName, roleID FROM tblUsers WHERE email=?";
    private static final String CHECK_DUPLICATE_USERID = "SELECT userID FROM tblUsers WHERE userID=?";
    private static final String CHECK_DUPLICATE_EMAIL = "SELECT email FROM tblUsers WHERE email=?";
    private static final String INSERT = "INSERT INTO tblUsers(userID, fullName, password, roleID, address, birthday, phone, email, status) VALUES(?,?,?,?,?,?,?,?,1)";
    
    public UserDTO checkLogin(String userID, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, userID);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    String address = rs.getString("address");
                    String birthday = rs.getString("birthday");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    boolean status = rs.getBoolean("status");
                    user = new UserDTO(userID, fullName, "", roleID, address, birthday, phone, email, status);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }
    
    public boolean checkDuplicatedUserID(String userID) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE_USERID);
                ptm.setString(1, userID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public boolean insertUser(UserDTO user) throws SQLException, ClassNotFoundException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, user.getUserID());
                ptm.setString(2, user.getFullName());
                ptm.setString(3, user.getPassword());
                ptm.setString(4, user.getRoleID());
                ptm.setString(5, user.getAddress());
                ptm.setString(6, user.getBirthday());
                ptm.setString(7, user.getPhone());
                ptm.setString(8, user.getEmail());
                int row = ptm.executeUpdate();
                if (row > 0) {
                    result = true;
                }
            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

//    public UserDTO checkLoginGoogle(String email) throws SQLException {
//        UserDTO user = null;
//        Connection conn = null;
//        PreparedStatement ptm = null;
//        ResultSet rs = null;
//        try {
//            conn = DBUtils.getConnection();
//            if (conn != null) {
//                String sql = "SELECT userID, password, fullName, email, address, phone, roleID "
//                        + " FROM tblUser "
//                        + " WHERE email=? ";
//                ptm = conn.prepareStatement(sql);
//                ptm.setString(1, email);
//                rs = ptm.executeQuery();
//                if (rs.next()) {
//                    String fullName = rs.getString("fullName");
//                    String userID = rs.getString("userID");
//                    String password = rs.getString("password");
//                    String address = rs.getString("address");
//                    String phone = rs.getString("phone");
//                    String roleID = rs.getString("roleID");
//                    user = new UserDTO(userID, password, fullName, email, address, phone, roleID);
//                }
//            }
//        } catch (Exception e) {
//
//        } finally {
//            if (rs != null) {
//                rs.close();
//            }
//            if (ptm != null) {
//                ptm.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//        return user;
//    }
//    public boolean checkDuplicatedEmail(String email) throws SQLException, ClassNotFoundException {
//        boolean check = false;
//        Connection conn = null;
//        PreparedStatement ptm = null;
//        ResultSet rs = null;
//        try {
//            conn = DBUtils.getConnection();
//            if (conn != null) {
//                String sql = "SELECT email "
//                        + " FROM tblUser "
//                        + " WHERE email=?";
//                ptm = conn.prepareStatement(sql);
//                ptm.setString(1, email);
//                rs = ptm.executeQuery();
//                if (rs.next()) {
//                    check = true;
//                }
//            }
//        } finally {
//            if (rs != null) {
//                rs.close();
//            }
//            if (ptm != null) {
//                ptm.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//        return check;
//    }
}
