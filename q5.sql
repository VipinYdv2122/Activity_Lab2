use db;
DELIMITER $$

CREATE PROCEDURE ShowAllSubscribersWatchHistory()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE subID INT;

    DECLARE cur CURSOR FOR SELECT SubscriberID FROM Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    sub_loop: LOOP
        FETCH cur INTO subID;
        IF done THEN
            LEAVE sub_loop;
        END IF;

        -- Show subscriber name
        SELECT SubscriberName 
        FROM Subscribers 
        WHERE SubscriberID = subID;

        -- Show watch history
        CALL GetWatchHistoryBySubscriber(subID);
    END LOOP;

    CLOSE cur;
END$$

DELIMITER ;
