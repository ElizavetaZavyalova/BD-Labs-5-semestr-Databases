USE CourseWork;
DROP PROCEDURE IF EXISTS getSculpturesOfAuthor;
DELIMITER $$
CREATE PROCEDURE getSculpturesOfAuthor(IN _AuthorId INT)
    BEGIN
    SELECT  SculptureName   ,
    sculpture.SculptureID   ,
    DateOfCreation ,
    SculptureDescription  ,
    AuthorCount ,
    SculptureSize  ,
    TopicID     ,
    DestinyID       ,
    TechnologiesID  FROM sculpture,SculptureHasAuthor
    where sculpture.SculptureID=SculptureHasAuthor.SculptureID
                                 AND SculptureHasAuthor.AuthorId=_AuthorId ;
    END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS  getAuthorId;
DELIMITER $$
CREATE PROCEDURE getAuthorId(IN _Name varchar(255), IN _Password varchar(255))
    BEGIN
    SELECT author.authorId FROM author
    where author.AuthorName=_Name AND author.Password=_Password;
    END$$
DELIMITER ;
call getAuthorId('eer', 'sss');