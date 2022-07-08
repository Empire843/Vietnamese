/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bean;

import java.io.Serializable;

/**
 *
 * @author Pan
 */
public class Lesson implements Serializable
{
    private int id ;
    private String lessonName;
    private String writeCa;
    private String writeNo;
    private String printCa;
    private String printNo;
    private String sound;

    public Lesson(int id , String lessonName, String writeCa, String writeNo, String printCa, String printNo, String sound) {
        this.id = id;
        this.writeCa = writeCa;
        this.lessonName = lessonName;
        this.writeNo = writeNo;
        this.printCa = printCa;
        this.printNo = printNo;
        this.sound = sound;
    }

    public Lesson() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getWriteCa() {
        return writeCa;
    }

    public void setWriteCa(String writeCa) {
        this.writeCa = writeCa;
    }

    public String getWriteNo() {
        return writeNo;
    }

    public void setWriteNo(String writeNo) {
        this.writeNo = writeNo;
    }

    public String getPrintCa() {
        return printCa;
    }

    public void setPrintCa(String printCa) {
        this.printCa = printCa;
    }

    public String getPrintNo() {
        return printNo;
    }

    public void setPrintNo(String printNo) {
        this.printNo = printNo;
    }

    public String getSound() {
        return sound;
    }

    public void setSound(String sound) {
        this.sound = sound;
    }
    
    
    public String getLessonName() {
        return lessonName;
    }

    public void setLessonName(String lessonName) {
        this.lessonName = lessonName;
    }

}
