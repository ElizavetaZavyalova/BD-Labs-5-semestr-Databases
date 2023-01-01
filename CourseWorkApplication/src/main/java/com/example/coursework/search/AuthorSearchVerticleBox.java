package com.example.coursework.search;

import Connection.BDConnector;
import com.example.coursework.Scenes;
import com.example.coursework.SearchResult;
import javafx.event.EventHandler;
import javafx.scene.control.Button;
import javafx.scene.input.MouseEvent;

import java.io.IOException;
import java.sql.SQLException;

public class AuthorSearchVerticleBox extends SearchResultVerticalBox {
    Button destroy=new Button("Удалить");
    public AuthorSearchVerticleBox(Integer id, String name, String description, BDConnector bdConnector) {
        super(id, name, description);
        this.getChildren().add(destroy);
        destroy.addEventHandler(MouseEvent.MOUSE_CLICKED, new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent mouseEvent) {
                try {
                    bdConnector.deleteSculpture(id.toString());

                } catch (SQLException e) {
                    System.out.println("can't destroy "+e.getMessage());
                }
            }
        });
    }
}
