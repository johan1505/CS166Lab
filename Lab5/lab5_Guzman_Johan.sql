
-----------------Query 1-----------------
SELECT P.pid
fROM parts P, catalog C
wHERE P.pid = C.pid AND C.cost < 10;

-----------------Query 2------------------
SELECT P.pname
fROM parts P, catalog C
wHERE P.pid = C.pid AND C.cost < 10;

----------------Query 3------------------
SELECT S.address
FROM suppliers S, parts P, catalog C
WHERE C.sid = S.sid AND P.pid = C.pid AND P.pname = 'Fire Hydrant Cap';

---------------Query 4------------------
SELECT S.sname
FROM suppliers S, parts P, catalog C
WHERE C.sid = S.sid AND P.pid = C.pid AND P.color = 'Green';

--------------Query 5-------------------
SELECT DISTINCT S.sname, P.pname
FROM suppliers S, parts P, catalog C
WHERE C.sid = S.sid AND P.pid = C.pid
GROUP BY S.sname, P.pname;


