DROP VIEW IF EXISTS SearchResault;
CREATE VIEW SearchResult AS
SELECT SculptureId,SculptureName,SculptureDescription
FROM sculpture;
