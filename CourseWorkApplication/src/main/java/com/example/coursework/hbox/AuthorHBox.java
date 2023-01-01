package com.example.coursework.hbox;

import com.example.coursework.Scenes;
import com.example.coursework.SearchResult;
import javafx.event.EventHandler;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;

import java.io.IOException;

public class AuthorHBox extends HBox {
    Label label;
    public String getLogin() {
        return login.getText();
    }
    TextField login;
    Button button;
    VBox vbox;
    void close(){
        vbox.getChildren().remove(this);
    }
    public AuthorHBox(VBox vbox){
        this.vbox = vbox;
        label = new Label("Логин:");
        login=new TextField();
        button = new Button("-");
        this.getChildren().add(label);
        this.getChildren().add(login);
        this.getChildren().add(button);
        vbox.getChildren().add(this);
        button.addEventHandler(MouseEvent.MOUSE_CLICKED, new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent mouseEvent) {
                 close();
            }
        });
    }
}
