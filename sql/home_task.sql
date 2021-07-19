SELECT  SUM("quantity") AS "sold tel" FROM phones_to_orders;
/* */
SELECT SUM("quantity") AS "total tel" FROM phones;
/* */
SELECT AVG("price") AS "average price" FROM phones;
/* */
SELECT "brand", AVG("price") AS "average price" FROM phones
GROUP BY "brand";
/* */
SELECT "brand", "model", SUM("quantity") AS "average price" FROM phones
GROUP BY "brand","model"
ORDER BY "brand";
/* */
SELECT "userId",  COUNT("id") FROM orders
GROUP BY "userId"
ORDER BY "userId";
/* */
SELECT AVG("price") FROM phones
WHERE "brand"= 'Iphone';
/* */
SELECT * FROM phones
WHERE "price" > 10000 AND "price" < 20000;
/* */
SELECT "brand", SUM("quantity") AS "min" FROM phones
GROUP BY "brand"
ORDER BY "min"
LIMIT 3;
/* */
SELECT "Age","firstname"
FROM (
    SELECT EXTRACT(
        YEAR
        FROM AGE("birthday")
      ) AS "Age",
      *
    FROM "users"
  ) AS "users_with_age"
GROUP BY "Age","firstname"
ORDER BY "Age","firstname";
/* */
SELECT * FROM phones AS p
JOIN phones_to_orders  AS pto ON p.id= pto."phoneId"
WHERE pto."orderId" = 4;
/* */
SELECT 
  u.firstname,
  u.email,
  COUNT(o.id) AS "Total"
FROM users AS u
  LEFT JOIN orders AS o ON u.id = o."userId"
GROUP BY u.firstname,
  u.email;
  /* */
SELECT p.*
FROM phones AS p
  JOIN phones_to_orders AS pto ON p.id = pto."phoneId"
  ORDER BY pto.quantity DESC
  LIMIT 1;