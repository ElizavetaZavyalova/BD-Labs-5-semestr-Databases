package com.example.coursework.search;

import com.example.coursework.Scenes;
import com.example.coursework.SearchResult;
import javafx.event.EventHandler;
import javafx.scene.control.Hyperlink;
import javafx.scene.control.TextField;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.VBox;

import java.io.IOException;

public class SearchResultVerticalBox extends VBox {
    Hyperlink hyperlink;
    int id;
    public SearchResultVerticalBox(int id, String name, String description) {
        this.id = id;
        this.hyperlink = new Hyperlink(name);
        TextField texField = new TextField(description);
        texField.setEditable(false);
        this.getChildren().addAll(this.hyperlink, texField);

    }
   public void showInformation(){
        hyperlink.addEventHandler(MouseEvent.MOUSE_CLICKED, new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent mouseEvent) {
                try {
                    SearchResult.setSculptureId(id);
                    Scenes.openSearchResult();
                } catch (IOException e) {
                    System.out.println("can't open "+e.getMessage());
                }
            }
        });
    }
    public void changeInformation(){
        hyperlink.addEventHandler(MouseEvent.MOUSE_CLICKED, new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent mouseEvent) {
                //TODO OpenView
            }
        });
    }

}
