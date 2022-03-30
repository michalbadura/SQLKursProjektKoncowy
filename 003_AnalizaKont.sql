/*
Napisz kwerendę, która uszereguje konta według następujących kryteriów:

liczba udzielonych pożyczek (malejąco),
kwota udzielonych pożyczek (malejąco),
średnia kwota pożyczki.

Pod uwagę bierzemy tylko spłacone pożyczki.
 */






WITH analiza_kont AS (
    SELECT
          account_id,
          SUM(financial3_7.loan.amount) AS "kwota udzielonych pozyczek",
          COUNT(financial3_7.loan.amount) AS "liczba udzielonych pozyczek",
          AVG(financial3_7.loan.amount) AS "srednia kwota pozyczki"
FROM financial3_7.loan
    WHERE loan.status IN ('A', 'C') -- Status pozyczki splacony A i C, niesplacony to B i D
    GROUP BY account_id
)
SELECT *,
       ROW_NUMBER() OVER (ORDER BY `kwota udzielonych pozyczek` DESC) AS "ranking kwota udzielonych pozyczek",
       ROW_NUMBER() OVER (ORDER BY `liczba udzielonych pozyczek` DESC) AS "ranking liczba udzielonych pozyczek"
FROM analiza_kont;