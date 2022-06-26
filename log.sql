-- Check what crimes happened at the given date and place 
SELECT description
FROM crime_scene_reports
WHERE year = 2021
    AND month = 7
    AND day = 28
    AND street = "Humphrey Street";
/* Known that there was three witnesses and 
they all mentioned the bakery */

-- Check the transcript of the witnesses
SELECT name, transcript
FROM interviews
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

SELECT DISTINCT(caller)
FROM phone_calls
WHERE year = 2021
    AND month = 7
    AND day = 28
    AND duration < 60;
/* Also 8 calls on the thift's date that lasted less than a minute */

/* Finding the theif whith license plates given */
-- The theif must be Bruce based on the following query
SELECT name, passport_number, phone_number, account_number
FROM people, bank_accounts
WHERE people.id = bank_accounts.person_id
    AND people.license_plate = "94KL13X";

-- Checking the phone calls log to find the accomplice
SELECT receiver
FROM phone_calls
WHERE year = 2021
    AND month = 7
    AND day = 28
    AND caller = "(367) 555-5533"
    AND duration < 60;

-- The accomplice phone number is (375) 555-8161 and his/her name is Robin
SELECT name
FROM people
WHERE phone_number = "(375) 555-8161"

-- Finding the distination they ran to
SELECT city
FROM airports
    JOIN flights ON flights.destination_airport_id = airports.id
    JOIN passengers ON flights.id = passengers.flight_id
WHERE flights.year = 2021
    AND flights.month = 7
    AND flights.day = 29
    AND passengers.passport_number = 5773159633;
/* Finally they ran to NYC */