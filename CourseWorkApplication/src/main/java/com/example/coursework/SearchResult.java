package com.example.coursework;

import Connection.BDConnector;
import com.example.coursework.sculptureInformation.*;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.*;

import java.util.ArrayList;

public class SearchResult {
    static Integer sculptureId;
    static BDConnector bdConnector;

    public static void setBdConnector(BDConnector bdConnector) {
        SearchResult.bdConnector = bdConnector;
    }

    public static void setSculptureId(Integer sculptureId) {
        SearchResult.sculptureId = sculptureId;
    }

    @FXML
    private TreeView<String> ClayViev;

    @FXML
    private TreeView<String> MatirialView;

    @FXML
    private Button NameBt;

    @FXML
    private TreeView<String> PaintView;

    @FXML
    private TreeView<String> authorViev;

    @FXML
    private Label dateLabel;

    @FXML
    private Label destinyLabel;

    @FXML
    private TextArea destinyText;

    @FXML
    private Label sizeLabel;

    @FXML
    private Label technologiesLabel;

    @FXML
    private TextArea technologiesText;

    @FXML
    private Label topicLabel;

    @FXML
    private TextArea topicText;
    @FXML
    void initialize() {
        SculptureInformation sculpture=new SculptureInformation(sculptureId);

        NameBt.setText(sculpture.getSculpture().getName());
        sizeLabel.setText("Размер: "+sculpture.getSize());
        dateLabel.setText("Дата создания: "+sculpture.getDate());

        topicLabel.setText(sculpture.getTopic().getName());
        topicText.setText(sculpture.getTopic().getDescription());

        technologiesLabel.setText(sculpture.getTechnologies().getName());
        technologiesText.setText(sculpture.getTechnologies().getDescription());

        destinyLabel.setText(sculpture.getDestiny().getName());
        destinyText.setText(sculpture.getDestiny().getDescription());

        setAuthorView(sculpture.getAuthors());
        setMatirialView(sculpture.getMaterials());
        setClayView(sculpture.getClays());
        setPaintView(sculpture.getPaints());

    }
    void setAuthorView(ArrayList<Author> authors){
        TreeItem<String> authorRoot = new TreeItem<String>("Авторы");
        for(Author author : authors){
            TreeItem<String> authorName = new TreeItem<String>(author.getName());
            authorName.getChildren().add(new TreeItem<String>("Кол-во работ: "+author.getSculpturesCount()));
            authorName.getChildren().add(new TreeItem<String>("Возраст: "+author.getAge()));
            authorRoot.getChildren().add(authorName);
        }
        authorViev.setRoot(authorRoot);
    }
    void setMatirialView(ArrayList<NameDescription> matirials){
        TreeItem<String> matirialRoot = new TreeItem<String>("Матерьялы");
        for(NameDescription matirial : matirials){
            matirialRoot.getChildren().add(new TreeItem<String>(matirial.getName()));
        }
        MatirialView.setRoot(matirialRoot);
    }
    void setClayView(ArrayList<Clay> clays){
        TreeItem<String> clayRoot = new TreeItem<String>("Глина");
        for(Clay clay : clays){
            TreeItem<String> clayColor = new TreeItem<String>(clay.getName());
             for(String clayName:clay.getClayView()){
                 clayColor.getChildren().add(new TreeItem<String>(clayName));
             }
            clayRoot.getChildren().add(clayColor);
        }
        ClayViev.setRoot(clayRoot);
    }
    void setPaintView(ArrayList<ColorPaint> paints){
        TreeItem<String> paintRoot = new TreeItem<String>("Краска");
        for(ColorPaint paint : paints){
            TreeItem<String> paintName = new TreeItem<String>(paint.getName());
            for(String paintColor: paint.getColors()){
                paintName.getChildren().add(new TreeItem<String>(paintColor));
            }
            paintRoot.getChildren().add(paintName);
        }
        PaintView.setRoot(paintRoot);
    }
    @FXML
    void handleReturn(ActionEvent event) {
         Scenes.openMainMenu();
    }

}
