package Connection;

import com.example.coursework.sculptureInformation.PartsOfTheSculpture;
import com.example.coursework.search.Search;

import java.sql.*;

public class BDConnector {
    final String url = "jdbc:mysql://localhost:3306/coursework";
    final String username = "root";
    final String password = "Qasxcdew19";
    Connection connection;
    Statement statement;

    public BDConnector() throws SQLException {
        connection = DriverManager.getConnection(url, username, password);
        System.out.println("Database connected!");
        statement = connection.createStatement();
    }

    public ResultSet searchResult(String _name, Search key) throws SQLException {
        switch (key) {
            case NAME:
                return statement.executeQuery("CALL coursework.getSculptureByName(" + BDString(_name) + ");");
            case AUTHOR:
                return statement.executeQuery("CALL coursework.getSculptureByAuthor(" + BDString(_name) + ");");
            case PAINT:
                return statement.executeQuery("CALL coursework.getSculptureByPaint(" + BDString(_name) + ");");
            case TOPIC:
                return statement.executeQuery("CALL coursework.getSculptureByTopic(" + BDString(_name) + ");");
            case DESTINY:
                return statement.executeQuery("CALL coursework.getSculptureByDestiny(" + BDString(_name) + ");");
            case AUTHOR_ID:
                return statement.executeQuery("CALL coursework.getSculpturesOfAuthor(" + _name + ");");
        }
        System.out.println("Not correct Key:" + key.toString());
        throw new IllegalArgumentException("not correct key " + key.toString());
    }

    public ResultSet getAccountInf(String login, String password) throws SQLException {

        return statement.executeQuery("CALL coursework.getAuthorId(" + BDString(login) + " ," + BDString(password) + ");");


    }

    String BDString(String string) {
        return "'" + string + "'";
    }

    public Integer insertSculpture(String sculptureName, String sculptureDescription, String sculptureSize,
                            String topicID, String destinyID, String technologiesID) throws SQLException {
        ResultSet result = statement.executeQuery("CALL coursework.insertSculpture("
                + BDString(sculptureName) + " ,"
                + BDString(sculptureDescription) + " ,"
                + sculptureSize + " ,"
                + topicID + ","
                + destinyID + ","
                + technologiesID + ");");
        if (result.next()) {
            return result.getInt("SculptureID");
        }
        return -1;
    }
    public Integer insertClay(String clayName  , String clayColor)throws SQLException{
        ResultSet result = statement.executeQuery("CALL coursework.insertClay("
                + BDString(clayName) + ","
                + BDString(clayColor) + ");");
        if (result.next()) {
            return result.getInt("ClayID");
        }
        return -1;
    }
    public Integer getAuthorIdByLogin(String login) throws SQLException {
        ResultSet result = statement.executeQuery("CALL coursework.getAuthorIdByLogin("
                + BDString(login)+ ");");
        if (result.next()) {
            return result.getInt("AuthorID");
        }
        return -1;
    }
    public ResultSet getAllFromTable(String tableName) throws SQLException {
       return  statement.executeQuery("SELECT* FROM "+tableName+";");
    }
    public void updateAccount(String AuthorId, String login,String password) throws SQLException {
        statement.execute("CALL coursework.updateAuthor("+AuthorId+"," +BDString(login)+","+BDString(password)+");");
    }
    public void deleteSculpture(String SculptureId) throws SQLException {
        statement.execute("CALL coursework.deleteSculpture("+SculptureId+ ");");
    }
    public Integer insertMaterials(String materialName, String materialDescription)throws SQLException{
        ResultSet result = statement.executeQuery("CALL coursework.insertMaterials("
                + BDString(materialName) + ","
                + BDString(materialDescription) + ");");
        if (result.next()) {
            return result.getInt("MaterialID");
        }
        return -1;
    }
    public Integer insertPaint(String paintName, String paintView)throws SQLException {
      ResultSet result = statement.executeQuery("CALL coursework.insertPaint("
              + BDString(paintName)+ ","
              + BDString(paintView) + ");");
        if (result.next()) {
            return result.getInt("PaintID");
        }
        return -1;
    }
    public void insertManyToMany( String anotherId,String sculptureId,PartsOfTheSculpture key) throws SQLException {
        switch (key){
            case AUTHOR:
                statement.execute("CALL coursework.insertAuthorHasSculpture(" + anotherId  + "," +  sculptureId+ ");");
                break;
            case PAINT:
                statement.execute("CALL coursework.insertSculptureHasPaint(" + anotherId  + "," +  sculptureId+ ");");
                break;
            case CLAY:
                statement.execute("CALL coursework.insertSculptureHasClay(" + anotherId  + "," +  sculptureId+ ");");
                break;
            case MATERIALS:
                statement.execute("CALL coursework.insertSculptureHasOtherMaterials(" + anotherId  + "," +  sculptureId+ ");");
                break;
        }
    }
    public ResultSet getSculpturePortsById(String id, PartsOfTheSculpture key) throws SQLException {
        switch (key) {
            case CLAY:
                return statement.executeQuery("CALL coursework.getClayOfSculpture(" + id + ");");
            case TOPIC:
                return statement.executeQuery("CALL coursework.getTopicOfSculpture(" + id + ");");
            case AUTHOR:
                return statement.executeQuery("CALL coursework.getAuthorsOfSculpture(" + id + ");");
            case DESTINY:
                return statement.executeQuery("CALL coursework.getDestinyOfSculpture(" + id + ");");
            case SCULPTURE:
                return statement.executeQuery("CALL coursework.getSculptureFromId(" + id + ");");
            case MATERIALS:
                return statement.executeQuery("CALL coursework.getOtherMaterialsOfSculpture(" + id + ");");
            case PAINT:
                return statement.executeQuery("CALL coursework.getPaintOfSculpture(" + id + ");");
            case TECHNOLOGIES:
                return statement.executeQuery("CALL coursework.getTechnologiesOfSculpture(" + id + ");");
        }
        System.out.println("Not correct Key:" + key.toString());
        throw new IllegalStateException("Not correct key:" + key.toString());
    }

    public ResultSet getSculptureInfById(String SculptureId, String Information, PartsOfTheSculpture key) throws SQLException {
        switch (key) {
            case CLAY:
                return statement.executeQuery("CALL coursework.getClayInfoByView(" + SculptureId + ",'" + Information + "');");
            case PAINT:
                return statement.executeQuery("CALL coursework.getPalitra(" + SculptureId + ",'" + Information + "');");

        }
        System.out.println("Not correct Key:" + key.toString());
        throw new IllegalStateException("Not correct key:" + key.toString());
    }
}

