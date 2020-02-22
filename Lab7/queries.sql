-- Query 1

SELECT COUNT(*)
FROM part_nyc
WHERE on_hand > 70;

-- Query 2
SELECT 
(SELECT SUM(P_SFO.on_hand)
FROM part_sfo P_SFO, color C
WHERE P_SFO.color = C.color_id AND C.color_name	= 'Red') +

(SELECT SUM(P_NYC.on_hand)
FROM part_nyc P_NYC, color C
WHERE P_NYC.color = C.color_id AND C.color_name = 'Red')

AS TOTAL_COUNT;

-- Query 3
--SELECT S.supplier_id, S.supplier_name, SUM(P_NYC.on_hand) AS Total_parts_NYC
--FROM supplier S, part_nyc P_NYC
--WHERE P_NYC.supplier = S.supplier_id AND Total_parts_NYC > (SELECT SUM(P_SFO.on_hand)
--							FROM  part_sfo P_SFO
--							WHERE P_SFO.supplier = S.supplier_id)
--GROUP BY S.supplier_id, S.supplier_name;


--GROUP BY S.supplier_id, S.supplier_name;

--SELECT S.supplier_id, S.supplier_name, SUM(P_SFO.on_hand) AS Total_parts_SFO
--FROM supplier S, part_sfo P_SFO
--WHERE P_SFO.supplier = S.supplier_id
--GROUP BY S.supplier_id, S.supplier_name;

-- Query 4

SELECT S.supplier_name
FROM supplier S
WHERE S.supplier_id IN (
  SELECT P.supplier 
  FROM part_nyc P
  WHERE P.part_number NOT IN (SELECT part_number FROM part_sfo)
);

-- Query 5
UPDATE part_nyc 
SET on_hand = on_hand - 10;



-- Query 6
DELETE FROM part_nyc
WHERE on_hand < 30;
