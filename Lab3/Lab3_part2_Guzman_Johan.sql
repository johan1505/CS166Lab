---------------------------------- Part 2 ----------------------------------
DROP TABLE IF EXISTS Musician, Instrument, Plays, Album, Song, Perform, Place, Telephone, Lives;

-- Musician (ssn: string, name: string)
CREATE TABLE Musician(
    ssn CHAR(11) NOT NULL,
    name CHAR(150) NOT NULL,
    PRIMARY KEY (ssn)
);

-- Instrument (instID: integer, name: string, instKey: string)
CREATE TABLE Instrument(
    instID INT NOT NULL,
    name CHAR(30) NOT NULL, 
    instKey CHAR(1) NOT NULL,
    PRIMARY KEY (instID)
);

-- Plays (ssn: string, instID: integer)
CREATE TABLE Plays(
    ssn CHAR(11) NOT NULL,  
    instID INT NOT NULL,
    PRIMARY KEY(ssn, instID),
    FOREIGN KEY (ssn) REFERENCES Musician(ssn),
    FOREIGN KEY (instID) REFERENCES Instrument(instID),
);


-- Album (albumID: integer, copyrightDate: date, speed: decimal, title: string)
CREATE TABLE Album(
    albumID INT NOT NULL,
    ssn CHAR(11) NOT NULL,
    title CHAR(200) NOT NULL,
    copyrightDate DATE,
    speed DECIMAL,
    PRIMARY KEY (albumID),
    FOREIGN KEY (ssn) REFERENCES Musician (ssn)
);


-- Song (songID: integer, title: string, author: string)
CREATE TABLE Song (
    songID INT NOT NULL,
    albumID INT NOT NULL,
    title CHAR(200) NOT NULL,
    author CHAR(200) NOT NULL,
    PRIMARY KEY (songID),
    FOREIGN KEY (albumID) REFERENCES Album(albumID)
);

-- Perform (ssn: string, songID: integer)

CREATE TABLE Perform(
    ssn CHAR(11) NOT NULL,
    songID INTEGER NOT NULL,
    PRIMARY KEY (ssn, songID),
    FOREIGN KEY (ssn) REFERENCES Musician,
    FOREIGN KEY (songID) REFERENCES Song 
);

-- Place (address: string)
CREATE TABLE Place(
    address CHAR(200) NOT NULL
    PRIMARY KEY (address)
);

-- Telephone (phone_no: integer)
CREATE TABLE Telephone(
    phone_no INTEGER NOT NULL,
    address CHAR(200) NOT NULL,
    PRIMARY KEY (address, phone_no),
    FOREIGN KEY (address) REFERENCES Place(address)
    --If a address is deleted, its dependent phone will also be deleted     
    ON DELETE CASCADE
);

-- Lives (ssn: string, address: string)
CREATE TABLE Lives(
    musician_ssn CHAR(11) NOT NULL,
    address CHAR(200) NOT NULL,
    PRIMARY KEY (musician_ssn, address),
    FOREIGN KEY (musician_ssn) REFERENCES Musician(ssn), 
    FOREIGN KEY (address) REFERENCES Place(address)
);