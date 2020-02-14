SELECT S.sname, COUNT(*)
FROM suppliers S, parts P, catalog C
WHERE S.sid = C.sid AND P.pid = C.pid
GROUP BY S.sname;

SELECT S.sname, COUNT(*)
FROM suppliers S, parts P, catalog C
WHERE S.sid = C.sid AND P.pid = C.pid
GROUP BY S.sname
HAVING COUNT(*) >= 3;


SELECT S.sname, COUNT(*)
FROM suppliers S, parts P, catalog C
WHERE S.sid = C.sid AND P.pid = C.pid AND P.color = 'Green'
GROUP BY S.sname;


SELECT MAX(C0.cost)
FROM catalog C0
WHERE C0.sid IN ( 

SELECT S.sid
FROM suppliers S, parts P, catalog C
WHERE S.sid = C.sid AND P.pid = C.pid AND P.color = 'Green'

INTERSECT 

SELECT S.sid
FROM suppliers S, parts P, catalog C
WHERE S.sid = C.sid AND P.pid = C.pid AND P.color = 'Red');


