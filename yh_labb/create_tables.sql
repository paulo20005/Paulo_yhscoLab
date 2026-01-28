-- Skapa tabeller för YH-databasen
-- Tabeller måste skapas i rätt ordning för att foreign keys ska funka

-- 1. PROGRAM - behövs först eftersom Klass länkar hit
CREATE TABLE Program (
    program_id SERIAL PRIMARY KEY,
    program_namn VARCHAR(100) NOT NULL
);

-- 2. UTBILDNINGSLEDARE - behövs innan Klass
CREATE TABLE Utbildningsledare (
    ledare_id SERIAL PRIMARY KEY,
    förnamn VARCHAR(50) NOT NULL,
    efternamn VARCHAR(50) NOT NULL,
    email VARCHAR(100)
);

-- 3. KLASS - länkar till Program och Utbildningsledare
CREATE TABLE Klass (
    klass_id SERIAL PRIMARY KEY,
    klass_namn VARCHAR(50) NOT NULL,
    program_id INTEGER REFERENCES Program(program_id), 
    ledare_id INTEGER REFERENCES Utbildningsledare(ledare_id)
);

-- 4. STUDENT - länkar till Klass
CREATE TABLE Student (
    student_id SERIAL PRIMARY KEY, 
    förnamn VARCHAR(50) NOT NULL,
    efternamn VARCHAR(50) NOT NULL,
    personnummer VARCHAR(13) UNIQUE NOT NULL,
    email VARCHAR(100),
    klass_id INTEGER REFERENCES Klass(klass_id)
);

-- 5. KURS - länkar till Program
CREATE TABLE Kurs (
    kurs_id SERIAL PRIMARY KEY,
    kurs_kod VARCHAR(20) UNIQUE NOT NULL,
    kurs_namn VARCHAR(100) NOT NULL,
    poäng INTEGER NOT NULL,
    beskrivning TEXT,
    program_id INTEGER REFERENCES Program(program_id)
);

-- 6. UTBILDARE - lärare som undervisar 
CREATE TABLE Utbildare (
    utbildare_id SERIAL PRIMARY KEY,
    förnamn VARCHAR(50) NOT NULL,
    efternamn VARCHAR(50) NOT NULL,
    email VARCHAR(100)
);

-- 7. FÖRETAG - som utbildare kan vara anställda hos
CREATE TABLE Företag (
    foretag_id SERIAL PRIMARY KEY,
    organisationsnummer VARCHAR(20) UNIQUE NOT NULL,
    foretagsnamn VARCHAR(100) NOT NULL,
    adress VARCHAR(200),
    har_fskatt BOOLEAN DEFAULT FALSE
);

-- 8. KONSULT - en utbildare som jobbar via ett företag (MED TIMARVODE)
CREATE TABLE Konsult (
    konsult_id SERIAL PRIMARY KEY,
    utbildare_id INTEGER REFERENCES Utbildare(utbildare_id), -- den 
    foretag_id INTEGER REFERENCES Företag(foretag_id),
    timarvode DECIMAL(10, 2) NOT NULL,  --  
    UNIQUE(utbildare_id)
);

-- 9. UTBILDARE_KURS - kopplingstabell för M:N relation
CREATE TABLE Utbildare_Kurs (
    utbildare_id INTEGER REFERENCES Utbildare(utbildare_id),
    kurs_id INTEGER REFERENCES Kurs(kurs_id),
    PRIMARY KEY (utbildare_id, kurs_id)
);