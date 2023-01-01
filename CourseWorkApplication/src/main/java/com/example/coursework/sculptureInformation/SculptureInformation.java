package com.example.coursework.sculptureInformation;

import Connection.BDConnector;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static com.example.coursework.sculptureInformation.PartsOfTheSculpture.*;

public class SculptureInformation {
    public static void setBdConnector(BDConnector bdConnector) {
        SculptureInformation.bdConnector = bdConnector;
    }

    static BDConnector bdConnector;
    String date;
    String size;
    NameDescription sculpture=new NameDescription();
    NameDescription topic=new NameDescription();
    NameDescription destiny=new NameDescription();
    NameDescription technologies=new NameDescription();
    ArrayList<ColorPaint> paints=new ArrayList<ColorPaint>();
    ArrayList<Author> authors=new ArrayList<>();
    ArrayList<Clay> clays=new ArrayList<>();
    ArrayList<NameDescription> materials=new ArrayList<>();

    public String getDate() {
        return date;
    }

    public String getSize() {
        return size;
    }

    public NameDescription getSculpture() {
        return sculpture;
    }

    public NameDescription getTopic() {
        return topic;
    }

    public NameDescription getDestiny() {
        return destiny;
    }

    public NameDescription getTechnologies() {
        return technologies;
    }

    public ArrayList<ColorPaint> getPaints() {
        return paints;
    }

    public ArrayList<Author> getAuthors() {
        return authors;
    }

    public ArrayList<Clay> getClays() {
        return clays;
    }

    public ArrayList<NameDescription> getMaterials() {
        return materials;
    }


    public SculptureInformation(Integer id){
        try {
            makeSculpture(id);
            makeTopic(id);
            makeDestiny(id);
            makeTechnologies(id);
            makePaint(id);
            makeAuthors(id);
            makeClay(id);
            makeMaterials(id);
        } catch (SQLException e) {
            System.out.println("can't get sculpture");
            System.out.println(e.getMessage());
        }

    }
    void makeSculpture(Integer id) throws SQLException {
        ResultSet resultSet=bdConnector.getSculpturePortsById(id.toString(),SCULPTURE);
        if(resultSet.next()) {
            sculpture.name=resultSet.getString("SculptureName");
            sculpture.description=resultSet.getString("SculptureDescription");
            date= resultSet.getString("DateOfCreation");
            size=resultSet.getString("SculptureSize");
        }
    }
    void makeTopic(Integer id) throws SQLException {
        ResultSet resultSet=bdConnector.getSculpturePortsById(id.toString(),TOPIC);
        if(resultSet.next()) {
            topic.name= resultSet.getString("TopicName");
            topic.description= resultSet.getString("TopicDescription");
        }
    }
    void makeDestiny(Integer id) throws SQLException {
        ResultSet resultSet=bdConnector.getSculpturePortsById(id.toString(),DESTINY);
        if(resultSet.next()) {
            destiny.name= resultSet.getString("DestinyName");
            destiny.description= resultSet.getString("Instruction");
        }
    }
    void makeTechnologies(Integer id) throws SQLException {
        ResultSet resultSet=bdConnector.getSculpturePortsById(id.toString(),TECHNOLOGIES);
        if(resultSet.next()) {
            technologies.name= resultSet.getString("TechnologiesName");
            technologies.description= resultSet.getString("TechnologiesDescription");
        }
    }
    void makeAuthors(Integer id) throws SQLException {
        ResultSet resultSet=bdConnector.getSculpturePortsById(id.toString(),AUTHOR);
        authors.clear();
        while(resultSet.next()) {
            Author author= new Author();
            author.name= resultSet.getString("AuthorName");
            author.sculpturesCount= resultSet.getString("SculpturesCount");
            author.age= resultSet.getString("AGE");
            authors.add(author);
        }
    }
    void makeClay(Integer id) throws SQLException {
        ResultSet resultSet=bdConnector.getSculpturePortsById(id.toString(),CLAY);
        clays.clear();
        while(resultSet.next()) {
            Clay clay= new Clay();
            clay.name= resultSet.getString("ClayColor");
            clays.add(clay);
        }
        for(Clay clay:clays) {
            clay.setColors(bdConnector, id);
        }
    }
    void makeMaterials(Integer id) throws SQLException {
        ResultSet resultSet=bdConnector.getSculpturePortsById(id.toString(),MATERIALS);
        materials.clear();
        while(resultSet.next()) {
            NameDescription material=new NameDescription();
            material.name=resultSet.getString("MaterialName");
            material.description=resultSet.getString("HowMaterialWasUse");
            materials.add(material);
        }
    }
    void makePaint(Integer id) throws SQLException {
        ResultSet resultSet=bdConnector.getSculpturePortsById(id.toString(),PAINT);
        paints.clear();
        while(resultSet.next()) {
            ColorPaint paint=new ColorPaint();
            paint.name=resultSet.getString("PaintViewName");
            paints.add(paint);
        }
        for( ColorPaint paint:paints) {
            paint.setColors(bdConnector, id);
        }
    }
}
