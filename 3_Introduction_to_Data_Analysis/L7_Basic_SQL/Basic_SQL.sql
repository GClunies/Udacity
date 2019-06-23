
-- SELECT
-- Try writing your own query to select only the id, account_id, and occurred_at columns for all orders in the orders table
SELECT id, account_id, occurred_at
FROM orders

-- LIMIT
-- The LIMIT command is always the very last part of a query.
SELECT *    -- '*' means ALL
FROM orders
LIMIT 10;

-- Another exampls
SELECT occurred_at, account_id, channel
FROM web_events
LIMIT 15;

-- ORDER BY
--Write a query to return the 10 earliest orders in the orders table. Include the id, occurred_at, and total_amt_usd.
SELECT id, occurred_at, total_amt_usd
FROM orders
ORDER BY occurred_at
LIMIT 10;

--Write a query to return the top 5 orders in terms of largest total_amt_usd. Include the id, account_id, and total_amt_usd.
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC 
LIMIT 5;

--Write a query to return the bottom 20 orders in terms of least total. Include the id, account_id, and total.
SELECT id, account_id, total
FROM orders
ORDER BY total
LIMIT 20;

--Write a query that returns the top 5 rows from orders ordered according to newest to oldest, but with the largest total_amt_usd for each date listed first for each date. 
SELECT *
FROM orders
ORDER BY occurred_at DESC, total_amt_usd DESC 
LIMIT 5;

    --You will notice each of these dates shows up as unique because of the time element. When you learn about truncating dates in a later lesson, you will better be able to tackle this question on a day, month, or yearly basis. 

--Write a query that returns the top 10 rows from orders ordered according to oldest to newest, but with the smallest total_amt_usd for each date listed first for each date. 
SELECT *
FROM orders
ORDER BY occurred_at, total_amt_usd
LIMIT 10;


-- WHERE
--Pull the first 5 rows and all columns from the orders table that have a dollar amount of gloss_amt_usd greater than or equal to 1000.
SELECT *
FROM orders
WHERE gloss_amt_usd >= 1000
LIMIT 5;

--Pull the first 10 rows and all columns from the orders table that have a total_amt_usd less than 500.
SELECT *
FROM orders
WHERE total_amt_usd < 500
LIMIT 10;

--WHERE statement can also be used with non-numerical data. We can use the = and != operators here:

--Filter the accounts table to include the company name, website, and the primary point of contact (primary_poc) for Exxon Mobil in the accounts table.
SELECT name, website, primary_poc
FROM accounts
WHERE name = 'Exxon Mobil';

-- ARITMETIC OPERATORS

--Create a column that divides the standard_amt_usd by the standard_qty to find the unit price for standard paper for each order. Limit the results to the first 10 orders, and include the id and account_id fields. 

    --NOTE: You will notice that you are thrown an error because you divide by zero. We will go through CASE statements before the end of this class, so you know a work around for this error. An easy (but not totally accurate) solution would be just to add 1 to the denominator.

SELECT id, account_id, standard_amt_usd/standard_qty AS unit_price
FROM orders
LIMIT 10;

--Write a query that finds the percentage of revenue that comes from poster paper for each order. You will need to use only the columns that end with _usd. (Try to do this without using the total column). Include the id and account_id fields.  

SELECT id, account_id, 
       poster_amt_usd/(standard_amt_usd + gloss_amt_usd + poster_amt_usd) AS post_per
FROM orders;

-- LOGICAL OPERATORS

    -- LIKE
        --This allows you to perform operations similar to using WHERE and =, but for cases when you might not know exactly what you are looking for.

    -- IN
        --This allows you to perform operations similar to using WHERE and =, but for more than one condition.

    -- NOT
        --This is used with IN and LIKE to select all of the rows NOT LIKE or NOT IN a certain condition.

    -- AND & BETWEEN
        --These allow you to combine operations where all combined conditions must be true.

    -- OR
        --This allow you to combine operations where at least one of the combined conditions must be true.

--Use the accounts table to find:

    --All the companies whose names start with 'C'. 
        SELECT name
        FROM accounts
        WHERE name LIKE 'C%';

    --All companies whose names contain the string 'one' somewhere in the name.
        SELECT name
        FROM accounts
        WHERE name LIKE '%one%';

    --All companies whose names end with 's'.
        SELECT name
        FROM accounts
        WHERE name LIKE '%s';

--Use the accounts table to find the account name, primary_poc, and sales_rep_id for Walmart, Target, and Nordstrom.
SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name IN ('Walmart', 'Target', 'Nordstrom');

--Use the web_events table to find all information regarding individuals who were contacted via the channel of organic or adwords.
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords');

--Use the accounts table to find the account name, primary poc, and sales rep id for all stores except Walmart, Target, and Nordstrom.

SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom');

--Use the web_events table to find all information regarding individuals who were contacted via any method except using organic or adwords methods.

SELECT *
FROM web_events
WHERE channel NOT IN ('organic', 'adwords');

--Use the accounts table to find:

    --All the companies whose names do not start with 'C'.
        SELECT name
        FROM accounts
        WHERE name NOT LIKE 'C%';

    --All companies whose names do not contain the string 'one' somewhere in the name.
        SELECT name
        FROM accounts
        WHERE name NOT LIKE '%one%';

    --All companies whose names do not end with 's'.
        SELECT name
        FROM accounts
        WHERE name NOT LIKE '%s';

--Write a query that returns all the orders where the standard_qty is over 1000, the poster_qty is 0, and the gloss_qty is 0.
SELECT *
FROM orders
WHERE standard_qty > 1000 AND poster_qty = 0 AND gloss_qty = 0;

--Using the accounts table find all the companies whose names do not start with 'C' and end with 's'.
SELECT name
FROM accounts
WHERE name NOT LIKE 'C%' AND name LIKE '%s';

--Use the web_events table to find all information regarding individuals who were contacted via organic or adwords and started their account at any point in 2016 sorted from newest to oldest.
    --You will notice that using BETWEEN is tricky for dates! While BETWEEN is generally inclusive of endpoints, it assumes the time is at 00:00:00 (i.e. midnight) for dates. This is the reason why we set the right-side endpoint of the period at '2017-01-01'.
        SELECT *
        FROM web_events
        WHERE channel IN ('organic', 'adwords') AND occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
        ORDER BY occurred_at DESC;

--Find list of orders ids where either gloss_qty or poster_qty is greater than 4000. Only include the id field in the resulting table.
SELECT id
FROM orders
WHERE gloss_qty > 4000 OR poster_qty > 4000;

--Write a query that returns a list of orders where the standard_qty is zero and either the gloss_qty or poster_qty is over 1000.
SELECT *
FROM orders
WHERE standard_qty = 0 AND (gloss_qty > 1000 OR poster_qty > 1000);

--Find all the company names that start with a 'C' or 'W', and the primary contact contains 'ana' or 'Ana', but it doesn't contain 'eana'.
SELECT *
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%') 
           AND ((primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%') 
           AND primary_poc NOT LIKE '%eana%');