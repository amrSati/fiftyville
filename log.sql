-- Check what crimes happened at the given date and place 
SELECT description FROM crime_scene_reports
WHERE year = 2021
AND month = 7
AND day = 28
AND street = "Humphrey Street";
/* Known that there was three witnesses and 
they all mentioned the bakery */

-- Check the transcript of the witnesses
SELECT name, transcript FROM interviews
WHERE month = 7
AND transcript LIKE "%bakery%";

-- Following the witnesses stories
SELECT hour, minute, license_plate
FROM bakery_security_logs
WHERE year = 2021
AND month = 7
AND day = 28
AND hour = 10
AND (minute BETWEEN 15 AND 25)
AND activity = "exit";
/* Came out with 8 possible suspects whome exited the bakery's parking lot */

SELECT account_number, amount
FROM atm_transactions
WHERE year = 2021
AND month = 7
AND day = 28
AND atm_location = "Leggett Street"
AND transaction_type = "withdraw";
/* There is 8 transactions occured on Leggett st. on the thift's date */

SELECT DISTINCT(caller) FROM phone_calls
WHERE year = 2021
AND month = 7
AND day = 28
AND duration < 60;
/* Also 8 calls on the thift's date that lasted less than a minute */

