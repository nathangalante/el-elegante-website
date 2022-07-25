DROP TABLE IF EXISTS podcasts;
DROP TABLE IF EXISTS genres;
DROP TABLE IF EXISTS moods;

CREATE TABLE podcasts (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    url VARCHAR NOT NULL,
    image VARCHAR, 
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

INSERT INTO podcasts (url, name, image, genre, mood)
VALUES ('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1140824068&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Bubbles 20 by collider', 'https://i1.sndcdn.com/artworks-NHkNn5pkA3BWcZ5z-rS7KVA-t500x500.jpg', ARRAY ['Disco','Techno', 'House'], 1),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1113895690&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Förstereistr 19 by Andrenaut b2b Skotsch', 'https://i1.sndcdn.com/artworks-sJ5FpjkC1EZ0QFoP-jjU4JQ-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 2),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1109946712&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Ding Dong 18 by ultramarine', 'https://i1.sndcdn.com/artworks-5Py5YWXmE8jifcYm-TrnAlA-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 1),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1090736779&color=%23676767&inverse=true&auto_play=false&show_user=true', 'EJÓ Radio 02 by Zeze', 'https://i1.sndcdn.com/artworks-YkuKrKSEgd0tycEr-0FSV6A-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 2),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1051470712&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Vaporizer 04 by Lory', 'https://i1.sndcdn.com/artworks-q3eKk0X93cyCBscG-RtwDyQ-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 6),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1043122573&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Wet Radio 02 by Dj Mille', 'https://i1.sndcdn.com/artworks-t8ozlJGOVwwD6EiK-XTwQfw-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 4),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1009493422&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Schoenendoos Radio 05 by Erik Roos Lindgreen', 'https://i1.sndcdn.com/artworks-3l9Txpiyts8VvzJr-GWfLVQ-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 3),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/987971305&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Pizza Planet 03 by Vex &am Lateef', 'https://i1.sndcdn.com/artworks-heNndNJhwCxTizwT-3HALSQ-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 3),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/984573604&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Cigarrettes And Coffee 17 by Jonas Pelle', 'https://i1.sndcdn.com/artworks-muLU2CQhgwH7g7yP-twoELg-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 5),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/977132779&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Pferdi 16 by Rolex3000', 'https://i1.sndcdn.com/artworks-6m5ZSdYzw1VljyVE-oawpNQ-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 5),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/970864108&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Twenty8Capsules 15 by Suley Al-Hakim', 'https://i1.sndcdn.com/artworks-zeoaEJXcwOcyxkRY-PznYbA-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 1),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/949073542&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Pizza Planet 02 by Vex &am Lateef', 'https://i1.sndcdn.com/artworks-Z4AO0HXW95fPshlT-f9yrRw-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 2),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/946743370&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Briefmarke 14 by Matvrak', 'https://i1.sndcdn.com/artworks-OWaypE7YglkymEfE-1yjnVw-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 5),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/938831908&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Water Lily 02 by Laurel', 'https://i1.sndcdn.com/artworks-Rz1z5MlunTTLSnSe-d4pwlA-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 5),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/936489700&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Mannequin 06 by Galante El Elegante', 'https://i1.sndcdn.com/artworks-yQsepAuQYuT5fya5-WGbovg-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 6),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/929954056&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Backsteingotik Radio 02 by snk.', 'https://i1.sndcdn.com/artworks-UWI8lFyUlKRTwsBe-DGMmgg-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 4),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/926518510&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Vaporizer 03 by Lory', 'https://i1.sndcdn.com/artworks-yCMChYCz8P2e8yDy-fsmYzg-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 2),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/924313756&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Headshell 05 by Lactic Acid', 'https://i1.sndcdn.com/artworks-zaSwabiTyYBO8IB5-ufXzmQ-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 2),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/917072092&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Headshell 04 by Pepe', 'https://i1.sndcdn.com/artworks-uCfrZObf6PvAxpWf-FXoXcw-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 6),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/914740678&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Headshell 03 by MFTF', 'https://i1.sndcdn.com/artworks-aIDzVBrk0UbmXElM-AcNCzw-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 3),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/909308872&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Headshell 02 by Dj Aol', 'https://i1.sndcdn.com/artworks-pWC3P2LVbY3i8p8l-jDT0bg-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 3),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/904504585&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Headshell 01 by Mauricio', 'https://i1.sndcdn.com/artworks-fnqPJHtwUBr88uHV-vnvVDw-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 3),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/903069577&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Royal Wax 13 by Zeze', 'https://i1.sndcdn.com/artworks-jnAjgpWKdTFPhtYC-39qCzg-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 1),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/899876650&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Schoenendoos Radio 04 by Erik Roos Lindgreen', 'https://i1.sndcdn.com/artworks-KHJY61ydtxhQ8D5N-xXNjZQ-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 5),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/896588998&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Pizza Planet Radio 01 by Vex', 'https://i1.sndcdn.com/artworks-UTzsPGAlagjONylU-MqT6FQ-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 6),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/888019588&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Itzcuincli 12 by HDeep', 'https://i1.sndcdn.com/artworks-fz2c8WPf2Qq4WHyv-d8KMYw-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 6),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/883996276&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Jaguar 10 by Rizu X', 'https://i1.sndcdn.com/artworks-QJoXzkvkef5T47Sz-yWCoHw-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 5),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/878698456&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Wet Radio 01 by DJ MILLE', 'https://i1.sndcdn.com/artworks-jbdHetdNHsqjigFK-AJdN1w-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 6),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/873530434&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Un Film Radio 02 by Dj Chompiras', 'https://i1.sndcdn.com/artworks-rfOQZp06uvriS7dH-vcz3Lg-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 5),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/871580812&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Mauricio On Tape 05', 'https://i1.sndcdn.com/artworks-ylv6c1dOM7fbgyyF-9MTtZA-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 1),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/870880423&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Nice Nice Party B2B2B 07', 'https://i1.sndcdn.com/artworks-QkqMyDS0bhf815OK-b1CbMw-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 1),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/870851440&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Ravy Lory On Tape 06', 'https://i1.sndcdn.com/artworks-KUwH4iMFcLaFOWed-nyNtUw-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 1),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/870809767&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Erik Roos Lindgreen On Tape 04', 'https://i1.sndcdn.com/artworks-2HeP0ZckU7vbmzcV-FyzQ2w-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 2),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/870508924&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Dj Rolex3000 On Tape 03', 'https://i1.sndcdn.com/artworks-NRImj9pj8yx4RqTH-j4H61g-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 3),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/870501523&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Early Lory On Tape 02', 'https://i1.sndcdn.com/artworks-ziXrjN4Ip4m2juRG-abBK0Q-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 2),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/870481357&color=%23676767&inverse=true&auto_play=false&show_user=true', 'SNK On Tape 01', 'https://i1.sndcdn.com/artworks-6LDrwEy6L6vLnOoV-NrscZg-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 2),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/859385281&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Pendulum 09 by Econs &am Humans', 'https://i1.sndcdn.com/artworks-oVSnkHuFzXXzvGNz-bnzCfA-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 3),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/853087306&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Furr 08 by Dj Rolex 3000', 'https://i1.sndcdn.com/artworks-i5dDX18JxaSwsWIG-vjHi5w-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 3),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/847211833&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Virgen María Radio 02 by Araña Discoteca', 'https://i1.sndcdn.com/artworks-71GhDjTaKQSjZzKW-ty7Y1w-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 4),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/841671502&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Das Kind 07 by Max Ferrer', 'https://i1.sndcdn.com/artworks-ulzUtzPZRQTjoZzo-6S7BKA-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 2),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/829422760&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Vaporizer 02 by Lory', 'https://i1.sndcdn.com/artworks-UTivUxHVY8hCDawR-IyeGOg-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 3),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/821604100&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Bar Cristallo 02 by Jonas Pelle', 'https://i1.sndcdn.com/artworks-WPmLjV0uxzqUpdOd-OrM9Dg-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 5),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/815824777&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Dragon Fruit Radio 01 by Mauricio', 'https://i1.sndcdn.com/artworks-oPkOKrwjoRgp16JE-P5A1sg-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 2),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/770016031&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Vaporizer 01 by Lory', 'https://i1.sndcdn.com/artworks-NVFF4GUAhuCvb1Co-Pc8eXA-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 2),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/759463873&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Locher 06 by Päd und Patrick', 'https://i1.sndcdn.com/artworks-L0Wv5isnEgLxU3sK-2GqAHg-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 1),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/730466515&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Bar Cristallo 01 by Jonas Pelle', 'https://i1.sndcdn.com/artworks-000654942607-8n64xw-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 1),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/717551923&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Schoenendoos Radio 03 by Erik Roos Lindgreen', 'https://i1.sndcdn.com/artworks-fBfQfwsEwdFGZza8-4MeGfQ-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 6),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/681127895&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Schoenendoos Radio 02 by Erik Roos Lindgreen', 'https://i1.sndcdn.com/artworks-cMZiI9gK9mE2xvfD-LZCdBA-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 3),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/661317068&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Nice Nice Party 01 by Galante El Elegante', 'https://i1.sndcdn.com/artworks-zE42NgNyo2XAi8nn-xWM4UA-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 3),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/629498505&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Schoenendoos Radio 01 by Erik Roos Lindgreen', 'https://i1.sndcdn.com/artworks-a2aM8MM2LwX9jfEt-5cAftg-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 4),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/619978344&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Mannequin Radio 05 by Galante El Elegante', 'https://i1.sndcdn.com/artworks-gfz9keK5j0y4ctCk-rD0zZw-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 4),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/617927994&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Backsteingotik Radio 01 by snk.', 'https://i1.sndcdn.com/artworks-oHWUBo7suMxck2Bt-3vp9qA-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 2),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/613770483&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Water Lily 05 by Laurel', 'https://i1.sndcdn.com/artworks-BDTGz95Jzh3Gdy6L-MqMnFg-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 1),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/610167459&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Un Film Radio 01 by Dj Chompiras', 'https://i1.sndcdn.com/artworks-8w1mzvtd3cVRALtm-Ny2Qyw-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 1),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/606456684&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Dame 04 by Ugly', 'https://i1.sndcdn.com/artworks-elXxCXcdSigqumTj-zWE0UA-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 5),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/603247617&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Dinnammucca 03 by Erik Roos Lindgreen', 'https://i1.sndcdn.com/artworks-SAVNHMxV1goX6BLo-Zlvlig-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 5),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/599471268&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Automobile 02 by Best Boi Electric &am Dj Aol', 'https://i1.sndcdn.com/artworks-PvfNTCyCB2ktQz43-vbNn8w-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 5),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/588637758&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Julia 01 by Galante El Elegante', 'https://i1.sndcdn.com/artworks-sz2QbaFsA543ErDt-9MjY4g-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 5),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/588621357&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Mannequin Radio 04 by Galante El Elegante', 'https://i1.sndcdn.com/artworks-uMLJ7y3AqAAJVvkD-pyzS8A-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 1),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/588610509&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Mannequin Radio 03 by Galante El Elegante', 'https://i1.sndcdn.com/artworks-Vx3zQlMGT3dTBsve-m7siSA-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 1),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/588602955&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Mannequin Radio 02 by Galante El Elegante', 'https://i1.sndcdn.com/artworks-2TvxFQdIY0u2s1yN-q2ZcVg-t500x500.jpg', ARRAY ['Techno', 'Disco', 'Afro'], 2),
('https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/586590417&color=%23676767&inverse=true&auto_play=false&show_user=true', 'Mannequin Radio 01 by Galante El Elegante', 'https://i1.sndcdn.com/artworks-laDmDWSxRRlSRm5V-u5WwpA-t500x500.jpg', ARRAY ['Mexico', 'Disco', 'Afro'], 5);


postgres://tycdibnljxlhco:4693d034251e69a9e63b90b561f6cfc8d183dc456d3a1f4fe0bb329dc3df5a1e@ec2-54-75-184-144.eu-west-1.compute.amazonaws.com:5432/d17dk7i2ld2n4a

INSERT INTO moods (mood)
VALUES ('Burning The Dancefloor'),
('A Little Laze On The Couch'),
('Cheeky Drinks At The Bar'),
('Laughter Under The Sun'),
('Stop Drinking And Study!'),
('Trippy In The Park');

'https://i1.sndcdn.com/artworks-NHkNn5pkA3BWcZ5z-rS7KVA-t500x500.jpg'
'https://i1.sndcdn.com/artworks-sJ5FpjkC1EZ0QFoP-jjU4JQ-t500x500.jpg'
'https://i1.sndcdn.com/artworks-5Py5YWXmE8jifcYm-TrnAlA-t500x500.jpg'
'https://i1.sndcdn.com/artworks-YkuKrKSEgd0tycEr-0FSV6A-t500x500.jpg'
'https://i1.sndcdn.com/artworks-q3eKk0X93cyCBscG-RtwDyQ-t500x500.jpg'
'https://i1.sndcdn.com/artworks-t8ozlJGOVwwD6EiK-XTwQfw-t500x500.jpg'
'https://i1.sndcdn.com/artworks-3l9Txpiyts8VvzJr-GWfLVQ-t500x500.jpg'
'https://i1.sndcdn.com/artworks-heNndNJhwCxTizwT-3HALSQ-t500x500.jpg'
'https://i1.sndcdn.com/artworks-muLU2CQhgwH7g7yP-twoELg-t500x500.jpg'
'https://i1.sndcdn.com/artworks-6m5ZSdYzw1VljyVE-oawpNQ-t500x500.jpg'
'https://i1.sndcdn.com/artworks-zeoaEJXcwOcyxkRY-PznYbA-t500x500.jpg'
'https://i1.sndcdn.com/artworks-Z4AO0HXW95fPshlT-f9yrRw-t500x500.jpg'
'https://i1.sndcdn.com/artworks-OWaypE7YglkymEfE-1yjnVw-t500x500.jpg'
'https://i1.sndcdn.com/artworks-Rz1z5MlunTTLSnSe-d4pwlA-t500x500.jpg'
'https://i1.sndcdn.com/artworks-yQsepAuQYuT5fya5-WGbovg-t500x500.jpg'
'https://i1.sndcdn.com/artworks-UWI8lFyUlKRTwsBe-DGMmgg-t500x500.jpg'
'https://i1.sndcdn.com/artworks-yCMChYCz8P2e8yDy-fsmYzg-t500x500.jpg'
'https://i1.sndcdn.com/artworks-zaSwabiTyYBO8IB5-ufXzmQ-t500x500.jpg'
'https://i1.sndcdn.com/artworks-uCfrZObf6PvAxpWf-FXoXcw-t500x500.jpg'
'https://i1.sndcdn.com/artworks-aIDzVBrk0UbmXElM-AcNCzw-t500x500.jpg'
'https://i1.sndcdn.com/artworks-pWC3P2LVbY3i8p8l-jDT0bg-t500x500.jpg'
'https://i1.sndcdn.com/artworks-fnqPJHtwUBr88uHV-vnvVDw-t500x500.jpg'
'https://i1.sndcdn.com/artworks-jnAjgpWKdTFPhtYC-39qCzg-t500x500.jpg'
'https://i1.sndcdn.com/artworks-KHJY61ydtxhQ8D5N-xXNjZQ-t500x500.jpg'
'https://i1.sndcdn.com/artworks-UTzsPGAlagjONylU-MqT6FQ-t500x500.jpg'
'https://i1.sndcdn.com/artworks-fz2c8WPf2Qq4WHyv-d8KMYw-t500x500.jpg'
'https://i1.sndcdn.com/artworks-QJoXzkvkef5T47Sz-yWCoHw-t500x500.jpg'
'https://i1.sndcdn.com/artworks-jbdHetdNHsqjigFK-AJdN1w-t500x500.jpg'
'https://i1.sndcdn.com/artworks-rfOQZp06uvriS7dH-vcz3Lg-t500x500.jpg'
'https://i1.sndcdn.com/artworks-ylv6c1dOM7fbgyyF-9MTtZA-t500x500.jpg'
'https://i1.sndcdn.com/artworks-QkqMyDS0bhf815OK-b1CbMw-t500x500.jpg'
'https://i1.sndcdn.com/artworks-KUwH4iMFcLaFOWed-nyNtUw-t500x500.jpg'
'https://i1.sndcdn.com/artworks-2HeP0ZckU7vbmzcV-FyzQ2w-t500x500.jpg'
'https://i1.sndcdn.com/artworks-NRImj9pj8yx4RqTH-j4H61g-t500x500.jpg'
'https://i1.sndcdn.com/artworks-ziXrjN4Ip4m2juRG-abBK0Q-t500x500.jpg'
'https://i1.sndcdn.com/artworks-6LDrwEy6L6vLnOoV-NrscZg-t500x500.jpg'
'https://i1.sndcdn.com/artworks-oVSnkHuFzXXzvGNz-bnzCfA-t500x500.jpg'
'https://i1.sndcdn.com/artworks-i5dDX18JxaSwsWIG-vjHi5w-t500x500.jpg'
'https://i1.sndcdn.com/artworks-71GhDjTaKQSjZzKW-ty7Y1w-t500x500.jpg'
'https://i1.sndcdn.com/artworks-ulzUtzPZRQTjoZzo-6S7BKA-t500x500.jpg'
'https://i1.sndcdn.com/artworks-UTivUxHVY8hCDawR-IyeGOg-t500x500.jpg'
'https://i1.sndcdn.com/artworks-WPmLjV0uxzqUpdOd-OrM9Dg-t500x500.jpg'
'https://i1.sndcdn.com/artworks-oPkOKrwjoRgp16JE-P5A1sg-t500x500.jpg'
'https://i1.sndcdn.com/artworks-NVFF4GUAhuCvb1Co-Pc8eXA-t500x500.jpg'
'https://i1.sndcdn.com/artworks-L0Wv5isnEgLxU3sK-2GqAHg-t500x500.jpg'
'https://i1.sndcdn.com/artworks-000654942607-8n64xw-t500x500.jpg'
'https://i1.sndcdn.com/artworks-fBfQfwsEwdFGZza8-4MeGfQ-t500x500.jpg'
'https://i1.sndcdn.com/artworks-cMZiI9gK9mE2xvfD-LZCdBA-t500x500.jpg'
'https://i1.sndcdn.com/artworks-zE42NgNyo2XAi8nn-xWM4UA-t500x500.jpg'
'https://i1.sndcdn.com/artworks-a2aM8MM2LwX9jfEt-5cAftg-t500x500.jpg'
'https://i1.sndcdn.com/artworks-gfz9keK5j0y4ctCk-rD0zZw-t500x500.jpg'
'https://i1.sndcdn.com/artworks-oHWUBo7suMxck2Bt-3vp9qA-t500x500.jpg'
'https://i1.sndcdn.com/artworks-BDTGz95Jzh3Gdy6L-MqMnFg-t500x500.jpg'
'https://i1.sndcdn.com/artworks-8w1mzvtd3cVRALtm-Ny2Qyw-t500x500.jpg'
'https://i1.sndcdn.com/artworks-elXxCXcdSigqumTj-zWE0UA-t500x500.jpg'
'https://i1.sndcdn.com/artworks-SAVNHMxV1goX6BLo-Zlvlig-t500x500.jpg'
'https://i1.sndcdn.com/artworks-PvfNTCyCB2ktQz43-vbNn8w-t500x500.jpg'
'https://i1.sndcdn.com/artworks-sz2QbaFsA543ErDt-9MjY4g-t500x500.jpg'
'https://i1.sndcdn.com/artworks-uMLJ7y3AqAAJVvkD-pyzS8A-t500x500.jpg'
'https://i1.sndcdn.com/artworks-Vx3zQlMGT3dTBsve-m7siSA-t500x500.jpg'
'https://i1.sndcdn.com/artworks-2TvxFQdIY0u2s1yN-q2ZcVg-t500x500.jpg'
'https://i1.sndcdn.com/artworks-laDmDWSxRRlSRm5V-u5WwpA-t500x500.jpg'
