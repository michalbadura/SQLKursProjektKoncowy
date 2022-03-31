/*
Napisz zapytanie, które przygotuje podsumowanie z udzielanych kredytów w następujących wymiarach:

rok, kwartał, miesiąc,
rok, kwartał,
rok,
sumarycznie.

Jako wynik podsumowania wyświetl następujące informacje:

sumaryczna kwota pożyczek,
średnia kwota pożyczki,
całkowita liczba udzielonych pożyczek.
 */


 SELECT
    extract(YEAR FROM date) as loan_year,
    extract(QUARTER FROM date) as loan_quarter,
    extract(MONTH FROM date) as loan_month,
    sum(payments) as loans_total,
    avg(payments) as loans_avg,
    count(payments) as loans_count
FROM financial3_7.loan
GROUP BY 1, 2, 3 WITH ROLLUP
ORDER BY 1, 2, 3