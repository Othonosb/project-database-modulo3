-- Países com maior quantidade de campeões mundiais

select count(distinct driverid) as numero, nationality from (select maximos.year,maximos.pontos,drivers.forename,drivers.driverid,drivers.surname,drivers.nationality from driverstandings  inner join drivers  on driverstandings.driverID=drivers.driverid
inner join
(
select max(ds.points) as pontos,r.raceid,r.year
from driverstandings ds inner join races r on ds.raceID=r.raceid
inner join
(select (max(races.raceid)) as max_race_id,races.year 
from races
group by year)as max_race
on max_race.max_race_id=ds.raceid
group by r.year,r.raceid) as maximos
on  driverstandings.raceid=maximos.raceid and driverstandings.points=maximos.pontos
order by maximos.year desc) x
group by nationality
order by count(distinct driverid) desc;

-- Países com maior quantidade de titulos

select nationality as Nacionalidade, count(nationality) as 'Número de títulos' from (select maximos.year,maximos.pontos,drivers.forename,drivers.driverid,drivers.surname,drivers.nationality from driverstandings  inner join drivers  on driverstandings.driverID=drivers.driverid
inner join
(
select max(ds.points) as pontos,r.raceid,r.year
from driverstandings ds inner join races r on ds.raceID=r.raceid
inner join
(select (max(races.raceid)) as max_race_id,races.year 
from races
group by year)as max_race
on max_race.max_race_id=ds.raceid
group by r.year,r.raceid) as maximos
on  driverstandings.raceid=maximos.raceid and driverstandings.points=maximos.pontos
order by maximos.year desc) x
group by nationality
order by count(nationality) desc;

-- Quais países tem mais pilotos?

select nationality, count(nationality) from drivers group by nationality order by count(nationality) desc;

-- Quantas equipes passaram pela F1?

select count(*) from constructors;

-- Quais foram as voltas mais rápidas em Interlagos (por década ou últimos 10 anos) e os pilotos

select concat(d.forename, ' ', d.surname) as name, b.year, b.name, a.lap, a.time, a.milliseconds from laptimes a
inner join races b
on a.raceid = b.raceid
inner join circuits c
on b.circuitid = c.circuitid
inner join drivers d
on a.driverid = d.driverid
where c.circuitid = 18 and b.year > 2007
order by a.time, a.milliseconds;

-- Paises ou Continentes que mais receberam corridas na historia por decada

(select 
b.country as pais,
count(*) as cont,
case
when a.year between 1950 and 1959 then '50s'
when a.year between 1960 and 1969 then '60s'
when a.year between 1970 and 1979 then '70s'
when a.year between 1980 and 1989 then '80s'
when a.year between 1990 and 1999 then '90s'
when a.year between 2000 and 2009 then '2000s'
when a.year between 2010 and 2019 then '2010s'
when a.year between 2020 and 2022 then '2020s'
end as decada
from races a inner join circuits b on a.circuitID=b.circuitID
group by pais,decada
having decada='50s'
order by cont desc
limit 3)
UNION 
(select 
b.country as pais,
count(*) as cont,
case
when a.year between 1950 and 1959 then '50s'
when a.year between 1960 and 1969 then '60s'
when a.year between 1970 and 1979 then '70s'
when a.year between 1980 and 1989 then '80s'
when a.year between 1990 and 1999 then '90s'
when a.year between 2000 and 2009 then '2000s'
when a.year between 2010 and 2019 then '2010s'
when a.year between 2020 and 2022 then '2020s'
end as decada
from races a inner join circuits b on a.circuitID=b.circuitID
group by pais,decada
having decada='60s'
order by cont desc
limit 3)
union
(select 
b.country as pais,
count(*) as cont,
case
when a.year between 1950 and 1959 then '50s'
when a.year between 1960 and 1969 then '60s'
when a.year between 1970 and 1979 then '70s'
when a.year between 1980 and 1989 then '80s'
when a.year between 1990 and 1999 then '90s'
when a.year between 2000 and 2009 then '2000s'
when a.year between 2010 and 2019 then '2010s'
when a.year between 2020 and 2022 then '2020s'
end as decada
from races a inner join circuits b on a.circuitID=b.circuitID
group by pais,decada
having decada='70s'
order by cont desc
limit 3)
union
(select 
b.country as pais,
count(*) as cont,
case
when a.year between 1950 and 1959 then '50s'
when a.year between 1960 and 1969 then '60s'
when a.year between 1970 and 1979 then '70s'
when a.year between 1980 and 1989 then '80s'
when a.year between 1990 and 1999 then '90s'
when a.year between 2000 and 2009 then '2000s'
when a.year between 2010 and 2019 then '2010s'
when a.year between 2020 and 2022 then '2020s'
end as decada
from races a inner join circuits b on a.circuitID=b.circuitID
group by pais,decada
having decada='80s'
order by cont desc
limit 3)
union
(select 
b.country as pais,
count(*) as cont,
case
when a.year between 1950 and 1959 then '50s'
when a.year between 1960 and 1969 then '60s'
when a.year between 1970 and 1979 then '70s'
when a.year between 1980 and 1989 then '80s'
when a.year between 1990 and 1999 then '90s'
when a.year between 2000 and 2009 then '2000s'
when a.year between 2010 and 2019 then '2010s'
when a.year between 2020 and 2022 then '2020s'
end as decada
from races a inner join circuits b on a.circuitID=b.circuitID
group by pais,decada
having decada='90s'
order by cont desc
limit 3)
union
(select 
b.country as pais,
count(*) as cont,
case
when a.year between 1950 and 1959 then '50s'
when a.year between 1960 and 1969 then '60s'
when a.year between 1970 and 1979 then '70s'
when a.year between 1980 and 1989 then '80s'
when a.year between 1990 and 1999 then '90s'
when a.year between 2000 and 2009 then '2000s'
when a.year between 2010 and 2019 then '2010s'
when a.year between 2020 and 2022 then '2020s'
end as decada
from races a inner join circuits b on a.circuitID=b.circuitID
group by pais,decada
having decada='2000s'
order by cont desc
limit 3)
union
(select 
b.country as pais,
count(*) as cont,
case
when a.year between 1950 and 1959 then '50s'
when a.year between 1960 and 1969 then '60s'
when a.year between 1970 and 1979 then '70s'
when a.year between 1980 and 1989 then '80s'
when a.year between 1990 and 1999 then '90s'
when a.year between 2000 and 2009 then '2000s'
when a.year between 2010 and 2019 then '2010s'
when a.year between 2020 and 2022 then '2020s'
end as decada
from races a inner join circuits b on a.circuitID=b.circuitID
group by pais,decada
having decada='2010s'
order by cont desc
limit 3)
union
(select 
b.country as pais,
count(*) as cont,
case
when a.year between 1950 and 1959 then '50s'
when a.year between 1960 and 1969 then '60s'
when a.year between 1970 and 1979 then '70s'
when a.year between 1980 and 1989 then '80s'
when a.year between 1990 and 1999 then '90s'
when a.year between 2000 and 2009 then '2000s'
when a.year between 2010 and 2019 then '2010s'
when a.year between 2020 and 2022 then '2020s'
end as decada
from races a inner join circuits b on a.circuitID=b.circuitID
group by pais,decada
having decada='2020s'
order by cont desc
limit 3);

-- lsita dos campeoes
select maximos.year,maximos.pontos,drivers.forename,drivers.surname from driverstandings  inner join drivers  on driverstandings.driverID=drivers.driverid
inner join
(
select max(ds.points) as pontos,r.raceid,r.year
from driverstandings ds inner join races r on ds.raceID=r.raceid
inner join
(select (max(races.raceid)) as max_race_id,races.year 
from races
group by year) as max_race
on max_race.max_race_id=ds.raceid
group by r.year,r.raceid) as maximos
on  driverstandings.raceid=maximos.raceid and driverstandings.points=maximos.pontos
order by maximos.year desc;

-- Top 10 Falhas
select count(*) as Quantidade,stu.status
from results res inner join status stu on res.statusid=stu.statusID
where stu.statusid not in (1,2,11,12,13,14,15,16,17,18,19,45,50,53,55,58,88,111,112,113,114,115,116,117,118,119,120,122,123,124,125,127,128,133,134,102,62,81,97,54)
group by status
order by 1 desc
limit 10;


-- Presença brasileira no podio,por decada
select count(*),case
when r.year between 1950 and 1959 then '50s'
when r.year between 1960 and 1969 then '60s'
when r.year between 1970 and 1979 then '70s'
when r.year between 1980 and 1989 then '80s'
when r.year between 1990 and 1999 then '90s'
when r.year between 2000 and 2009 then '2000s'
when r.year between 2010 and 2019 then '2010s'
when r.year between 2020 and 2022 then '2020s'
end as decada
from driverstandings ds
inner join drivers d on ds.driverID=d.driverID
inner join races r on ds.raceid=r.raceid
where ds.position in (1,2,3) and d.nationality='Brazilian'
group by  decada
order by 2 desc ;





-- Comparativo Quantidade de Vitorias X Quantidade de titulos
-- um grafico top 10 com os maiores ganhadores do titulo da temporada
select count(*),forename,surname from 
(select maximos.year,maximos.pontos,drivers.forename,drivers.driverid,drivers.surname,drivers.nationality from driverstandings  inner join drivers  on driverstandings.driverID=drivers.driverid
inner join
(
select max(ds.points) as pontos,r.raceid,r.year
from driverstandings ds inner join races r on ds.raceID=r.raceid
inner join
(select (max(races.raceid)) as max_race_id,races.year 
from races
group by year) as max_race
on max_race.max_race_id=ds.raceid
group by r.year,r.raceid) as maximos
on  driverstandings.raceid=maximos.raceid and driverstandings.points=maximos.pontos
order by maximos.year desc) as campeoes
group by driverID
order by 1 desc
limit 10;


-- outro grafico com os maiores vitoriosos de corridas
select count(*),d.forename,d.surname from results res inner join drivers d on res.driverid=d.driverid
where res.position=1
group by res.driverid
order by 1 desc
limit 10;

-- podios por construtor
select count(*),c.name from constructors c 
inner join results r on c.constructorID=r.constructorID where position in (1,2,3)
group by r.constructorid
limit 10;

-- primeiros lugares por construtor
select count(*),c.name from constructors c 
inner join results r on c.constructorID=r.constructorID where position in (1)
group by r.constructorid
order by 1 desc
limit 10;




-- Quantas vezes  que quem esteve na pole venceu a corrida ?
select count(*) as pole_win,r.year from results res 
inner join races r 
on res.raceid=r.raceid
where r.year between 2000 and 2022
and position=1 and grid=1
group by r.year;

-- fazendo o join para trazer a relação entre total de corridas e os vencedores que largaram na pole
select total_corridas.year,total_corridas.total,poles.pole_win,poles.pole_win/total_corridas.total as percentual_decimal,round(poles.pole_win/total_corridas.total*100,2) as percentual from (
select count(*) as total,year
from races 
where year between 2000 and 2022
group by year) total_corridas
inner join
(select count(*) as pole_win,r.year from results res 
inner join races r 
on res.raceid=r.raceid
where r.year between 2000 and 2022
and position=1 and grid=1
group by r.year) as poles 
on total_corridas.year=poles.year;

-- vitorias por pais
select count(*),d.nationality from driverstandings ds
inner join drivers d on ds.driverid=d.driverid 
where ds.position=1
group by d.nationality
order by 1 desc;

-- maiores vencedores do grand prix monaco
select count(*),
d.forename,
d.surname 
from results ds inner join drivers d on ds.driverid=d.driverid
inner join races r on ds.raceid=r.raceid
where ds.position=1 and r.circuitID=6
group by ds.driverid
order by 1 desc
limit 5;




-- vitorias na mclaren
select count(*),d.forename,d.surname from results res 
inner join constructors c on res.constructorID=c.constructorid
inner join drivers d on res.driverid=d.driverid
where c.constructorid in (1) and res.position=1
group by res.driverid
order by 1 desc
limit 5;


-- maiores vencedores do brasil
select count(*),d.forename,d.surname from results res inner join drivers d on res.driverid=d.driverid
where res.position=1 and d.nationality='brazilian'
group by res.driverid
order by 1 desc;
