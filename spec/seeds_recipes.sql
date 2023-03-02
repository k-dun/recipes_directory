TRUNCATE TABLE recipes RESTART IDENTITY;

INSERT INTO recipes(name, time_required, rating) VALUES ('Zupa', '60', '4');
INSERT INTO recipes (name, time_required, rating) VALUES ('Bigos', '120', '3');
INSERT INTO recipes (name, time_required, rating) VALUES ('Pierogi', '45', '5');