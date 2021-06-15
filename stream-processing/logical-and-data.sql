INSERT INTO login (user_id, country_code) VALUES (1, 'gb');
INSERT INTO login (user_id, country_code) VALUES (2, 'us');
INSERT INTO login (user_id, country_code) VALUES (3, 'be');
INSERT INTO login (user_id, country_code) VALUES (2, 'us');

INSERT INTO withdrawal (user_id, country_code, amount, success) VALUES (1, 'gb', 10.00, true);
INSERT INTO withdrawal (user_id, country_code, amount, success) VALUES (1, 'au', 250.00, true);
INSERT INTO withdrawal (user_id, country_code, amount, success) VALUES (2, 'us', 50.00, true);
INSERT INTO withdrawal (user_id, country_code, amount, success) VALUES (3, 'be', 20.00, true);
INSERT INTO withdrawal (user_id, country_code, amount, success) VALUES (2, 'fr', 20.00, true);
