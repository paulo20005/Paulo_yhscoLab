-- INSERT FAKEDATA FÖR YRKESCO DATABAS

-- 1. PROGRAM
INSERT INTO Program (program_namn) VALUES 
('Programmering'),
('Design'),
('Data Science');

-- 2. UTBILDNINGSLEDARE
INSERT INTO Utbildningsledare (förnamn, efternamn, email) VALUES
('Lionel', 'Messi', 'lionel.messi@yrkesco.se'),
('Cristiano', 'Ronaldo', 'cristiano.ronaldo@yrkesco.se'),
('Zlatan', 'Ibrahimovic', 'zlatan@yrkesco.se'),
('Pep', 'Guardiola', 'pep@yrkesco.se');

-- 3. KLASS - VARJE PROGRAM HAR 3 OMGÅNGAR
INSERT INTO Klass (klass_namn, program_id, ledare_id) VALUES
-- Programmering (program_id = 1) - 3 omgångar:
('PGA21', 1, 1),  -- Programmering år 2021
('PGA22', 1, 1),  -- Programmering år 2022
('PGA23', 1, 2),  -- Programmering år 2023

-- Design (program_id = 2) - 3 omgångar:
('DGA21', 2, 2),  -- Design år 2021
('DGA22', 2, 3),  -- Design år 2022
('DGA23', 2, 3),  -- Design år 2023

-- Data Science (program_id = 3) - 3 omgångar:
('DSA21', 3, 4),  -- Data Science år 2021
('DSA22', 3, 4),  -- Data Science år 2022
('DSA23', 3, 1);  -- Data Science år 2023

-- 4. STUDENT
INSERT INTO Student (förnamn, efternamn, personnummer, email, klass_id) VALUES
-- PGA21:
('Kalle', 'Karlsson', '20000101-5678', 'kalle@email.com', 1),
('Erik', 'Johansson', '19991231-1111', 'erik@email.com', 1),

-- PGA22:
('Anna', 'Andersson', '19991212-9999', 'anna@email.com', 2),
('Sven', 'Svensson', '20000202-2422', 'sven@email.com', 2),

-- PGA23:
('Lisa', 'Svensson', '20000303-6666', 'lisa@email.com', 3),
('Johan', 'Nilsson', '19601111-3333', 'johan@email.com', 3),

-- DGA21:
('Paulo', 'Alnasr', '20050722-1234', 'paulo@email.com', 4),
('Maria', 'Garcia', '20010615-4444', 'maria@email.com', 4),

-- DGA22:
('Emma', 'Johansson', '20010202-8888', 'emma@email.com', 5),
('David', 'Nilsson', '19980808-7777', 'david@email.com', 5),

-- DGA23:
('Sara', 'Andersson', '20010707-5555', 'sara@email.com', 6),

-- DSA21:
('Omar', 'Ahmed', '19990505-6666', 'omar@email.com', 7),

-- DSA22:
('Fatima', 'Ali', '20000404-7777', 'fatima@email.com', 8),

-- DSA23:
('Ahmed', 'Hassan', '19990707-8888', 'ahmed@email.com', 9);

-- 5. KURS
INSERT INTO Kurs (kurs_kod, kurs_namn, poäng, beskrivning, program_id) VALUES
-- Programmeringskurser:
('PROG100', 'Grundläggande Programmering', 100, 'Introduktion till programmering', 1),
('DBAS100', 'Databaser', 100, 'SQL och databasdesign', 1),
('WEB100', 'Webbutveckling', 100, 'HTML, CSS, JavaScript', 1),

-- Designkurser:
('DES100', 'Grafisk design', 100, 'Photoshop/Adobe', 2),
('UX100', 'UX Design', 100, 'Användarcentrerad design', 2),
('TYP100', 'Typografi', 50, 'Bokstäver och layout', 2),

-- Data Science kurser:
('DS100', 'Data Science Grund', 100, 'Machine Learning och statistik', 3),
('PYT100', 'Python för Data Science', 100, 'Python och dataanalys', 3),
('SQL100', 'Avancerad SQL', 50, 'Komplexa databasfrågor', 3);

-- 6. UTBILDARE
INSERT INTO Utbildare (förnamn, efternamn, email) VALUES
('Debbi', 'Lau', 'debbi@yrkesco.se'),
('Kochcun', 'Kochun', 'kochcun@yrkesco.se'),
('Maria', 'Garcia', 'maria@yrkesco.se'),
('Omar', 'Ahmed', 'omar@yrkesco.se'),
('Sofia', 'Andersson', 'sofia@yrkesco.se'),
('Tom', 'Wilson', 'tom@yrkesco.se');

-- 7. FÖRETAG
INSERT INTO Företag (organisationsnummer, foretagsnamn, adress, har_fskatt) VALUES
('556123-1234', 'TEAM PLATINA', 'Storgatan 1, Stockholm', TRUE),
('123456-7890', 'infobyte ab', 'Teknikvägen 5, Göteborg', FALSE),
('987654-3210', 'Design Studio AB', 'Kreativvägen 7, Malmö', TRUE);

-- 8. KONSULT - MED TIMARVODE
INSERT INTO Konsult (utbildare_id, foretag_id, timarvode) VALUES
(2, 1, 850.00),  -- Kochcun hos IT-Konsulterna, 850 kr/tim
(4, 3, 750.50);  -- Omar hos Design Studio AB, 750.50 kr/tim

-- 9. UTBILDARE_KURS
INSERT INTO Utbildare_Kurs (utbildare_id, kurs_id) VALUES
(1, 1), (1, 2),  -- Debbi: Programmering och Databaser
(2, 2), (2, 7),  -- Kochcun: Databaser och Data Science
(3, 4), (3, 5),  -- Maria: Grafisk design och UX
(4, 1),          -- Omar: Programmering
(5, 6), (5, 8),  -- Sofia: Typografi och Python
(6, 3), (6, 9);  -- Tom: Webbutveckling och Avancerad SQL