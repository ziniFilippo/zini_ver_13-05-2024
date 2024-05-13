DROP DATABASE IF EXISTS ASSICURAZIONI;
CREATE DATABASE IF NOT EXISTS ASSICURAZIONI;
USE ASSICURAZIONI;
CREATE TABLE IF NOT EXISTS ASSICURAZIONI.ASSICURATORE (
    ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    NOMINATIVO CHAR(50)
);
CREATE TABLE IF NOT EXISTS ASSICURAZIONI.ASSICURATO(
    ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    ANAGRAFICA CHAR(50)
);
CREATE TABLE IF NOT EXISTS ASSICURAZIONI.POLIZZA(
    ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    DESCRIZIONE CHAR(255),
    IMPORTO INTEGER
);
CREATE TABLE IF NOT EXISTS ASSICURAZIONI.PREMIO(
    ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    ASSICURATORE_ID INTEGER,
    ASSICURATO_ID INTEGER,
    POLIZZA_ID INTEGER,
    ANNO INTEGER,
    TOTALE INTEGER,
    FOREIGN KEY (ASSICURATORE_ID) REFERENCES ASSICURATORE(ID),
    FOREIGN KEY (ASSICURATO_ID) REFERENCES ASSICURATO(ID),
    FOREIGN KEY (POLIZZA_ID) REFERENCES POLIZZA(ID)

);
/*
Assicuratori (codice-nominativo)
1-INA
2-Sara
3-Allianz
4-Unipol
*/
INSERT INTO ASSICURATORE(NOMINATIVO) VALUES ("INA");
INSERT INTO ASSICURATORE(NOMINATIVO) VALUES ("Sara");
INSERT INTO ASSICURATORE(NOMINATIVO) VALUES ("Allianz");
INSERT INTO ASSICURATORE(NOMINATIVO) VALUES ("Unipol");

/*
Assicurati (codice-anagrafica)
1-Tizio
2-Caio
3-Sempronio
4-Calpurnio
*/
INSERT INTO ASSICURATO(ANAGRAFICA) VALUES ("Tizio");
INSERT INTO ASSICURATO(ANAGRAFICA) VALUES ("Caio");
INSERT INTO ASSICURATO(ANAGRAFICA) VALUES ("Sempronio");
INSERT INTO ASSICURATO(ANAGRAFICA) VALUES ("Calpurnio");

/*
Contratti di assicurazione (codice-descrizione + premio annuale presso qualsiasi Assicuratore*)
1-Assicurazione Responsabilità Civile Automezzo – premio annuale 300 Euro
2-Assicurazione danneggiamento da grandine dell’automezzo – premio annuale 120 Euro
3-Assicurazione Responsabilità Civile Motociclo – premio annuale 140 Euro
4-Assicurazione a copertura danni verso terzi, abitazioni – premio annuale 220 Euro
5-Assicurazione a copertura danni abitazioni, esempio: eventi atmosferici – premio annuale 290 Euro
*/
INSERT INTO POLIZZA(DESCRIZIONE,IMPORTO) VALUES ("Assicurazione Responsabilità Civile Automezzo",300);
INSERT INTO POLIZZA(DESCRIZIONE,IMPORTO) VALUES ("Assicurazione danneggiamento da grandine dell'automezzo",120);
INSERT INTO POLIZZA(DESCRIZIONE,IMPORTO) VALUES ("Assicurazione Responsabilità Civile Motociclo",140);
INSERT INTO POLIZZA(DESCRIZIONE,IMPORTO) VALUES ("Assicurazione a copertura danni verso terzi, abitazioni",220);
INSERT INTO POLIZZA(DESCRIZIONE,IMPORTO) VALUES ("Assicurazione a copertura danni abitazioni, esempio: eventi atmosferici",290);


/*
Tizio ha sottoscritto tre contratti di assicurazione:
- nel 2020 il contratto 1 con l’assicuratore 2, ha pagato i premi per gli anni dal 2020 al 2023
- nel 2020 il contratto 3 con l’assicuratore 4, ha pagato i premi per gli anni dal 2020 al 2024
- nel 2018 un ulteriore contratto 3 con l’assicuratore 3, pagando premi per gli anni 2018 al 2022
*/
INSERT INTO PREMIO(ASSICURATO_ID,ANNO,POLIZZA_ID,ASSICURATORE_ID,TOTALE) VALUES (1,2020,1,2,1200);
INSERT INTO PREMIO(ASSICURATO_ID,ANNO,POLIZZA_ID,ASSICURATORE_ID,TOTALE) VALUES (1,2020,3,4,700);
INSERT INTO PREMIO(ASSICURATO_ID,ANNO,POLIZZA_ID,ASSICURATORE_ID,TOTALE) VALUES (1,2018,3,3,700);
/*
Caio ha sottoscritto un contratto di assicurazione:
- nel 2016 il contratto 1 con l’assicuratore 3, ha pagato i premi per gli anni dal 2016 al 2022
*/
INSERT INTO PREMIO(ASSICURATO_ID,ANNO,POLIZZA_ID,ASSICURATORE_ID,TOTALE) VALUES (2,2016,1,3,2100);
/*
Sempronio ha sottoscritto tre contratti di assicurazione:
- nel 2023 il contratto 2 con l’assicuratore 4, di cui ha pagato il premio per il 2023
- nel 2015 il contratto 3 con l’assicuratore 2, di cui ha pagato i premi per gli anni dal 2015 al 2020
- nel 2018 il contratto 5 con l’assicuratore 2, di cui ha pagato i premi per gli anni dal 2018 al 2020
*/
INSERT INTO PREMIO(ASSICURATO_ID,ANNO,POLIZZA_ID,ASSICURATORE_ID,TOTALE) VALUES (3,2023,2,4,220);
INSERT INTO PREMIO(ASSICURATO_ID,ANNO,POLIZZA_ID,ASSICURATORE_ID,TOTALE) VALUES (3,2015,3,2,840);
INSERT INTO PREMIO(ASSICURATO_ID,ANNO,POLIZZA_ID,ASSICURATORE_ID,TOTALE) VALUES (3,2018,5,2,870);