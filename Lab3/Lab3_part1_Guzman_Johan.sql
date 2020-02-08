---------------------------------- Part 1 ----------------------------------
DROP TABLE IF EXISTS Professor, Graduate, work_proj, Project, work_in, Dept, work_dept;

-- Professor (ssn: string, name: string, age: int, rank: int, speciality: string)
CREATE TABLE Professor(
    ssn CHAR(11) NOT NULL,
    name CHAR(30) NOT NULL,
    age INTEGER,
    rank INTEGER,
    speciality CHAR(150),
    PRIMARY KEY (ssn) 
);

-- Graduate (ssn: string, name: string, age: int, rank: int, speciality: string)
CREATE TABLE Graduate(
    ssn CHAR(11) NOT NULL,
    dno INT NOT NULL,
    advisorID CHAR(11),
    name CHAR(30) NOT NULL,
    age INTEGER,
    deg_pg CHAR(150),
    PRIMARY KEY (ssn),
    -- Refereces to which department a grad student belongs to
    FOREIGN KEY (dno) REFERENCES Dept(dno),
    FOREIGN KEY (advisorID) REFERENCES Graduate(ssn)
);

-- work_proj (pno: integer, ssn: string, since: date)
CREATE TABLE work_in(
    pno INTEGER NOT NULL,
    grad_sn INTEGER NOT NULL,
    supervisor_prof_ssn INTEGER NOT NULL,
    since DATE,
    PRIMARY KEY (pno, grad_sn, supervisor_prof_ssn),
    -- Refereces to the project
    FOREIGN KEY (pno) REFERENCES Project(pno),
    -- Refereces to the graduate that works on the project
    FOREIGN KEY (grad_sn) REFERENCES Graduate(ssn),
    -- Refereces to the professor that supervises the project
    FOREIGN KEY (supervisor_prof) REFERENCES Professor(ssn)
);

-- Project (pno: integer, sponsor: string, start_date: date, end_date: date, budget: decimal)
CREATE TABLE Project(
    pno INTEGER NOT NULL,
    ssn INTEGER NOT NULL,
    sponsor CHAR(150) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    budget DECIMAL,
    PRIMARY KEY (pno),
    -- Refereces to which professor manages a specific project
    FOREIGN KEY (ssn) REFERENCES Professor(ssn)
);

-- work_in (pno: integer, sponsor: string, start_date: date, end_date: date, budget: decimal)
CREATE TABLE work_in(
    pno INTEGER NOT NULL,
    ssn INTEGER NOT NULL,
    PRIMARY KEY (pno, ssn),
    FOREIGN KEY (pno) REFERENCES Project(pno),
    FOREIGN KEY (ssn) REFERENCES Professor(ssn)
);

-- Dept (dno: integer, dname: string, office: string)
CREATE TABLE Dept(
    dno INTEGER NOT NULL,
    ssn CHAR(11) NOT NULL,
    dname CHAR(300) NOT NULL,
    office CHAR(150),
    PRIMARY KEY (dno),
    -- Refereces to which professor runs a specific department
    FOREIGN KEY (ssn) REFERENCES Professor(ssn)
);

-- work_dept (ssn: integer, dno: integer, time_pc: decimal)
CREATE TABLE work_dept(
    ssn INTEGER NOT NULL,
    dno INTEGER NOT NULL,
    time_pc DECIMAL,
    PRIMARY KEY (ssn, dno),
    FOREIGN KEY (ssn) REFERENCES Professor(ssn),
    FOREIGN KEY (dno) REFERENCES Dept(dno)
);