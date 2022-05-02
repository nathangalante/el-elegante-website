DROP TABLE IF EXISTS podcasts;
DROP TABLE IF EXISTS genres;
DROP TABLE IF EXISTS moods;

CREATE TABLE podcasts (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    url VARCHAR NOT NULL,
    genre VARCHAR,
    mood INT,
    FOREIGN KEY(mood) REFERENCES moods(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE genres (
    id SERIAL PRIMARY KEY, 
    user_id INT,
    genre_1 VARCHAR NOT NULL,
    genre_2 VARCHAR NOT NULL,
    genre_3 VARCHAR NOT NULL
);

CREATE TABLE moods (
    id SERIAL PRIMARY KEY, 
    mood VARCHAR NOT NULL
);

INSERT INTO podcasts (url, name, genre)
VALUES ('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1140824068&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Bubbles 20 by collider', ARRAY ['Disco','Techno', 'House']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1113895690&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Förstereistr 19 by Andrenaut b2b Skotsch', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1109946712&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Ding Dong 18 by ultramarine', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1090736779&color=%23676767&inverse=true&auto_play=false&show_user=true', 'EJÓ Radio 02 by Zeze', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1051470712&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Vaporizer 04 by Lory', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1043122573&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Wet Radio 02 by Dj Mille', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1009493422&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Schoenendoos Radio 05 by Erik Roos Lindgreen', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/987971305&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Pizza Planet 03 by Vex &am Lateef', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/984573604&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Cigarrettes And Coffee 17 by Jonas Pelle', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/977132779&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Pferdi 16 by Rolex3000', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/970864108&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Twenty8Capsules 15 by Suley Al-Hakim', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/949073542&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Pizza Planet 02 by Vex &am Lateef', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/946743370&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Briefmarke 14 by Matvrak', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/938831908&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Water Lily 02 by Laurel', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/936489700&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Mannequin 06 by Galante El Elegante', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/929954056&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Backsteingotik Radio 02 by snk.', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/926518510&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Vaporizer 03 by Lory', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/924313756&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Headshell 05 by Lactic Acid', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/917072092&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Headshell 04 by Pepe', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/914740678&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Headshell 03 by MFTF', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/909308872&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Headshell 02 by Dj Aol', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/904504585&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Headshell 01 by Mauricio', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/903069577&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Royal Wax 13 by Zeze', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/899876650&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Schoenendoos Radio 04 by Erik Roos Lindgreen', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/896588998&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Pizza Planet Radio 01 by Vex', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/888019588&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Itzcuincli 12 by HDeep', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/883996276&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Jaguar 10 by Rizu X', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/878698456&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Wet Radio 01 by DJ MILLE', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/873530434&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Un Film Radio 02 by Dj Chompiras', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/871580812&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Mauricio On Tape 05', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/870880423&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Nice Nice Party B2B2B 07', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/870851440&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Ravy Lory On Tape 06', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/870809767&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Erik Roos Lindgreen On Tape 04', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/870508924&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Dj Rolex3000 On Tape 03', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/870501523&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Early Lory On Tape 02', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/870481357&color=%23676767&inverse=true&auto_play=false&show_user=true', 'SNK On Tape 01', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/859385281&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Pendulum 09 by Econs &am Humans', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/853087306&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Furr 08 by Dj Rolex 3000', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/847211833&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Virgen María Radio 02 by Araña Discoteca', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/841671502&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Das Kind 07 by Max Ferrer', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/829422760&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Vaporizer 02 by Lory', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/821604100&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Bar Cristallo 02 by Jonas Pelle', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/815824777&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Dragon Fruit Radio 01 by Mauricio', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/770016031&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Vaporizer 01 by Lory', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/759463873&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Locher 06 by Päd und Patrick', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/730466515&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Bar Cristallo 01 by Jonas Pelle', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/717551923&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Schoenendoos Radio 03 by Erik Roos Lindgreen', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/681127895&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Schoenendoos Radio 02 by Erik Roos Lindgreen', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/661317068&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Nice Nice Party 01 by Galante El Elegante', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/629498505&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Schoenendoos Radio 01 by Erik Roos Lindgreen', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/619978344&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Mannequin Radio 05 by Galante El Elegante', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/617927994&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Backsteingotik Radio 01 by snk.', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/613770483&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Water Lily 05 by Laurel', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/610167459&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Un Film Radio 01 by Dj Chompiras', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/606456684&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Dame 04 by Ugly', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/603247617&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Dinnammucca 03 by Erik Roos Lindgreen', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/599471268&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Automobile 02 by Best Boi Electric &am Dj Aol', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/588637758&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Julia 01 by Galante El Elegante', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/588621357&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Mannequin Radio 04 by Galante El Elegante', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/588610509&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Mannequin Radio 03 by Galante El Elegante', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/588602955&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Mannequin Radio 02 by Galante El Elegante', ARRAY ['Techno', 'Disco', 'Afro']),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/586590417&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Mannequin Radio 01 by Galante El Elegante', ARRAY ['Mexico', 'Disco', 'Afro']);

INSERT INTO moods (mood)
VALUES ('Burning The Dancefloor'),
('A Little Laze On The Couch'),
('Cheeky Drinks At The Bar'),
('Laughter Under The Sun'),
('Stop Drinking And Study!'),
('Trippy In The Park');