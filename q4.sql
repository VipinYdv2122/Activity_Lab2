use db;
DELIMITER $$

CREATE PROCEDURE SendWatchTimeReport()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE subID INT;

    DECLARE cur CURSOR FOR
        SELECT DISTINCT SubscriberID
        FROM WatchHistory;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    loop_subs: LOOP
        FETCH cur INTO subID;
        IF done THEN
            LEAVE loop_subs;
        END IF;
        CALL GetWatchHistoryBySubscriber(subID);
    END LOOP;

    CLOSE cur;
END$$

DELIMITER ;
