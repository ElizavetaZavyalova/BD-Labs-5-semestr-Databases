package com.example.coursework;

import java.net.URL;
import java.sql.SQLException;
import java.util.ResourceBundle;

import Connection.BDConnector;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;

import javafx.scene.control.TextField;

public class AccountChange {
    static Integer accountId=-1;

    public static void setAccountId(Integer accountId) {
        AccountChange.accountId = accountId;
    }

    public static void setBdConnector(BDConnector bdConnector) {
        AccountChange.bdConnector = bdConnector;
    }

    static BDConnector bdConnector;

    @FXML
    private ResourceBundle resources;

    @FXML
    private URL location;

    @FXML
    private TextField LogInLabel;
    @FXML
    private TextField passwordLabel;

    @FXML
    void handleApply(ActionEvent event) {
        try {
            bdConnector.updateAccount(accountId.toString(),LogInLabel.getText(),passwordLabel.getText());
        } catch (SQLException e) {
            System.out.println("Аккаунт не обнавлен"+e.getMessage());
        }

    }

    @FXML
    void handleReturn(ActionEvent event) {
        Scenes.openMainMenu();
    }

    @FXML
    void initialize() {

    }

}
