CREATE VIEW num_cardholder_transactions AS
SELECT ch.name, cc.card, COUNT(t.amount)
FROM card_holder AS ch
INNER JOIN credit_card AS cc   --- Number of transactions per cardholder
ON ch.id = cc.cardholder_id
INNER JOIN transaction AS t
ON cc.card = t.card
GROUP BY ch.name, cc.card;

CREATE VIEW trans_less_two AS
SELECT ch.name, cc.card, COUNT(t.amount)
FROM card_holder AS ch
INNER JOIN credit_card AS cc   --- Number of tranasctions per cardholder with amount less than 2 dollars
ON ch.id = cc.cardholder_id        
INNER JOIN transaction AS t
ON cc.card = t.card
WHERE t.amount < 2
GROUP BY ch.name, cc.card
ORDER BY COUNT(t.amount) DESC;

CREATE VIEW trans_bet_seven_nine AS
SELECT ch.name, cc.card, t.amount, date_trunc('hour',t.date)
FROM card_holder AS ch
INNER JOIN credit_card AS cc   --- Transactions per cardholder with amount less than 2 dollars and between 7am - 9am
ON ch.id = cc.cardholder_id
INNER JOIN transaction AS t
ON cc.card = t.card
WHERE t.amount < 2
AND EXTRACT(HOUR FROM t.date) BETWEEN 7 AND 9
ORDER BY name;

CREATE VIEW trans_not_seven_nine AS
SELECT ch.name, cc.card, t.amount, date_trunc('hour',t.date)
FROM card_holder AS ch
INNER JOIN credit_card AS cc   --- All transactions not including results from previous query
ON ch.id = cc.cardholder_id
INNER JOIN transaction AS t
ON cc.card = t.card
WHERE t.amount < 2
AND EXTRACT(HOUR FROM t.date) NOT BETWEEN 7 AND 9
ORDER BY name;

CREATE VIEW top_5_merchants AS
SELECT m.name, COUNT(t.amount)
FROM transaction AS t
INNER JOIN merchant AS m   --- The top 5 merchants with most transactions
ON t.id_merchant = m.id
WHERE t.amount < 2
GROUP BY m.name
ORDER BY COUNT(t.amount) DESC
LIMIT 5;
