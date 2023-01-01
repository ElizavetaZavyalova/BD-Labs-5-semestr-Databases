#SEARCH Procedure
USE CourseWork;

DROP PROCEDURE IF EXISTS getSculptureByTopic;
DELIMITER $$
CREATE PROCEDURE  getSculptureByTopic(IN _Name varchar(255))
    BEGIN
    SELECT* from sculpture
    where sculpture.TopicID=(SELECT topic.TopicID FROM topic WHERE topic.TopicName=_Name);
    END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS getSculptureByName;
DELIMITER $$
CREATE PROCEDURE  getSculptureByName(IN _Name varchar(255))
    BEGIN
    SELECT* from SearchResult
    where SearchResult.SculptureName=_Name;
    END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS getSculptureByAuthor;
DELIMITER $$
CREATE PROCEDURE  getSculptureByAuthor(IN _Name varchar(255))
    BEGIN
    SELECT * from sculpture
    where Sculpture.SculptureID=
    (SELECT sculpturehasauthor.SculptureID
    FROM sculpturehasauthor
    WHERE sculpturehasauthor.AuthorId=
    (SELECT author.AuthorId
    FROM author
    WHERE author.AuthorName=_Name));
    END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS getSculptureByDestiny;
DELIMITER $$
CREATE PROCEDURE  getSculptureByDestiny(IN _Name varchar(255))
    BEGIN
    SELECT* from sculpture
    where sculpture.DestinyID=(SELECT destiny.destinyID FROM destiny WHERE destiny.DestinyName=_Name);
    END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS getSculptureByPaint;
DELIMITER $$
CREATE PROCEDURE  getSculptureByPaint(IN _Name varchar(255))
    BEGIN
    SELECT * from sculpture
    where Sculpture.SculptureID=
    (SELECT sculpturehaspaint.SculptureID
    FROM sculpturehaspaint
    WHERE sculpturehaspaint.PaintId=
    (SELECT paintInformation.paintId
    FROM paintInformation
    WHERE paintInformation.PaintViewName=_Name));
    END$$
DELIMITER ;