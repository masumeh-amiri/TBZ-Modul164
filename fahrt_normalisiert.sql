
-- Schema: Normalisierte Fahrt-Datenbank (3NF)

DROP TABLE IF EXISTS fahrt_station, fahrt, station, fahrer, disponent;

CREATE TABLE disponent (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    telefonnummer VARCHAR(20)
);

CREATE TABLE fahrer (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    telefonnummer VARCHAR(20)
);

CREATE TABLE station (
    id INT PRIMARY KEY AUTO_INCREMENT,
    plz_ort VARCHAR(100)
);

CREATE TABLE fahrt (
    idFahrt INT PRIMARY KEY AUTO_INCREMENT,
    fahrzeugKennzeichen VARCHAR(20),
    sitzplaetze INT,
    disponent_id INT,
    FOREIGN KEY (disponent_id) REFERENCES disponent(id)
);

CREATE TABLE fahrt_station (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fahrt_id INT,
    station_id INT,
    fahrer_id INT,
    abfahrtszeit DATETIME,
    ankunftszeit DATETIME,
    FOREIGN KEY (fahrt_id) REFERENCES fahrt(idFahrt),
    FOREIGN KEY (station_id) REFERENCES station(id),
    FOREIGN KEY (fahrer_id) REFERENCES fahrer(id)
);
