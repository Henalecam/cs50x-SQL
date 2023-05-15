-- Keep a log of any SQL queries you execute as you solve the mystery.

-- I loved this one

/*On July 28th at 10:15am, a robbery occurred at Emma's bakery with 3 witnesses present.

Witness 1, Ruth, mentioned a car parked nearby and advised to check the cars
during the 10-minute timeframe of the robbery. 8 cars were observed leaving during that time.

Witness 2, Eugene, saw the suspect at the Leggett Street ATM before the robbery
withdrawing money. 8 people withdrew specific amounts of money.

Witness 3, Raymond, overheard a conversation between the suspect and at least one
accomplice. They were planning to take an early flight on July 29th to
Fiftyville, and the other person purchased the ticket. The conversation lasted less than
1 minute. 10 people had similar conversations that day, but the earliest possible flight
was identified and 8 people were on that flight.

We have the passport numbers, phone numbers, license plate, and bank account information
of the main suspect, Bruce, and his accomplice, Robin. */

SELECT * -- Final Answer, Below there will be walktrough and my notes
FROM people
WHERE license_plate IN (
    SELECT license_plate
    FROM bakery_security_logs -- Checking RUTH interview
    WHERE month = 7
    AND day = 28
    AND hour = 10
    AND minute
    BETWEEN 15 AND 25
) AND phone_number IN (
    SELECT caller -- Checking RAYMOND interview PHONE CALL
    FROM phone_calls
    WHERE month = 7
    AND day = 28
    AND duration BETWEEN 0 AND 60
) AND passport_number IN (
    SELECT passport_number -- Checking how many flying
    FROM passengers
    WHERE flight_id = 36
) AND id IN (
    SELECT person_id
    FROM bank_accounts
    WHERE account_number IN (
        SELECT account_number -- Checking EUGENE interview
        FROM atm_transactions
        WHERE month = 7 AND day = 28
        AND transaction_type = 'withdraw'
        AND atm_location = 'Leggett Street'
    )
) OR phone_number = '(375) 555-8161' -- Checking the phone_call

SELECT city -- Destination
FROM airports
WHERE id = 4

SELECT description -- Using the informations i know
FROM crime_scene_report
Where month = 7 AND day = 28
AND street = "Humphrey Street"

SELECT * -- Searching for the interviews of witnesses
FROM interviews
WHERE month = 7 AND day = 28
AND transcript LIKE '%bakery%'

SELECT * -- Checking RUTH interview
FROM bakery_security_logs
WHERE month = 7
AND day = 28
AND hour = 10
AND minute
BETWEEN 15 AND 25

SELECT * -- Checking EUGENE interview
FROM atm_transactions
WHERE month = 7 AND day = 28
AND transaction_type = 'withdraw'
AND atm_location = 'Leggett Street'

SELECT * -- Checking RAYMOND interview PHONE CALL
FROM phone_calls
WHERE month = 7
AND day = 28
AND duration BETWEEN 0 AND 60

SELECT * -- Checking RAYMOND interview FLIGHT
FROM flights
WHERE origin_airport_id IN (
    SELECT id FROM airports
    WHERE city = 'Fiftyville'
) AND month = 7 AND day = 29 ORDER BY hour ASC Limit 1;

SELECT * -- Checking how many flying
FROM passengers
WHERE flight_id = 36
