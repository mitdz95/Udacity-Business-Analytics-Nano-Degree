1. Countries with their most purchased genre.

WITH t1 as
(
SELECT c.Country, count(i.InvoiceId) as Purchases, g.Name, g.GenreId
FROM Customer c 
JOIN Invoice i ON c.CustomerId = i.CustomerId
JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
JOIN Track t ON il.TrackId = t.TrackId
JOIN Genre g ON t.GenreId = g.GenreId
GROUP BY 1, 3
ORDER BY 1, 2 DESC
) 
SELECT t1.*
FROM t1
JOIN (
        SELECT Country, max(Purchases) as max, Name, GenreId
        FROM t1
        GROUP BY 1) as t2
ON t1.Country = t2.Country
WHERE t1.Purchases = t2.

/* Rock is dominating, big market NA (usa, can), latin countries not big on 
latin while Sweden is */


2. Number of Latin music purchases for all countries

SELECT c.Country, g.Name, count(i.invoiceid) as num
from Genre g 
join Track t on g.GenreId = t.GenreId
join InvoiceLine il on t.TrackId = il.TrackId
join Invoice i on il.InvoiceId = i.InvoiceId
join Customer c on i.CustomerId = c.CustomerId
where g.Name = 'Latin'
group by 1
order by 3 DESC

/* Usa canada dominate latin genre, no other latin countries come close. 
Canada much smaller population but still consume more latin than brazill */

3. Number of tracks on the music store for each genre.

SELECT g.Name genre, count(t.trackid) as num
from Track t join Genre g
on t.GenreId = g.GenreId
group by 1
order by 2 DESC

/* Although rock is dominating in both invoice num and revenue, one of the reason
is there are so much more rock content than other genres, it's peculiar that 
Brazil is the only latin country that's big on latin genre */

4. Number of tracks for each format types in the music store

SELECT m.name, count(t.TrackId) as num 
from MediaType m join Track t on m.MediaTypeId=t.MediaTypeId
group by 1
order by 2 desc

/* Mpeg dominating. However aac will be on the rise since tie to iPhone */
