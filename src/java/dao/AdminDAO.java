/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import bean.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import util.DBConnection;

/**
 *
 * @author Quach Dinh Kien
 */
public class AdminDAO {
    private Connection conn = (Connection) DBConnection.getConnection();
    public ArrayList<User> getListUser(){
        User user = null;
        ArrayList<User> list = new ArrayList<>();
        try {
            String sql = "Select * from tbl_user";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new User(rs.getString("username"),
                                rs.getString("t_password"),
                                rs.getString("email"),
                                rs.getInt("numStar"),
                                rs.getInt("numLesson"),
                                rs.getString("fullname"),
                                rs.getString("gender")
                );
                list.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
       return list;
    }
}
