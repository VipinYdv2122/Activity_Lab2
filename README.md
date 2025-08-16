# SQL Stored Procedures – Streaming Platform Database

## 1. GitHub Repository Link
Link: https://github.com/VipinYdv2122/Activity_Lab2


## 2. How to Execute the Scripts

### Step 1: Open MySQL
Login to MySQL using:
mysql -u root -p

### Step 2: Create a Database
CREATE DATABASE streaming;
USE streaming;

### Step 3: Run Table Creation Script
Paste and execute the "CREATE TABLE" commands from the provided SQL file.

### Step 4: Insert Sample Data
Paste and execute the "INSERT INTO" commands from the provided SQL file.

### Step 5: Create Stored Procedures
Paste the stored procedure definitions for:
1. ListAllSubscribers()
2. GetWatchHistoryBySubscriber(IN sub_id INT)
3. AddSubscriberIfNotExists(IN subName VARCHAR(100))
4. SendWatchTimeReport()
5. SubscriberWatchHistoryWithCursor()

### Step 6: Test Procedures
- CALL ListAllSubscribers();
- CALL GetWatchHistoryBySubscriber(1);
- CALL AddSubscriberIfNotExists('New User');
- CALL SendWatchTimeReport();
- CALL SubscriberWatchHistoryWithCursor();

---

## 3. Explanation of Procedures

### Q1. ListAllSubscribers()
- **Purpose:** Lists all subscriber names using a CURSOR.
- **Logic:** 
  - Cursor fetches one subscriber name at a time.
  - Each name is printed using a SELECT inside the loop.
  - Stops when no more records are found.

### Q2. GetWatchHistoryBySubscriber(IN sub_id INT)
- **Purpose:** Displays all shows watched by a given subscriber and their watch times.
- **Logic:**
  - Joins `WatchHistory` with `Shows` to match `ShowID`.
  - Filters by the given `SubscriberID` (sub_id).
  - Returns a list of show titles and watch durations.

### Q3. AddSubscriberIfNotExists(IN subName VARCHAR(100))
- **Purpose:** Adds a subscriber only if the name does not already exist.
- **Logic:**
  - Checks if `subName` exists in `Subscribers`.
  - If not found, inserts a new record with the current date.
  - If found, does nothing.

### Q4. SendWatchTimeReport()
- **Purpose:** Calls `GetWatchHistoryBySubscriber()` for each subscriber who has watched at least one show.
- **Logic:**
  - Loops through all subscribers.
  - Checks if they have any records in `WatchHistory`.
  - If yes, calls `GetWatchHistoryBySubscriber()` for that subscriber.

### Q5. SubscriberWatchHistoryWithCursor()
- **Purpose:** Loops through each subscriber using a CURSOR and prints their watch history.
- **Logic:**
  - Cursor iterates over `Subscribers`.
  - For each subscriber, calls `GetWatchHistoryBySubscriber()` internally.
  - Outputs watch history for every subscriber in sequence.

---
