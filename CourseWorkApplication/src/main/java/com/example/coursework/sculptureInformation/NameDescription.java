package com.example.coursework.sculptureInformation;

public class NameDescription {
    String name = "Имя";

    public String getName() {
        return name;
    }
    public NameDescription(String name, String description){
        this.name = name;
        this.description = description;
    }
    public NameDescription(){}
    public String getDescription() {
        return description;
    }

    String description;
}
