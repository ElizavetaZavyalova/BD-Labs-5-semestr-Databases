package com.example.coursework.sculptureInformation;

import Connection.BDConnector;

import java.sql.SQLException;
import java.util.ArrayList;

import static com.example.coursework.sculptureInformation.PartsOfTheSculpture.*;


public class InsertInformation {
    public static void setBdConnector(BDConnector bdConnector) {
        InsertInformation.bdConnector = bdConnector;
    }

    static BDConnector bdConnector;
    Sculpture sculpture;
    ArrayList<NameDescription> paints=new ArrayList<>();
    ArrayList<String> authors=new ArrayList<>();;
    ArrayList<NameDescription> clays=new ArrayList<>();;
    Integer authorId;
    ArrayList<NameDescription> materials=new ArrayList<>();;
    public InsertInformation(Integer id){
        authorId = id;
    }
    public void addSculpture(Sculpture sculpture){
        this.sculpture = sculpture;
    }
    public void addClay(NameDescription clay){
        this.clays.add(clay);
    }
    public void addAuthor(String login){
        this.authors.add(login);
    }
    public void addMaterials(NameDescription material){
        this.materials.add(material);
    }
    public void addPaints(NameDescription paint){
        this.paints.add(paint);
    }
    void insertSculpture() throws SQLException {
        sculpture.id=bdConnector.insertSculpture(sculpture.name, sculpture.Description,
                sculpture.size, sculpture.Topic,sculpture.Destiny, sculpture.Technologies);
    }
    void insertAuthor() throws SQLException {
         bdConnector.insertManyToMany(authorId.toString(), sculpture.id.toString(),AUTHOR);
         for(String login:authors){
             Integer Id= bdConnector.getAuthorIdByLogin(login);
             bdConnector.insertManyToMany(Id.toString(), sculpture.id.toString(),AUTHOR);
         }
    }
    void insertClay() throws SQLException {
        for(NameDescription clay:clays){
            Integer Id= bdConnector.insertClay(clay.name, clay.description);
            bdConnector.insertManyToMany(Id.toString(), sculpture.id.toString(),CLAY);
        }
    }
    void insertPaint() throws SQLException {
        for(NameDescription paint:paints){
            Integer Id= bdConnector.insertPaint(paint.name,paint.description);
            bdConnector.insertManyToMany(Id.toString(), sculpture.id.toString(),PAINT);
        }
    }
    void insertMaterials() throws SQLException {
        for(NameDescription material:materials){
            Integer Id= bdConnector.insertMaterials(material.name,material.description);
            bdConnector.insertManyToMany(Id.toString(), sculpture.id.toString(),MATERIALS);
        }
    }
    public  void insert()   {
        try {
            insertSculpture();
            insertAuthor();
            insertClay();
            insertPaint();
            insertMaterials();
        } catch (SQLException e) {
            System.out.println("insert: " + e.getMessage());
        }

    }
}
