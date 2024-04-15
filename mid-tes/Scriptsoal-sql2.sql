CREATE TABLE item_bought (
    buyer TEXT NOT NULL,
    item TEXT NOT NULL
);

INSERT INTO item_bought (buyer, item) VALUES
('A', 'Asus'),
('B', 'Lenovo'),
('C', 'Lenovo'),
('D', 'Acer'),
('E', 'Acer'),
('F', 'Acer');

SELECT item
FROM (
    SELECT item, COUNT(*) AS total
    FROM item_bought
    GROUP BY item
) AS counts
WHERE total != (SELECT MAX(total) FROM (
                    SELECT COUNT(*) AS total
                    FROM item_bought
                    GROUP BY item
                ) AS subquery)
AND total != (SELECT MIN(total) FROM (
                    SELECT COUNT(*) AS total
                    FROM item_bought
                    GROUP BY item
                ) AS subquery);
