use albums_db;
describe albums;
select * from albums;
select count(*) from albums;
-- there are 31 rows and 6 columns in the albums table.
select distinct artist from albums;
-- there are 23 unique artists in the albums table.
-- the primary key for the albums table is 'id.'
select min(release_date) from albums;
select max(release_date) from albums;
-- the oldest album was 1967 and the most recent was 2011.
select name from albums where artist = "Pink Floyd";
select release_date from albums where name = "Sgt. Pepper's Lonely Hearts Club Band";
select genre from albums where name = "Nevermind";
select * from albums where release_date >1989;
select * from albums where sales < 20;
select * from albums where genre = "Rock";
-- this query only shows albums which have a single genre of 'rock.' to include albums with multiple genres, or sub-genres of rock the where clause should be "where genre like "%Rock%"."


