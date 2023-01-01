package com.example.coursework;

import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;
import java.util.ResourceBundle;

import Connection.BDConnector;
import com.example.coursework.account.Account;
import com.example.coursework.search.Search;
import com.example.coursework.search.ResultOfSearch;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.stage.Stage;

public class MainController {
    Account account;

    public static void setBdConnector(BDConnector bdConnector) {
        MainController.bdConnector = bdConnector;
    }

    static BDConnector bdConnector;
    ResultOfSearch resultOfSearch;
    @FXML
    private ScrollPane MySculpturesSk;
    @FXML
    private ScrollPane searchResultSk;

    @FXML
    private ResourceBundle resources;

    @FXML
    private URL location;

    @FXML
    private Label countSculptures;


    @FXML
    private TextField logIn;


    @FXML
    private PasswordField password;

    @FXML
    private TextField searchResault;


    @FXML
    void handleAuthor(ActionEvent event) {
        searchResultSk.setContent(resultOfSearch.callSearch(searchResault.getText(), Search.AUTHOR,true));
    }

    @FXML
    void handleDestiny(ActionEvent event) {
        searchResultSk.setContent(resultOfSearch.callSearch(searchResault.getText(), Search.DESTINY,true));
    }
    @FXML
    void  handleAdd(ActionEvent event) {
        if(!account.getId().equals(-1)) {
            try {
                InsertTo.setAccountId(account.getId());
                Scenes.openInsertTo();
            } catch (IOException e) {
                System.out.println("Не выходит открыть вставку "+e.getMessage());
            }
        }
    }


    @FXML
    void handleLogIn(ActionEvent event) {
        account=new Account(bdConnector, logIn.getText(),password.getText());
        if(!account.getId().equals(-1)){
            //countSculptures.setText("Ваши Скульптуры("+account.getCount()+"):");
            MySculpturesSk.setContent(account.callSearch(false));
        }
        else{
            countSculptures.setText("Аккаунт не найден");
        }
    }

    @FXML
    void handleName(ActionEvent event) {
        searchResultSk.setContent(resultOfSearch.callSearch(searchResault.getText(), Search.NAME,true));
    }

    @FXML
    void handlePaint(ActionEvent event) {
        searchResultSk.setContent(resultOfSearch.callSearch(searchResault.getText(), Search.PAINT,true));
    }

    @FXML
    void handleTema(ActionEvent event) {
        searchResultSk.setContent(resultOfSearch.callSearch(searchResault.getText(), Search.TOPIC, true));
    }

    @FXML
    void initialize() {
         account=new Account(bdConnector,"","");
            resultOfSearch = new ResultOfSearch(bdConnector);

    }
    @FXML
    void handleReduct(ActionEvent event){
        if(!account.getId().equals(-1)) {

            AccountChange.setAccountId(account.getId());
            try {
                Scenes.openAccountChange();
            } catch (IOException e) {
                System.out.println("Не выходит открыть файл"+e.getMessage());
            }
        }
    }
}
