USE CourseWork;
DROP PROCEDURE IF EXISTS insertSculpture;
DELIMITER $$
CREATE PROCEDURE  insertSculpture(
                 IN _SculptureName varchar(255),
                 IN _SculptureDescription MEDIUMTEXT,
                 IN _SculptureSize INT,
                 IN _TopicID INT,
                 IN _DestinyID INT,
                 IN _TechnologiesID INT)
    BEGIN
    INSERT sculpture(
                     SculptureName,
                     SculptureDescription,
                     SculptureSize,
                     TopicID,
                     DestinyID,
                     TechnologiesID)
    VALUES (_SculptureName,
            _SculptureDescription,
            _SculptureSize,
            _TopicID,
            _DestinyID,
            _TechnologiesID);
    SELECT LAST_INSERT_ID() AS SculptureID FROM sculpture;
    END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS insertClay;
DELIMITER $$
CREATE PROCEDURE  insertClay(
                 IN _ClayName VARCHAR(255),
                 IN _ClayColor VARCHAR(255))
    BEGIN
        INSERT INTO clay (ClayName, ClayColor)
        SELECT * FROM (SELECT _ClayName,_ClayColor) AS tmp
        WHERE NOT EXISTS (
        SELECT ClayName,ClayColor FROM clay WHERE ClayName=_ClayName AND ClayColor=_ClayColor
        ) LIMIT 1;
    SELECT ClayID FROM clay WHERE ClayName=_ClayName AND ClayColor=_ClayColor;
    END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS insertMaterials;
DELIMITER $$
CREATE PROCEDURE  insertMaterials(
                 IN _MaterialName VARCHAR(255),
                 IN _MaterialDescription VARCHAR(255))
    BEGIN
        INSERT INTO othermaterials ( MaterialName, HowMaterialWasUse)
        SELECT * FROM (SELECT _MaterialName,_MaterialDescription) AS tmp
        WHERE NOT EXISTS (
        SELECT  MaterialName,
               HowMaterialWasUse
               FROM othermaterials
               WHERE MaterialName=_MaterialName AND HowMaterialWasUse=_MaterialDescription
        ) LIMIT 1;
        SELECT MaterialID FROM othermaterials
                      WHERE MaterialName=_MaterialName AND HowMaterialWasUse=_MaterialDescription;
    END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS insertPaint;
DELIMITER $$
CREATE PROCEDURE  insertPaint(
                 IN _PaintName VARCHAR(255),
                 IN _PaintView VARCHAR(255))
    BEGIN
        INSERT INTO paintinformation (PaintViewName, PaintColorName)
        SELECT * FROM (SELECT _PaintView,_PaintName) AS tmp
        WHERE NOT EXISTS (
        SELECT PaintViewName,
               PaintColorName
               FROM paintinformation
               WHERE PaintViewName=_PaintView AND PaintColorName=_PaintName
        ) LIMIT 1;
        SELECT PaintID FROM paintinformation
                       WHERE PaintViewName=_PaintView AND PaintColorName=_PaintName;
    END$$
DELIMITER ;

 DROP PROCEDURE IF EXISTS getAuthorIdByLogin;
DELIMITER $$
CREATE PROCEDURE  getAuthorIdByLogin(
                 IN _login VARCHAR(255))
    BEGIN
        SELECT AuthorID FROM author
                       WHERE  author.AuthorName=_login;
    END$$
DELIMITER ;

#INSERT HASTABLE

DROP PROCEDURE IF EXISTS insertAuthorHasSculpture;
DELIMITER $$
CREATE PROCEDURE   insertAuthorHasSculpture(
                 IN _AuthorID INT,
                 IN _SculptureID INT)
    BEGIN
         INSERT sculpturehasauthor(AuthorID,SculptureID)
         VALUES (_AuthorID,
            _SculptureID);
    END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS insertSculptureHasClay;
DELIMITER $$
CREATE PROCEDURE   insertSculptureHasClay(
                 IN _ClayID INT,
                 IN _SculptureID INT)
    BEGIN
         INSERT sculpturehasClay(clayID,SculptureID)
         VALUES (_ClayID, _SculptureID);
    END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS insertSculptureHasPaint;
DELIMITER $$
CREATE PROCEDURE   insertSculptureHasPaint(
                 IN _PaintID INT,
                 IN _SculptureID INT)
    BEGIN
         INSERT sculpturehaspaint(PaintID,SculptureID)
         VALUES (_PaintID,
            _SculptureID);
    END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS insertSculptureHasOtherMaterials;
DELIMITER $$
CREATE PROCEDURE   insertSculptureHasOtherMaterials(
                 IN _MaterialsID INT,
                 IN _SculptureID INT)
    BEGIN
         INSERT sculpturehasothermaterials(MaterialID,SculptureID)
         VALUES (_MaterialsID,
            _SculptureID);
    END$$
DELIMITER ;


