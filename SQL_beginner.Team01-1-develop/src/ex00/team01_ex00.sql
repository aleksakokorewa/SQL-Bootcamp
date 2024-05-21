SELECT COALESCE(d.name, 'not defined') AS "name",
    COALESCE(d.lastname, 'not defined') AS lastname,
    d.type,
    d.volume,
    COALESCE(d2.name, 'not defined') AS currency_name,
    COALESCE(d2.rate_to_usd, 1) AS last_rate_to_usd,
    (d.volume * COALESCE(d2.rate_to_usd, 1)) AS total_volume_in_usd
FROM (
        SELECT date_u.name,
            date_u.lastname,
            balance.type,
            sum(balance.money) AS volume,
            balance.currency_id
        FROM "user" AS date_u
            FULL JOIN balance ON balance.user_id = date_u.id
        GROUP BY 1,
            2,
            3,
            5
        ORDER BY 1 DESC,
            2,
            3
    ) as d
    FULL JOIN (
        SELECT buff_1.id,
            buff_1."name",
            currency.rate_to_usd
        FROM (
                SELECT id,
                    "name",
                    max(updated) AS date_need
                FROM currency
                GROUP BY 1,
                    2
            ) AS buff_1
            JOIN currency ON buff_1.id = currency.id
            AND buff_1.date_need = currency.updated
    ) AS d2 ON d.currency_id = d2.id
ORDER BY 1 DESC,
    2,
    3;