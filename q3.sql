use db;
DELIMITER $$

CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(100))
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Subscribers WHERE SubscriberName = subName) THEN
        INSERT INTO Subscribers (SubscriberName, SubscriptionDate)
        VALUES (subName, CURDATE());
    ELSE
        SELECT CONCAT('Subscriber "', subName, '" already exists.') AS Message;
    END IF;
END$$

DELIMITER ;
