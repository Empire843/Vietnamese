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
public class Word implements Serializable {

    private int id ;
    private String img;
    private String sound;
    private String word;
    private int idLession;

    public Word(int id, String img, String sound, String word, int idLession) {
        this.id = id;
        this.img = img;
        this.sound = sound;
        this.word = word;
        this.idLession = idLession;
    }

    public Word() {
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getSound() {
        return sound;
    }

    public void setSound(String sound) {
        this.sound = sound;
    }

    public String getWord() {
        return word;
    }

    public void setWord(String word) {
        this.word = word;
    }

    public int getIdLession() {
        return idLession;
    }

    public void setIdLession(int idLession) {
        this.idLession = idLession;
    }
}
