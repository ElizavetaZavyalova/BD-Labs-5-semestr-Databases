package com.example.coursework.hbox;

import com.example.coursework.sculptureInformation.NameDescription;
import javafx.event.EventHandler;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;

public class NameDescriptionHBox extends HBox {
    Label labelName;
    Label labelDescription;
    TextField nameTextField;
    TextField descriptionTextField;
    public NameDescription getDescription() {
        return new NameDescription(nameTextField.getText(), descriptionTextField.getText());
    }


    Button button;
    VBox vbox;
    void close(){
        vbox.getChildren().remove(this);
    }
    public NameDescriptionHBox(VBox vbox, String name, String description){
        this.vbox = vbox;
        labelName = new Label(name+":");
        labelDescription=new Label(description+":");
        nameTextField=new TextField();
        descriptionTextField=new TextField();
        button = new Button("-");
        this.getChildren().add(labelName);
        this.getChildren().add(nameTextField);
        this.getChildren().add(labelDescription);
        this.getChildren().add(descriptionTextField);
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
