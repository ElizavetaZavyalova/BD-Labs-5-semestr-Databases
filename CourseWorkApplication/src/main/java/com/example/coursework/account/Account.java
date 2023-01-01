package com.example.coursework.account;

import Connection.BDConnector;
import com.example.coursework.search.AuthorSearchVerticleBox;
import com.example.coursework.search.Search;
import com.example.coursework.search.SearchResultVerticalBox;
import javafx.scene.control.Button;
import javafx.scene.layout.VBox;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Account {
    BDConnector bdConnector;
    VBox vbox;
    Integer id=-1;
    Integer count=0;

    public Integer getId() {
        return id;
    }

    public Integer getCount() {
        return count;
    }

    public Account(BDConnector bdConnector, String login, String password){
        this.bdConnector = bdConnector;
        try {
            ResultSet resultSet = bdConnector.getAccountInf(login, password);
            if (resultSet.next()) {
                id= resultSet.getInt("AuthorId");
                count= resultSet.getInt("SculpturesCount");
                return;
            }
            System.out.println("account not found");

        } catch (SQLException e) {

        }
    }
    public  VBox callSearch(boolean flag) {
        try {
            VBox vbox=new VBox();
            ResultSet resultSearch = bdConnector.searchResult(id.toString(),Search.AUTHOR_ID);
            while (resultSearch.next()) {
                String sculptureName=resultSearch.getString("SculptureName");
                String description=resultSearch.getString("SculptureDescription");
                int id=resultSearch.getInt("SculptureID");
                SearchResultVerticalBox searchResultVerticalBox;
                if(flag) {
                     searchResultVerticalBox = new SearchResultVerticalBox(id, sculptureName, description);
                }
                else{
                    searchResultVerticalBox=new AuthorSearchVerticleBox(id,sculptureName,description,bdConnector);
                }
                searchResultVerticalBox.changeInformation();
                vbox.getChildren().add(searchResultVerticalBox);
            }
            return vbox;
        } catch (SQLException e) {
            System.out.println("Not Correct id");
            return new VBox();
        }
    }

}
