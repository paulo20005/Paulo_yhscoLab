-- några queries för att testa databasen

-- Visa alla studenter
SELECT * FROM Student;


-- Visa alla klasser med deras program:
SELECT k.klass_namn, p.program_namn 
FROM Klass k
JOIN Program p ON k.program_id = p.program_id;

-- visa alla konsulter med deras timarvode
SELECT u.förnamn, u.efternamn, f.foretagsnamn, k.timarvode 
FROM Konsult k
JOIN Utbildare u ON k.utbildare_id = u.utbildare_id
JOIN Företag f ON k.foretag_id = f.foretag_id;


