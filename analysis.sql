-- Consumer Credit Card Spend Analysis

-- Q1. What is the average credit limit?

SELECT AVG(credit_limit) AS avg_credit_limit
FROM customer;

# avg_credit_limit
284700.61


-- Q2. Which type of credit card is most commonly held by customers?

SELECT card_type, COUNT(*) AS frequency
FROM customer
GROUP BY card_type
ORDER BY count DESC
LIMIT 1;

# card_type, frequency
Gold, 38


-- Q3. What is the average age of credit card holders?

SELECT ROUND(AVG(age)) AS avg_age
FROM customer

# avg_age
46


-- Q4. What is the most common spending category?

SELECT product_type, COUNT(*) AS frequency
FROM spend
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

# product, frequency
PETROL, 200


-- Q5. Show the month-wise spend across the years in descending order.

SELECT MONTHNAME(date) AS month, ROUND(SUM(amount)) AS amount_spend
FROM spend
GROUP BY month
ORDER BY amount_spend DESC;

# month, amount_spend
January, 89421176
March, 56885086
February, 55462858
May, 50668175
April, 35500777
November, 20924385
June, 13514434
July, 11257776
August, 9914366
September, 9213535
October, 6029870
December, 5851637


-- Q6. What is the average spend per category?

SELECT product_type, ROUND(AVG(amount)) AS avg_spent
FROM spend
GROUP BY product_type
ORDER BY avg_spent DESC;

# product_type, avg_spent
CLOTHES, 259485
CAMERA, 259260
MOVIE TICKET, 258485
TRAIN TICKET, 250508
SHOPPING, 249649
PETROL, 249316
BUS TICKET, 248028
CAR, 242677
FOOD, 236083
BIKE, 235737
JEWELLERY, 234130
SANDALS, 228973
AIR TICKET, 224187
RENTAL, 223016
AUTO, 200202


-- Q7. What is the average no. of transactions per month?

SELECT MONTHNAME(date) AS month, COUNT(*) AS transaction
FROM spend
GROUP BY month
ORDER BY transaction DESC;

# month, transaction
January, 349
February, 238
March, 231
May, 210
April, 150
November, 84
June, 56
July, 42
August, 42
September, 42
October, 28
December, 28


-- Q8. List the top 5 cities with the highest amount spent along with their no. of transactions.

WITH top_customers AS (
SELECT customer_id, ROUND(SUM(amount)) AS amount, COUNT(*) AS transaction 
FROM spend
GROUP BY customer_id
ORDER BY amount DESC
)
SELECT city, SUM(amount) AS amount, SUM(transaction) AS transactions
FROM top_customers AS tc
JOIN customer ON customer.customer_id = tc.customer_id
GROUP BY 1
ORDER BY 2 DESC, 3 DESC
LIMIT 5;

# city, amount, transactions
COCHIN, 73495349, 298
BANGALORE, 69342631, 299
CALCUTTA, 64415762, 251
MUMBAI, 50828266, 215
CHENNAI, 32674989, 130


-- Q9. List the card types and the amount spent with them over the years.

WITH cust AS (
SELECT customer_id, SUM(amount) AS amount
FROM spend
GROUP BY customer_id
ORDER BY amount DESC
)
SELECT card_type, ROUND(SUM(amount)) AS amount
FROM (SELECT cust.customer_id, card_type, amount
		FROM cust
		JOIN customer ON customer.customer_id = cust.customer_id) as cards
GROUP BY card_type
ORDER BY amount DESC;

# card_type, amount
Gold, 146200355
Platinum, 141314753
Silver, 77128966


-- Q10. Which is the most commonly used credit card type?

WITH cust AS (
SELECT customer_id, COUNT(*) AS transactions
FROM spend
GROUP BY customer_id
ORDER BY transactions DESC
)
SELECT card_type, SUM(transactions) AS transactions
FROM (SELECT cust.customer_id, card_type, transactions
		FROM cust
		JOIN customer ON customer.customer_id = cust.customer_id) as cards
GROUP BY card_type
ORDER BY transactions DESC;

# card_type, transactions
Gold, 610
Platinum, 570
Silver, 320


-- Q11. What is the average no. of days a customer pays off their credit card bill?

WITH bill AS (
SELECT spend.customer_id, 
	MAX(spend.date) AS spend_date, 
	MAX(repayment.date) AS repayment_date, 
	ABS(DATEDIFF(MAX(repayment.date), MAX(spend.date))) AS days
FROM spend
JOIN customer ON customer.customer_id = spend.customer_id
JOIN repayment ON repayment.customer_id = customer.customer_id
GROUP BY 1
)
SELECT ROUND(AVG(days)) AS avg_days
FROM bill;

# avg_days
62


-- Q12. What is the rate of late-paying customers, assume the no. of days to pay off the bill is 30 days.

WITH bill AS (
SELECT spend.customer_id,
	MAX(spend.date) AS spend_date, 
	MAX(repayment.date) AS repayment_date, 
	ABS(DATEDIFF(MAX(repayment.date), 
	MAX(spend.date))) AS days
FROM spend
JOIN customer ON customer.customer_id = spend.customer_id
JOIN repayment ON repayment.customer_id = customer.customer_id
GROUP BY 1
)
SELECT CONCAT(ROUND(100 * COUNT(*) / (SELECT COUNT(*) FROM CUSTOMER)), '%') AS late_payment
FROM bill
WHERE days > 30;

# late_payment
46%


-- Q13. Show the customer base city-wise in descending order.

SELECT city, COUNT(customer_id) AS customer
FROM customer 
GROUP BY city
ORDER BY customer DESC;

# city, customer
COCHIN, 20
BANGALORE, 19
CALCUTTA, 18
MUMBAI, 14
CHENNAI, 8
DELHI, 7
PATNA, 7
TRIVANDRUM, 7


-- Q14. What is the spending range of each customer?

SELECT customer_id, CONCAT(MAX(amount), ' - ', MIN(amount)) AS spending_range
FROM spend
GROUP BY customer_id;

-- customer_id, spending_range
A1, 485470.8 - 23370.2
A10, 498388.88 - 10615.48
A100, 224786.88 - 224786.88
A11, 483603.21 - 45366.66
A12, 497770.15 - 24218.26
A13, 481870.34 - 25860.69
A14, 474714.13 - 9509.6
A15, 496915.29 - 3750.13
A16, 454862.62 - 2845.76
A17, 457931.43 - 11938.81
A18, 478891.22 - 15237.44
A19, 467517.17 - 68610.51
A2, 439648.53 - 75728.35
A20, 472065.9 - 26142.18
A21, 496358.65 - 7215.93
A22, 475953.8 - 8987.04
A23, 480300.25 - 26965.4
A24, 462995.84 - 30320.99
A25, 498505.03 - 23294.48
A26, 492859.63 - 6588.51
A27, 495380.87 - 8752.13
A28, 433938.24 - 3411.29
A29, 443887.97 - 18877.48
A3, 491710.5 - 16375.23
A30, 486794.37 - 720.3
A31, 471605.19 - 66243.39
A32, 433634.64 - 27775.52
A33, 463760.44 - 23275.87
A34, 498239.75 - 6253.94
A35, 476580.37 - 65398.35
A36, 496072.76 - 8391.95
A37, 465683.38 - 972.66
A38, 467923.97 - 63717.23
A39, 485795.37 - 55927.32
A4, 497348.05 - 23040.07
A40, 499270 - 31688.89
A41, 490167.49 - 42447.06
A42, 472948.31 - 7893.31
A43, 458181.61 - 2050.46
A44, 461242.82 - 8515.14
A45, 491753.36 - 7553.18
A46, 494080.27 - 19186.72
A47, 499793.49 - 18323.16
A48, 433240.56 - 20190.85
A49, 496680.91 - 19535.76
A5, 413858.41 - 10763.44
A50, 429836.26 - 8168.97
A51, 485688.73 - 12330.03
A52, 498834.63 - 40531.37
A53, 488399.04 - 19618.01
A54, 494457.44 - 91140.13
A55, 496185.13 - 15199.55
A56, 497368.07 - 22463.65
A57, 426980.66 - 13756.3
A58, 465473.69 - 62814.73
A59, 495771.8 - 30563.8
A6, 498734.85 - 18162.3
A60, 494568.87 - 4977.49
A61, 487680.73 - 3313.37
A62, 481412.75 - 16782.6
A63, 377131.64 - 180692.76
A64, 468684.01 - 393513.71
A65, 177417.81 - 98178.42
A66, 321903.62 - 162670.43
A67, 356872.73 - 199744.78
A68, 204971.1 - 9665.48
A69, 113339.36 - 50449.44
A7, 498358.28 - 22964.17
A70, 188959.72 - 80593.94
A71, 194447.62 - 116422.06
A72, 360587.42 - 360587.42
A73, 47380.56 - 47380.56
A74, 216681.9 - 216681.9
A75, 217827.88 - 217827.88
A76, 30066.44 - 30066.44
A77, 31048.93 - 31048.93
A78, 432217.57 - 432217.57
A79, 405913.14 - 405913.14
A8, 470561.03 - 27596.71
A80, 474797.3 - 474797.3
A81, 175659.72 - 175659.72
A82, 379401.53 - 379401.53
A83, 177942.07 - 177942.07
A84, 124861.57 - 124861.57
A85, 398873.75 - 398873.75
A86, 166438.62 - 166438.62
A87, 483886.62 - 483886.62
A88, 26518.91 - 26518.91
A89, 24972.02 - 24972.02
A9, 489715.08 - 14500.38
A90, 264882.27 - 264882.27
A91, 89951.84 - 89951.84
A92, 341858.87 - 341858.87
A93, 297505.09 - 297505.09
A94, 312714.37 - 312714.37
A95, 240401.5 - 240401.5
A96, 54729.66 - 54729.66
A97, 139018.26 - 139018.26
A98, 284521.06 - 284521.06
A99, 90184.22 - 90184.22

