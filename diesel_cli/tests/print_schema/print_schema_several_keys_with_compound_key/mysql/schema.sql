CREATE TABLE payment_card (
    id INT PRIMARY KEY,
    code VARCHAR(50) NOT NULL,
    UNIQUE(id, code)
);

CREATE TABLE transaction_one (
    id INT PRIMARY KEY,
    card_code VARCHAR(50) NOT NULL,
    payment_card_id INT NOT NULL,
    by_card_id INT NOT NULL REFERENCES payment_card(id),
    FOREIGN KEY (payment_card_id, card_code)
    REFERENCES payment_card (id, code)
);

-- The only difference between transaction_one and transaction_two is the order of the 2nd and 3rd columns.
-- Note that because of that, the joinable will be different!
CREATE TABLE transaction_two (
    id INT PRIMARY KEY,
    payment_card_id INT NOT NULL,
    card_code VARCHAR(50) NOT NULL,
    FOREIGN KEY (payment_card_id, card_code)
    REFERENCES payment_card (id, code)
);
