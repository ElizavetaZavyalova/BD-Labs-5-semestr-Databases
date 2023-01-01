package com.example.coursework;

import Connection.BDConnector;
import com.example.coursework.sculptureInformation.InsertInformation;
import com.example.coursework.sculptureInformation.SculptureInformation;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.io.IOException;
import java.sql.SQLException;

public class HelloApplication extends Application {
    @Override
    public void start(Stage stage) throws IOException {
        try {
            BDConnector bdConnector=new BDConnector();

            SculptureInformation.setBdConnector(bdConnector);
            InsertInformation.setBdConnector(bdConnector);

            MainController.setBdConnector(bdConnector);
            SearchResult.setBdConnector(bdConnector);
            InsertTo.setBdConnector(bdConnector);
            AccountChange.setBdConnector(bdConnector);

            FXMLLoader fxmlLoader = new FXMLLoader(HelloApplication.class.getResource("mainMenu.fxml"));
            Scene scene = new Scene(fxmlLoader.load(), 320, 240);
            Scenes.setMainMenu(scene);
            stage.setTitle("Курсовая");
            Scenes.setStage(stage);
            Scenes.openMainMenu();
            stage.show();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public static void main(String[] args) {
        launch();
    }
}