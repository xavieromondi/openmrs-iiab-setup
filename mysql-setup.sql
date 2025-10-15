CREATE DATABASE openmrs DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
CREATE USER 'openmrs_user'@'localhost' IDENTIFIED BY 'OpenmrsPass123';
GRANT ALL PRIVILEGES ON openmrs.* TO 'openmrs_user'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
