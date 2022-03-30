/*
Napisz kwerendę, która uszereguje konta według następujących kryteriów:

liczba udzielonych pożyczek (malejąco),
kwota udzielonych pożyczek (malejąco),
średnia kwota pożyczki.

Pod uwagę bierzemy tylko spłacone pożyczki.
 */


SELECT account_id,
       COUNT(financial3_7.loan.loan_id) AS "liczba udzielonych pozyczek",
       SUM(financial3_7.loan.amount)AS "kwota udzielonych pozyczek",
       AVG(financial3_7.loan.amount)AS "srednia kwota pozyczki"
FROM financial3_7.loan
WHERE loan.status IN ('A', 'C')                -- Status pozyczki splacony A i C, niesplacony to B i D
GROUP BY account_id;