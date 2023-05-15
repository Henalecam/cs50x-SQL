SELECT *
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
)