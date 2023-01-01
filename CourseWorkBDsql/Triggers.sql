DROP TRIGGER IF EXISTS  SculptureHasAuthorAfterInsert;
DELIMITER $$
CREATE TRIGGER SculptureHasAuthorAfterInsert After INSERT ON SculptureHasAuthor
    FOR EACH ROW
    BEGIN
    UPDATE Sculpture
    SET Sculpture.AuthorCount=(SELECT count(*) FROM SculptureHasAuthor where SculptureHasAuthor.SculptureId=NEW.SculptureId)
    WHERE Sculpture.SculptureID=NEW.SculptureID;
    UPDATE Author
    SET Author.SculpturesCount=(SELECT count(*) FROM SculptureHasAuthor where SculptureHasAuthor.AuthorId=NEW.AuthorId)
    WHERE Author.AuthorID=NEW.AuthorID;
    END;
DELIMITER ;

DROP TRIGGER IF EXISTS  SculptureHasAuthorAfterDelete;
DELIMITER $$
CREATE TRIGGER SculptureHasAuthorAfterDelete After DELETE ON SculptureHasAuthor
    FOR EACH ROW
    BEGIN
    UPDATE Sculpture
    SET Sculpture.AuthorCount=(SELECT count(*) FROM SculptureHasAuthor where SculptureHasAuthor.SculptureId=OLD.SculptureId)
    WHERE Sculpture.SculptureID=OLD.SculptureID;
    UPDATE Author
    SET Author.SculpturesCount=(SELECT count(*) FROM SculptureHasAuthor where SculptureHasAuthor.AuthorId=OLD.AuthorId)
    WHERE Author.AuthorID=OLD.AuthorID;
    END;
DELIMITER ;

DROP TRIGGER IF EXISTS  SculptureHasAuthorAfterUpdate;
DELIMITER $$
CREATE TRIGGER SculptureHasAuthorAfterUpdate After Update ON SculptureHasAuthor
    FOR EACH ROW
    BEGIN
    UPDATE Sculpture
    SET Sculpture.AuthorCount=(SELECT count(*) FROM SculptureHasAuthor where SculptureHasAuthor.SculptureId=NEW.SculptureId)
    WHERE Sculpture.SculptureID=NEW.SculptureID;
    UPDATE Author
    SET Author.SculpturesCount=(SELECT count(*) FROM SculptureHasAuthor where SculptureHasAuthor.AuthorId=NEW.AuthorId)
    WHERE Author.AuthorID=NEW.AuthorID;
    END;
DELIMITER ;




DROP TRIGGER IF EXISTS  BeforeInsertSculpture;
DELIMITER $$
CREATE TRIGGER BeforeInsertSculpture  BEFORE INSERT ON sculpture
    FOR EACH ROW
    BEGIN
    SET NEW.DateOfCreation=NOW();
    END;
DELIMITER ;