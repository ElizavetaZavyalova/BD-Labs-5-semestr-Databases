USE CourseWork;
#Краска
DROP PROCEDURE IF EXISTS getPaintOfSculpture;
DELIMITER $$
CREATE PROCEDURE  getPaintOfSculpture(IN _SculptureId INT)
    BEGIN
    SELECT distinct PaintViewName from paintinformation,SculptureHasPaint
    where SculptureHasPaint.SculptureID=_SculptureId AND paintinformation.PaintID=SculptureHasPaint.PaintId;
    END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS getPalitra;
DELIMITER $$
CREATE PROCEDURE getPalitra(IN _SculptureId INT, IN _PaintViewName VARCHAR(255))
    BEGIN
    SELECT PaintColorName FROM PaintInformation,SculptureHasPaint
    where PaintInformation.PaintViewName=_PaintViewName AND
   SculptureHasPaint.SculptureID=_SculptureId AND
    PaintInformation.PaintId=SculptureHasPaint.PaintId;
    END$$
DELIMITER ;
#Авторы

DROP PROCEDURE IF EXISTS getAuthorsOfSculpture;
DELIMITER $$
CREATE PROCEDURE  getAuthorsOfSculpture(IN _SculptureId INT)
    BEGIN
    SELECT AuthorName,SculpturesCount,AGE FROM author,sculpturehasauthor
    where author.authorID=SculptureHasAuthor.authorID
     AND SculptureHasAuthor.SculptureId=_SculptureId ;
    END$$
DELIMITER ;

#Глина
DROP PROCEDURE IF EXISTS getClayOfSculpture;
DELIMITER $$
CREATE PROCEDURE  getClayOfSculpture(IN _SculptureId INT)
    BEGIN
    SELECT distinct ClayColor FROM clay, SculptureHasClay
    where clay.clayID= SculptureHasClay.clayID AND
                                  SculptureHasClay.SculptureID=_SculptureId;
    END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS getClayInfoByView;
DELIMITER $$
CREATE PROCEDURE getClayInfoByView(IN _SculptureId INT, IN _ClayColor varchar(255))
    BEGIN
    SELECT ClayName FROM Clay, SculptureHasClay
    where clay.ClayColor=_ClayColor AND
    SculptureHasClay.SculptureID=_SculptureId AND
    SculptureHasClay.ClayId=clay.ClayId;
    END$$
DELIMITER ;

#Матерьялы
DROP PROCEDURE IF EXISTS getOtherMaterialsOfSculpture;
DELIMITER $$
CREATE PROCEDURE  getOtherMaterialsOfSculpture(IN _SculptureId INT)
    BEGIN
    SELECT othermaterials.MaterialID,othermaterials.MaterialName,othermaterials.HowMaterialWasUse
    FROM othermaterials,sculpturehasothermaterials
    where othermaterials.MaterialID=sculpturehasothermaterials.MaterialID
                                AND sculpturehasothermaterials.SculptureId=_SculptureId;
    END$$
DELIMITER ;
#Cкульптура
DROP PROCEDURE IF EXISTS getSculptureFromId;
DELIMITER $$
CREATE PROCEDURE  getSculptureFromId(IN _SculptureId INT)
    BEGIN
    SELECT SculptureID,SculptureName, SculptureDescription,DateOfCreation,SculptureSize,AuthorCount FROM sculpture
    where  sculpture.SculptureId=_SculptureId;
    END$$
DELIMITER ;

#тема
DROP PROCEDURE IF EXISTS getTopicOfSculpture;
DELIMITER $$
CREATE PROCEDURE  getTopicOfSculpture(IN _SculptureId INT)
    BEGIN
    SELECT* FROM Topic
    where topic.TopicID=(SELECT Sculpture.TopicID
                         FROM sculpture
                         where  sculpture.SculptureId=_SculptureId);
    END$$
DELIMITER ;

#технология
DROP PROCEDURE IF EXISTS getTechnologiesOfSculpture;
DELIMITER $$
CREATE PROCEDURE  getTechnologiesOfSculpture(IN _SculptureId INT)
    BEGIN
    SELECT* FROM Technologies
    where Technologies.TechnologiesID=(SELECT Sculpture.TechnologiesID
                         FROM sculpture
                         where  sculpture.SculptureId=_SculptureId);
    END$$
DELIMITER ;

#применение
DROP PROCEDURE IF EXISTS getDestinyOfSculpture;
DELIMITER $$
CREATE PROCEDURE  getDestinyOfSculpture(IN _SculptureId INT)
    BEGIN
    SELECT* FROM Destiny
    where Destiny.DestinyID=(SELECT Sculpture.DestinyID
                         FROM sculpture
                         where  sculpture.SculptureId=_SculptureId);
    END$$
DELIMITER ;



