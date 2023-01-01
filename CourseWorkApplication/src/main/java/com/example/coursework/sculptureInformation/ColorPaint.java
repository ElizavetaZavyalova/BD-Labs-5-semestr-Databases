package com.example.coursework.sculptureInformation;

import Connection.BDConnector;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static com.example.coursework.sculptureInformation.PartsOfTheSculpture.PAINT;

public class ColorPaint {
    String name;
    ArrayList<String> colors=new ArrayList<>();

    public String getName() {
        return name;
    }

    public ArrayList<String> getColors() {
        return colors;
    }

    void setColors(BDConnector bdConnector, Integer id) throws SQLException {
        ResultSet resultSet = bdConnector.getSculptureInfById(id.toString(), name, PAINT);
        colors.clear();
        while (resultSet.next()) {
            colors.add(resultSet.getString("PaintColorName"));
        }
    }
}
