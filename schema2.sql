
CREATE TABLE allees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom CHAR(1) NOT NULL
);

CREATE TABLE emplacements (
    id INT PRIMARY KEY AUTO_INCREMENT,
    allee_id INT,
    numero INT,
    CONSTRAINT fk_allee FOREIGN KEY (allee_id) REFERENCES allees(id)
);

CREATE TABLE composants (
    id INT PRIMARY KEY AUTO_INCREMENT,
    reference VARCHAR(20) NOT NULL,
    date_arrivee DATE NOT NULL
);

CREATE TABLE stockage (
    id INT PRIMARY KEY AUTO_INCREMENT,
    emplacement_id INT,
    composant_id INT,
    CONSTRAINT fk_emplacement FOREIGN KEY (emplacement_id) REFERENCES emplacements(id),
    CONSTRAINT fk_composant FOREIGN KEY (composant_id) REFERENCES composants(id)
);
