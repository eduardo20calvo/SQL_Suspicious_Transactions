CREATE TABLE card_holder (
    id INT PRIMARY KEY,
    name VARCHAR
);

CREATE TABLE credit_card (
    card VARCHAR(20) PRIMARY KEY,
    cardholder_id INT references card_holder(id)
);

CREATE TABLE merchant (
    id INT PRIMARY KEY,
    name VARCHAR,
    id_merchant_category INT references merchant_category(id)
);

CREATE TABLE merchant_category (
    id INT PRIMARY KEY,s
    name VARCHAR
);

CREATE TABLE "transaction" (
    id INT PRIMARY KEY,
    date TIMESTAMP,
    amount FLOAT,
    card VARCHAR(20) references credit_card(card),
    id_merchant INT references merchant(id)
);

SELECT *
from card_holder

SELECT *
from credit_card

SELECT *
from merchant

SELECT *
from merchant_category

SELECT *
from transaction