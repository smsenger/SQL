-- create the file, then run the file so psql creates

CREATE TABLE restaurant (
    id SERIAL PRIMARY KEY,
    restaurant_name VARCHAR NOT NULL,
    distance NUMERIC,
    stars NUMERIC,
    category VARCHAR,
    fav_dish VARCHAR,
    does_takeout BOOLEAN,
    last_visit TIMESTAMP
);

-- can copy/post this into postgres shell
-- \restaurant will list table data in format


INSERT INTO restaurant VALUES (
    DEFAULT, 
    'Los Trashtaurante',
    6.0,
    4.8,
    'Mexican-Creole Fusion',
    'Chicken etouffee taco',
    TRUE,
    '2020-05-21 09:00:00'
);

-- paste into terminal, run, will insert the records into the corresponding categories in table
-- to import file: change catabase: \c restaurant \i filepath
--need to change all slashes in file path to back slashes

INSERT INTO restaurant VALUES (
    DEFAULT, 
    'Los Trashtaurante',
    6.0,
    4.8,
    'Mexican-Creole Fusion',
    'Chicken etouffee taco',
    TRUE,
    '2020-05-21 09:00:01'
),

(
    DEFAULT, 
    'Sir Eggs a Lot',
    2.2,
    0.8,
    'Egg dishes',
    'Quiche a la Saesh',
    TRUE,
    '2020-05-05 01:00:50'
), 
(
    DEFAULT, 
    'Munch-o-Rama',
    1.2,
    4.0,
    'Snack''n on Entrees',
    'Frito Chili Pie with Honey-Roasted Saltines',
    TRUE,
    '2020-04-21 18:00:03'
),
(
    DEFAULT, 
    'Morning Grub',
    4.0,
    0.9,
    'American Breakfast',
    'Frosted Flakes French Toast',
    FALSE,
    '2020-01-05 10:20:22'
), 
(
    DEFAULT, 
    'Saesha''s Buckhead Deli',
    6.0,
    5.0,
    'Gourmet Croissant Sandwiches',
    'Toasted Ham and Brie with Raspberries',
    TRUE,
    '2020-05-20 16:45:55'
);


-- CREATE TABLE restaurant (  -- can change order of categories here if needed
--     id SERIAL PRIMARY KEY,
--     restaurant_name VARCHAR NOT NULL,
--     distance NUMERIC,
--     stars NUMERIC,
--     category VARCHAR,
--     fav_dish VARCHAR,
--     does_takeout BOOLEAN,
--     last_visit TIMESTAMP
-- ) VALUES (
--     DEFAULT, 
--     'Los Trashtaurante',
--     6.0,
--     4.8,
--     'Mexican-Creole Fusion',
--     'Chicken etouffee taco',
--     TRUE,
--     '2020-05-21 09:00:00'
-- );

