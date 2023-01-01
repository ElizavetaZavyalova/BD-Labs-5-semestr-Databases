package com.example.coursework;

import Connection.BDConnector;
import com.example.coursework.account.Account;
import com.example.coursework.hbox.AuthorHBox;
import com.example.coursework.hbox.NameDescriptionHBox;
import com.example.coursework.sculptureInformation.InsertInformation;
import com.example.coursework.sculptureInformation.NameDescription;
import com.example.coursework.sculptureInformation.Sculpture;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.Node;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.layout.VBox;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class InsertTo {
    static Integer accountId=-1;

    public static void setAccountId(Integer accountId) {
        InsertTo.accountId = accountId;
    }

    public static void setBdConnector(BDConnector bdConnector) {
         InsertTo.bdConnector = bdConnector;
    }

    static BDConnector bdConnector;
    @FXML
    private ComboBox<String> DestinyBox;
    ArrayList<String> DestinyId=new ArrayList<String>();
    @FXML
    private ComboBox<String> TechnologiesBox;
    ArrayList<String> TechnologiesId=new ArrayList<String>();
    @FXML
    private ComboBox<String> TopicBox;
    ArrayList<String> TopicId=new ArrayList<String>();
    @FXML
    private VBox AuthorVbox;


    @FXML
    private VBox ClayVbox;

    @FXML
    private VBox MaterialVbox;

    @FXML
    private VBox PaintVbox;

    @FXML
    private TextField nameLabel;

    @FXML
    private TextField sizeLabel;
    @FXML
    private TextArea descriptionLabel;

    @FXML
    void handleAdd(ActionEvent event) {
        if(!nameLabel.getText().equals("")) {
            InsertInformation info = new InsertInformation(accountId);
            info.addSculpture(getSculpture());
            for(Node Clay: ClayVbox.getChildren()) {
                info.addClay(((NameDescriptionHBox)Clay).getDescription());
            }
            for(Node Material : MaterialVbox.getChildren()) {
                info.addMaterials(((NameDescriptionHBox)Material).getDescription());
            }
            for(Node Paint : PaintVbox.getChildren()) {
                info.addPaints(((NameDescriptionHBox)Paint).getDescription());
            }
            for(Node author : AuthorVbox.getChildren()) {
                info.addAuthor(((AuthorHBox)author).getLogin());
            }
            info.insert();
            Scenes.openMainMenu();
        }

    }
    Sculpture getSculpture() {
        Sculpture sculpture=new Sculpture();
        sculpture.setName(nameLabel.getText());
        sculpture.setSize(sizeLabel.getText());
        sculpture.setTopic(TopicId.get(TopicBox.getSelectionModel().getSelectedIndex()));
        int i=DestinyBox.getSelectionModel().getSelectedIndex();
        sculpture.setDestiny(DestinyId.get(DestinyBox.getSelectionModel().getSelectedIndex()));
        sculpture.setTechnologies(TechnologiesId.get(TechnologiesBox.getSelectionModel().getSelectedIndex()));
        sculpture.setDescription(descriptionLabel.getText());
        return sculpture;
    }

    @FXML
    void handleAuthorAdd(ActionEvent event) {
        new AuthorHBox(AuthorVbox);
    }

    @FXML
    void handleClayAdd(ActionEvent event) {
        new NameDescriptionHBox(ClayVbox,"Название:","Цвет:");
    }

    @FXML
    void handleMaterialsAdd(ActionEvent event) {
        new NameDescriptionHBox(MaterialVbox,"Название:","Как использеутся:");
    }

    @FXML
    void handlePaintAdd(ActionEvent event) {
        new NameDescriptionHBox(PaintVbox,"Цвет:","Вид:");

    }

    @FXML
    void handleReturn(ActionEvent event) {
       Scenes.openMainMenu();
    }
    @FXML
    void initialize() {
        try {
            ResultSet topicSet =bdConnector.getAllFromTable("coursework.topic");
            while(topicSet.next()){
                TopicBox.getItems().add(topicSet.getString("TopicName"));
                TopicId.add(topicSet.getString("TopicId"));
            }
            ResultSet technologiesSet =bdConnector.getAllFromTable("coursework.technologies");
            while(technologiesSet.next()){
                TechnologiesBox.getItems().add(technologiesSet.getString("TechnologiesName"));
                TechnologiesId.add(technologiesSet.getString("TechnologiesID"));
            }
            ResultSet destinySet =bdConnector.getAllFromTable("coursework.destiny");
            while(destinySet.next()){
                DestinyBox.getItems().add(destinySet.getString("DestinyName"));
                DestinyId.add(destinySet.getString("DestinyID"));
            }
        } catch (SQLException e) {
            System.out.println("Bd problems "+e.getMessage());
        }

    }

}
