--exercises from https://pgexercises.com/questions/joins/

--How can you produce a list of the start times for bookings by members named 'David Farrell'?
SELECT bks.starttime
	FROM
		cd.bookings bks
		INNER JOIN cd.members mems
			ON mems.memid = bks.memid
	WHERE
		mems.firstname = 'David'
		and mems.surname = 'Farrell'

--How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'? Return a list of start time and facility name pairings, ordered by the tim
select starttime as start, name
	from 
		cd.facilities facs
		inner join cd.bookings bks
			on facs.facid = bks.facid
	where 
		name like '%Tennis Court%' and
		starttime >= '2012-09-21' and 
		starttime < '2012-09-22'
order by starttime;


--How can you output a list of all members who have recommended another member? Ensure that there are no duplicates in the list, and that results are ordered by (surname, firstname).
SELECT firstname, surname FROM cd.members WHERE memid IN (SELECT recommendedby FROM CD.MEMBERS) ORDER BY surname,firstname;

--How can you output a list of all members, including the individual who recommended them (if any)? Ensure that results are ordered by (surname, firstname).
SELECT 
A.firstname as memfname, A.surname as memsname,
B.FIRSTNAME AS RECFNAME, B.SURNAME AS RECSNAME
FROM cd.members A 
	LEFT OUTER JOIN CD.MEMBERS B ON B.MEMID = A.RECOMMENDEDBY
ORDER BY A.surname, A.firstname;

--How can you produce a list of all members who have used a tennis court? Include in your output the name of the court, and the name of the member formatted as a single column. Ensure no duplicate data, and order by the member name.
SELECT M.FIRSTNAME ||' '|| M.SURNAME AS MEMBER, F.NAME 
FROM CD.MEMBERS M 
JOIN CD.BOOKINGS B ON M.MEMID = B.MEMID
JOIN CD.FACILITIES F ON F.FACID = B.FACID
WHERE F.NAME LIKE 'Tennis%'
GROUP BY M.FIRSTNAME, M.SURNAME, F.NAME
ORDER BY FIRSTNAME;

--How can you produce a list of bookings on the day of 2012-09-14 which will cost the member (or guest) more than $30? Remember that guests have different costs to members (the listed costs are per half-hour 'slot'), and the guest user is always ID 0. Include in your output the name of the facility, the name of the member formatted as a single column, and the cost. Order by descending cost, and do not use any subqueries.
select mems.firstname || ' ' || mems.surname as member, 
	facs.name as facility, 
	case 
		when mems.memid = 0 then
			bks.slots*facs.guestcost
		else
			bks.slots*facs.membercost
	end as cost
        from
                cd.members mems                
                inner join cd.bookings bks
                        on mems.memid = bks.memid
                inner join cd.facilities facs
                        on bks.facid = facs.facid
        where
		bks.starttime >= '2012-09-14' and 
		bks.starttime < '2012-09-15' and (
			(mems.memid = 0 and bks.slots*facs.guestcost > 30) or
			(mems.memid != 0 and bks.slots*facs.membercost > 30)
		)
order by cost desc; 

--How can you output a list of all members, including the individual who recommended them (if any), without using any joins? Ensure that there are no duplicates in the list, and that each firstname + surname pairing is formatted as a column and ordered.
select distinct mems.firstname || ' ' ||  mems.surname as member,
	(select recs.firstname || ' ' || recs.surname as recommender 
		from cd.members recs 
		where recs.memid = mems.recommendedby
	)
	from 
		cd.members mems
order by member; 

--The Produce a list of costly bookings exercise contained some messy logic: we had to calculate the booking cost in both the WHERE clause and the CASE statement. Try to simplify this calculation using subqueries. For reference, the question was:
--How can you produce a list of bookings on the day of 2012-09-14 which will cost the member (or guest) more than $30? Remember that guests have different costs to members (the listed costs are per half-hour 'slot'), and the guest user is always ID 0. Include in your output the name of the facility, the name of the member formatted as a single column, and the cost. Order by descending cost.
SELECT M.FIRSTNAME, M.SURNAME AS MEMBER FROM CD.MEMBERS M
	WHERE M.MEMID = B.MEMID IN CD.BOOKINGS B;

