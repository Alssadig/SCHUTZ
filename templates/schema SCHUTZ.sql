-- *********************************************
-- * SQL MySQL generation                      
-- *--------------------------------------------
-- * DB-MAIN version: 11.0.2              
-- * Generator date: Sep 14 2021              
-- * Generation date: Thu Jul 25 15:45:43 2024 
-- * LUN file: C:\Users\SOSO\Documents\FORMATION\CNAM\projet\projas.lun 
-- * Schema: SCHUTZ/1 
-- ********************************************* 


-- Database Section
-- ________________ 

-- create database SCHUTZ;
-- use SCHUTZ;


-- Tables Section
-- _____________ 

create table EMPLACEMENTS (
     ALLEE_ID char(1) not null,
     ID int not null,
     constraint ID_EMPLACEMENTS_ID primary key (ALLEE_ID, ID));

create table INVENTAIRE (
     REF varchar(50) not null,
     Date date not null,
     ALLEE_ID char(1) not null,
     ID int not null,
     constraint ID_INVENTAIRE_ID primary key (REF),
     constraint SID_INVENTAIRE_ID unique (Date),
     constraint FKALLEE_ID unique (ALLEE_ID, ID));


-- Constraints Section
-- ___________________ 

alter table INVENTAIRE add constraint FKALLEE_FK
     foreign key (ALLEE_ID, ID)
     references EMPLACEMENTS (ALLEE_ID, ID);


-- Index Section
-- _____________ 

create unique index ID_EMPLACEMENTS_IND
     on EMPLACEMENTS (ALLEE_ID, ID);

create unique index ID_INVENTAIRE_IND
     on INVENTAIRE (REF);

create unique index SID_INVENTAIRE_IND
     on INVENTAIRE (Date);

create unique index FKALLEE_IND
     on INVENTAIRE (ALLEE_ID, ID);

-- Création de la table ALLEES
CREATE TABLE ALLEES (
    ALLEE_ID CHAR(1) NOT NULL,
    DESCRIPTION VARCHAR(255),
    CONSTRAINT PK_ALLEES PRIMARY KEY (ALLEE_ID)
);

-- Création de la table COMPOSANTS
CREATE TABLE COMPOSANTS (
    COMP_ID INT NOT NULL AUTO_INCREMENT,
    NOM VARCHAR(100) NOT NULL,
    REF VARCHAR(50) NOT NULL,
    CONSTRAINT PK_COMPOSANTS PRIMARY KEY (COMP_ID),
    CONSTRAINT UK_COMPOSANTS_REF UNIQUE (REF)
);

-- Création de la table STOCKAGE
CREATE TABLE STOCKAGE (
    STOCK_ID INT NOT NULL AUTO_INCREMENT,
    COMP_ID INT NOT NULL,
    ALLEE_ID CHAR(1) NOT NULL,
    QUANTITE INT NOT NULL,
    DATE_ENTREE DATE,
    CONSTRAINT PK_STOCKAGE PRIMARY KEY (STOCK_ID),
    CONSTRAINT FK_STOCKAGE_COMP_ID FOREIGN KEY (COMP_ID) REFERENCES COMPOSANTS (COMP_ID),
    CONSTRAINT FK_STOCKAGE_ALLEE_ID FOREIGN KEY (ALLEE_ID) REFERENCES ALLEES (ALLEE_ID)
);

-- Modification des tables existantes pour ajouter les clés étrangères
ALTER TABLE EMPLACEMENTS
    ADD CONSTRAINT FK_EMPLACEMENTS_ALLEE_ID FOREIGN KEY (ALLEE_ID) REFERENCES ALLEES (ALLEE_ID);

ALTER TABLE INVENTAIRE
    ADD CONSTRAINT FK_INVENTAIRE_ALLEE_ID FOREIGN KEY (ALLEE_ID) REFERENCES ALLEES (ALLEE_ID);

-- Section des index
CREATE UNIQUE INDEX IDX_COMPOSANTS_REF
    ON COMPOSANTS (REF);

CREATE UNIQUE INDEX IDX_STOCKAGE_COMP_ALLEE
    ON STOCKAGE (COMP_ID, ALLEE_ID);


