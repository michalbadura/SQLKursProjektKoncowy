/*
Sprawdź, ile pożyczek zostało spłaconych w podziale na płeć klienta.

Dodatkowo w wybrany przez siebie sposób sprawdź, czy kwerenda jest poprawna.
 */

SELECT * FROM financial3_7.loan;

SELECT * FROM financial3_7.account;

SELECT * FROM financial3_7.disp;

SELECT * FROM financial3_7.client;





SELECT
       c.gender,
       COUNT(l.amount) AS "splacone pozyczki"
FROM financial3_7.loan l
    INNER JOIN financial3_7.account a
        ON l.account_id = a.account_id
    INNER JOIN financial3_7.disp d
        ON a.account_id = d.account_id
    INNER JOIN financial3_7.client c
        ON c.client_id = d.client_id
WHERE l.status IN ('A', 'C')
GROUP BY c.gender;



-- SPRAWDZENIE



DROP TABLE tmp_trust_no1; -- wykonac jesli juz istnieje na bazie.


CREATE TEMPORARY TABLE tmp_trust_no1 AS
SELECT
       c.gender,
       COUNT(l.amount) AS "splacone pozyczki"
FROM financial3_7.loan l
    INNER JOIN financial3_7.account a
        ON l.account_id = a.account_id
    INNER JOIN financial3_7.disp d
        ON a.account_id = d.account_id
    INNER JOIN financial3_7.client c
        ON c.client_id = d.client_id
WHERE l.status IN ('A', 'C')
GROUP BY c.gender;


-- DOKONCZYC !!!
