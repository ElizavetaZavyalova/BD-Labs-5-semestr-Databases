USE CourseWork;
DROP PROCEDURE IF EXISTS deleteSculpture;
DELIMITER $$
CREATE PROCEDURE  deleteSculpture( IN _SculptureId INT)
    BEGIN
       DELETE FROM sculpture
              WHERE sculpture.SculptureId = _SculptureId;
    END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS updateAuthor;
DELIMITER $$
CREATE PROCEDURE  updateAuthor( IN _AuthorID INT,
                                IN _Login varchar(255),
                                IN _Password varchar(255))
    BEGIN
        UPDATE author SET AuthorName=_Login,Password=_Password
                          Where AuthorID=_AuthorID;
    END$$
DELIMITER ;