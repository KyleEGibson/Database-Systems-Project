-- Create DBA user
DROP USER IF EXISTS 'AlexSmith'@'localhost';
DROP USER IF EXISTS 'JamieLee'@'localhost';

CREATE USER 'AlexSmith'@'localhost' IDENTIFIED BY 'meowmeowmeowmeowMEOW';
GRANT ALL PRIVILEGES ON companydb.* TO 'AlexSmith'@'localhost';

-- Create the analyst user
CREATE USER 'JamieLee'@'localhost' IDENTIFIED BY 'ILoveDataBaseSystem!';
GRANT SELECT ON companydb.* TO 'JamieLee'@'localhost';

FLUSH PRIVILEGES;

SHOW GRANTS FOR 'AlexSmith'@'localhost';
SHOW GRANTS FOR 'JamieLee'@'localhost';