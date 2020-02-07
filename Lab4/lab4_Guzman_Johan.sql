-- Lab 1                                  CS 166 Database Management Systems     
-- Johan Guzman Avalos                    Instructor: M. Salloum 
-- ID 861312308                           TA: Ahmed, Pritom
-- Section 22
-- jguzm022@cs.edu
-- January 31, 2020

-------------- Query 1 -------------- 
SELECT B.Year, B.Title
FROM BOOKS B;

-------------- Query 2 -------------- 
SELECT * 
FROM STUDENTS S
WHERE S.Major = 'CS';

-------------- Query 3 -------------- 
SELECT S.StID, S.StName, B.DocID, B.Title
FROM STUDENTS S, BOOKS B

-------------- Query 4 -------------- 
SELECT *    
FROM BOOKS B
WHERE B.Publihser = 'McGraw-Hill' AND B.Year < 1990;

-------------- Query 5 -------------- 
SELECT A.AName
FROM AUTHORS A
WHERE A.Address LIKE '%Davis%'

-------------- Query 6 -------------- 
Select S.StName
FROM STUDENTS S
WHERE S.Age > 30 AND S.Major <> 'CS';

-------------- Query 7 -------------- 
ALTER TABLE AUTHOR 
RENAME COLUMN AName TO Name;

-------------- Query 8 -------------- 
SELECT S.StName
FROM STUDENTS S, BORROWS B
WHERE S.stID = B.StID AND S.Major = 'CS'

--------------Another way-------------
SELECT S.StName
FROM STUDENTS S, BORROWS B
WHERE S.Major = 'CS' AND S.StID in (SELECT B.StID
                                    FROM BORROWS B);

-------------- Query 9 -------------- 
SELECT B.Title
FROM BOOKS B, has-writtern H
WHERE B.DocID = H.DocID AND H.AName = 'Jones'

-------------- Query 10 -------------- 

SELECT B.Title
FROM BOOKS B, has-writtern H
WHERE B.DocID = H.DocID AND H.AName = 'Jones' AND B.DocID NOT IN ( Select D.DocID
                                                                    FROM describes D
                                                                    Where D.keyword = 'Database');

-------------- Query 11 -------------- 
SELECT S.StName
FROM STUDENTS S
WHERE S.Age = (SELECT MIN(S2.Age)
                FROM STUDENTS S2);

--------------Another way-------------

SELECT S.StName
FROM STUDENTS S
WHERE S.Age <= ALL (SELECT S2.AGE
                    FROM STUDENTS S2 )
-------------- Query 12 -------------- 

SELECT B.Title
FROM BOOKS B
WHERE B.Year = (SELECT MAX(B2.Year)
                FROM BOOKS B2);