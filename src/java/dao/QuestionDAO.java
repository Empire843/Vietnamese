package dao;

import bean.Lesson;
import bean.Question;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class QuestionDAO {
    private Connection conn = (Connection) DBConnection.getConnection();

    public boolean addQuestion(Question ques){
        boolean result = false;
        try
        {
            String query = "INSERT INTO tbl_question (question, ans1, ans2, ans3, ans4, idlesson) VALUES (?,?,?,?,?,?)";
            PreparedStatement pt = this.conn.prepareStatement(query);
            pt.setString(1, ques.getQuestion());
            pt.setString(2, ques.getAns1());
            pt.setString(3, ques.getAns2());
            pt.setString(4, ques.getAns3());
            pt.setString(5, ques.getAns4());
            pt.setInt(6, ques.getIdLession());
            pt.execute();
            result = true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return result;
    }

    public ArrayList<Question> getQuestionListViaLessonID(int idlesson){
        ArrayList<Question> answerList = new ArrayList<Question>();
        Question question = null;
        try {
            String sql = "Select * from tbl_question where idlesson = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, idlesson);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                question = new Question(
                    rs.getInt("idquestion"),
                                rs.getString("question"),
                                rs.getString("ans1"),
                                rs.getString("ans2"),
                                rs.getString("ans3"),
                                rs.getString("ans4"),
                                idlesson
                );
                answerList.add(question);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return answerList;
    }}
