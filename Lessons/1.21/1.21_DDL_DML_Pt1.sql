-- information_schema is a SCHEMA, not a table.
-- Query tables inside it, e.g.:

-- List all tables in the 'public' schema
SELECT * FROM information_schema.tables
WHERE table_schema = 'public';

-- List all columns of a specific table
SELECT * FROM information_schema.columns
WHERE table_name = 'your_table_name';

SELECT * FROM information_schema.schemata;

CREATE SCHEMA IF NOT EXISTS staging;

DROP SCHEMA IF EXISTS staging;

CREATE TABLE IF NOT EXISTS staging.preferred_role(
    role_id INTEGER PRIMARY KEY,
    role_name VARCHAR
);

--DROP TABLE staging.preferred_role
INSERT INTO staging.preferred_role (role_id,role_name)
VALUES
    (1,'Data Engineer'),
    (2,'Senior Data Engineer'),
    (3,'Software Engineer');



ALTER TABLE staging.preferred_role
ADD COLUMN preferred_role BOOLEAN;

--ALTER TABLE staging.preferred_role
--DROP COLUMN preferred_role;

UPDATE staging.preferred_role
SET preferred_role = FALSE
WHERE role_id = 3;

ALTER TABLE staging.preferred_role
RENAME TO prioirty_roles;

SELECT * FROM staging.prioirty_roles;


ALTER TABLE staging.prioirty_roles
RENAME COLUMN preferred_role TO priority_lvl;

-- Column is BOOLEAN; PostgreSQL can't auto-cast boolean -> integer,
-- so use USING with an explicit expression (TRUE -> 1, FALSE -> 0)
ALTER TABLE staging.prioirty_roles
ALTER COLUMN priority_lvl TYPE INTEGER
USING CASE WHEN priority_lvl THEN 1 ELSE 0 END;

UPDATE staging.prioirty_roles
SET priority_lvl = 3
WHERE role_id = 3;
