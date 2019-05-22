/*Exercici Queries SQL*/

/*
a. Primer és indiferent si son el inserts de la taula USAirport o Carriers, però lo important és que els últims siguin els de Flights perquè necessita que les columnes del camp Origin coincideixin amb IATA i les de UniqueCarrier amb Carriercode en les altres taules.
b. No, hi han més camps dels necessaris, però els he esborrat perquè estan buits i no aporten res. 
*/

/*1*/
select count(*) as "total" from Flights;

/*2*/
select Origin, avg(ArrDelay) as "prom_arribades", avg(DepDelay) as "prom_sortides" from Flights group by Origin;

/*3*/
select Origin, colYear, colMonth, avg(ArrDelay) as "prom_arribades" from Flights 
group by Origin, colYear, colMonth;

/*4*/
select a.City, f.colYear, f.colMonth, avg(f.ArrDelay) as "prom_arribades" 
from USAirports a join Flights f on a.IATA=f.Origin 
group by a.City, f.colYear, f.colMonth;

/*5*/
select UniqueCarrier, colYear, colMonth, avg(ArrDelay) as "avg_delay", sum(Cancelled) as "total_cancelled" 
from Flights group by UniqueCarrier, colYear, colMonth order by total_cancelled desc;

/*6*/
select TailNum, sum(Distance) as "totalDistance" 
from Flights group by TailNum order by totalDistance desc
LIMIT 1, 10;

/*7*/
select UniqueCarrier, avg(ArrDelay) as "avgDelay" 
from Flights group by UniqueCarrier having AvgDelay > 10
order by avgDelay desc;

