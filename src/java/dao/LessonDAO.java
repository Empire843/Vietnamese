/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.Lesson;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.DBConnection;

/**
 *
 * @author Pan
 */
public class LessonDAO {

    private Connection conn = (Connection) DBConnection.getConnection();

    public boolean addLesson(Lesson lesson) {
        boolean flag = false; 
        try {
            String query = "INSERT INTO tbl_lesson (writeCa, writeNo, printCa, printNo, sound, name) VALUES (?,?,?,?,?,?)";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setString(1, lesson.getWriteCa());
            pt.setString(2, lesson.getWriteNo());
            pt.setString(3, lesson.getPrintCa());
            pt.setString(4, lesson.getPrintNo());
            pt.setString(5, lesson.getSound());
            pt.setString(6, lesson.getLessonName());
            pt.execute();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    public ArrayList<Lesson> getListLesson(){
        Lesson lesson = null;
        ArrayList<Lesson> list = new ArrayList<>();
        try {
            String sql = "Select * from tbl_lesson";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lesson = new Lesson(rs.getInt("idlesson"),
                                rs.getString("name"),
                                rs.getString("writeCa"),
                                rs.getString("writeNo"),
                                rs.getString("printCa"),
                                rs.getString("printNo"),
                                rs.getString("sound")
                );
                list.add(lesson);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
       return list;
    }

    public void removeLesson(int id){
        try {
            PreparedStatement ps =  conn.prepareStatement("DELETE FROM tbl_lesson WHERE idlesson = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {System.out.println("Error: " + e.getMessage()); }
    }
}
