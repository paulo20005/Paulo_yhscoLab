# Paulo_yhscoLab

# YrkesCo Database System  

## Projektbeskrivning  
En fullstack databaslösning för yrkeshögskolan YrkesCo, designad för att ersätta manuella Excel-filer med en normaliserad, säker och skalbar databas.  

---

##  Datamodell  
### **Entiteter (9 tabeller)**  
- **Student** – personuppgifter och klasskoppling  
- **Klass** – klassinfo med program- och ledarkoppling  
- **Program** – utbildningsprogram  
- **Kurs** – kursinfo med poäng och beskrivning  
- **Utbildare** – lärare som kan undervisa  
- **Utbildningsledare** – ansvarar för klasser  
- **Företag** – företagsinformation  
- **Konsult** – utbildare som konsultar via företag  
- **Utbildare_Kurs** – många-till-många mellan utbildare och kurser  

### **Nyckelfunktioner**  
## Normaliserad till 3NF  
- Separation av känslig data  
- Stöd för konsulter med timarvode  
- Flexibel för framtida expansion  

---

##  Snabbstart  

### **1. Starta databasen (Docker)**  
```bash
docker-compose up -d
cat yh_labb/create_tables.sql | docker exec -i yrkesco-db psql -U admin -d yrkesco_db

cat yh_labb/insert_data.sql | docker exec -i yrkesco-db psql -U admin -d yrkesco_db

- docker exec -it yrkesco-db psql -U admin -d yrkesco_db
docker-compose down