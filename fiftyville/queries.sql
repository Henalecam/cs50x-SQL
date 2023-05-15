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
