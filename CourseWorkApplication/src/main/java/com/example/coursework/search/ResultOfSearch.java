package com.example.coursework.search;

import Connection.BDConnector;
import javafx.scene.layout.VBox;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ResultOfSearch {
    BDConnector bdConnector;
    public ResultOfSearch(BDConnector bdConnector) {
        this.bdConnector = bdConnector;
    }
    public VBox callSearch(String name, Search key, boolean flag) {
        try {
            VBox vbox=new VBox();
            ResultSet resultSearch = bdConnector.searchResult(name, key);
                while (resultSearch.next()) {
                    String sculptureName=resultSearch.getString("SculptureName");
                    String description=resultSearch.getString("SculptureDescription");
                    int id=resultSearch.getInt("SculptureID");
                    SearchResultVerticalBox searchResultVerticalBox;
                    if(flag) {
                        searchResultVerticalBox = new SearchResultVerticalBox(id, sculptureName, description);
                    }
                    else{
                        searchResultVerticalBox= new AuthorSearchVerticleBox(id, sculptureName, description,bdConnector);
                    }
                    searchResultVerticalBox.showInformation();
                    vbox.getChildren().add(searchResultVerticalBox);
                }
                return vbox;
        } catch (SQLException e) {
            System.out.println("Not Correct request");
            return new VBox();
        }
    }

}
