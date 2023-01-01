package com.example.coursework;

import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.io.IOException;

public class Scenes {
    static Scene mainMenu;
    static Stage stage;

    public static Scene getMainMenu() {
        return mainMenu;
    }

    public static void setMainMenu(Scene mainMenu) {
        Scenes.mainMenu = mainMenu;
    }

    public static Stage getStage() {
        return stage;
    }

    public static void setStage(Stage stage) {
        Scenes.stage = stage;
    }
    public static void openSearchResult() throws IOException {
       FXMLLoader fxmlLoader = new FXMLLoader(HelloApplication.class.getResource("SearchResult.fxml"));
       Scene scene = new Scene(fxmlLoader.load(), 320, 240);
       stage.setScene(scene);

    }
    public static void openInsertTo() throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader(HelloApplication.class.getResource("InsertTo.fxml"));
        Scene scene = new Scene(fxmlLoader.load(), 320, 240);
        stage.setScene(scene);

    }
    public static void openAccountChange() throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader(HelloApplication.class.getResource("AccountChange.fxml"));
        Scene scene = new Scene(fxmlLoader.load(), 320, 240);
        stage.setScene(scene);
    }
    public static void openMainMenu(){

        stage.setScene(mainMenu);

    }
}
