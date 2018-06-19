DROP TABLE IF EXISTS worldcup;
DROP TABLE IF EXISTS olympics;

CREATE TABLE worldcup (

  id SERIAL PRIMARY KEY,
  host VARCHAR(50),
  year VARCHAR(4),
  winner VARCHAR(50)

);

INSERT INTO worldcup (host, year, winner) VALUES ('Russia' , '2018' , 'TBD');
INSERT INTO worldcup (host, year, winner) VALUES ('Brazil' , '2014' , 'Germany');
INSERT INTO worldcup (host, year, winner) VALUES ('South Africa' , '2010' , 'Spain');
INSERT INTO worldcup (host, year, winner) VALUES ('Germany' , '2006' , 'Italy');
INSERT INTO worldcup (host, year, winner) VALUES ('KoreaJapan' , '2002' , 'Brazil');
INSERT INTO worldcup (host, year, winner) VALUES ('France' , '1998' , 'France');

CREATE TABLE olympics (

  id SERIAL PRIMARY KEY,
  host_city VARCHAR(50),
  olympic_year VARCHAR(50)

);


INSERT INTO olympics (host_city , olympic_year) VALUES ('Tokyo' , '2020');
INSERT INTO olympics (host_city , olympic_year) VALUES ('Rio' , '2016');
INSERT INTO olympics (host_city , olympic_year) VALUES ('London' , '2012');
INSERT INTO olympics (host_city , olympic_year) VALUES ('Beijing' , '2008');
INSERT INTO olympics (host_city , olympic_year) VALUES ('Athens' , '2004');
INSERT INTO olympics (host_city , olympic_year) VALUES ('Sydney' , '2000');
