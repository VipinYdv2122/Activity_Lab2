use db;
DELIMITER $$

CREATE PROCEDURE ListAllSubscribers()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE subName VARCHAR(100);

    -- Declare cursor for subscriber names
    DECLARE cur CURSOR FOR
        SELECT SubscriberName FROM Subscribers;

    -- Handler for when no more rows
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO subName;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Print subscriber name each time
        SELECT subName AS Subscriber;
    END LOOP;

    CLOSE cur;
END$$

DELIMITER ;
