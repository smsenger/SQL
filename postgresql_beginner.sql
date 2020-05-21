--exercises from https://pgexercises.com/questions/basic/

-- How can you retrieve all the information from the cd.facilities table?
SELECT * FROM cd.facilities

--You want to print out a list of all of the facilities and their cost to members. How would you retrieve a list of only facility names and costs?
SELECT name, membercost FROM cd.facilities

--How can you produce a list of facilities that charge a fee to members?
SELECT * FROM cd.facilities WHERE membercost > 0;

--How can you produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost? Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.
SELECT facid, name, membercost, monthlymaintenance FROM cd.facilities WHERE membercost > 0 and membercost < (.02 * monthlymaintenance);

--How can you produce a list of all facilities with the word 'Tennis' in their name?
SELECT * FROM cd.facilities WHERE name like '%Tennis%';

--How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.
SELECT * FROM cd.facilities WHERE facid = 1 or facid = 5;

--How can you produce a list of facilities, with each labelled as 'cheap' or 'expensive' depending on if their monthly maintenance cost is more than $100? Return the name and monthly maintenance of the facilities in question.
SELECT name, 
CASE
    WHEN monthlymaintenance > 100 THEN 'expensive'
  	WHEN monthlymaintenance <= 100 THEN 'cheap'
END as cost FROM cd.facilities;

--How can you produce a list of members who joined after the start of September 2012? Return the memid, surname, firstname, and joindate of the members in question.
SELECT memid, surname, firstname, joindate FROM cd.members WHERE joindate > '2012-09-01';

--How can you produce an ordered list of the first 10 surnames in the members table? The list must not contain duplicates.
SELECT DISTINCT surname
FROM cd.members
ORDER BY surname
limit 10;

--You, for some reason, want a combined list of all surnames and all facility names. Yes, this is a contrived example :-). Produce that list!
SELECT surname
FROM cd.members
UNION
SELECT name
FROM cd.facilities;

--You'd like to get the signup date of your last member. How can you retrieve this information?
SELECT MAX(joindate) AS latest
FROM cd.members;

--You'd like to get the first and last name of the last member(s) who signed up - not just the date. How can you do that?
SELECT firstname, surname, joindate 
FROM cd.members
WHERE joindate = 
	(SELECT max(joindate)
	 	FROM cd.members);

--
