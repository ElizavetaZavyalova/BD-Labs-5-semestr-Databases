package com.example.coursework.sculptureInformation;

import Connection.BDConnector;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static com.example.coursework.sculptureInformation.PartsOfTheSculpture.CLAY;
import static com.example.coursework.sculptureInformation.PartsOfTheSculpture.PAINT;

public class Clay {
    public String getName() {
        return name;
    }

    public ArrayList<String> getClayView() {
        return clayView;
    }

    String name;
    ArrayList<String> clayView = new ArrayList<String>();
    void setColors(BDConnector bdConnector, Integer id) throws SQLException {
        ResultSet resultSet = bdConnector.getSculptureInfById(id.toString(), name, CLAY);
        clayView.clear();
        while (resultSet.next()) {
            clayView.add(resultSet.getString("ClayName"));
        }
    }
}
