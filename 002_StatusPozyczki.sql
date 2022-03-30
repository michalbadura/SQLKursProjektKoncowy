/*
Na stronie bazy danych możemy znaleźć informację, że w bazie znajdują się w sumie 682 udzielone kredyty, z czego 606 zostało spłaconych, a 76 nie.

Załóżmy, że nie posiadamy informacji o tym, który status odpowiada pożyczce spłaconej, a który nie.

W takiej sytuacji musimy te informacje wywnioskować z danych.

W tym celu napisz kwerendę, za pomocą której spróbujesz odpowiedzieć na pytanie, które statusy oznaczają pożyczki spłacone, a które oznaczają pożyczki niespłacone.
 */





SELECT
       status,
       COUNT(*)
FROM financial3_7.loan
GROUP BY status;


-- Po wynikach kwerendy widac, ze statusy A i C, to pozyczka splacona. Z kolei B oraz D, to nie.
