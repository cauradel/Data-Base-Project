select regions, YR2012, YR2019 FROM child_mortality;

select  min(YR2019), max(YR2019) from child_mortality;
select regions, (YR2019-61.3)/(1094.75-61.3) as YR2019_norm FROM child_mortality;

select  min(YR2019), max(YR2019) from child_mortality
select regions, (YR2019-61.3)/(1094.75-61.3) as YR2019_norm FROM child_mortality;

ALTER TABLE child_mortality 
RENAME TO health_expenditures;
#Code pour normalization, child_mortality doesn't exist anymore

DROP TABLE health_expenditures;

select  min(YR2019), max(YR2019) from gdp_percapita;
create table gdp_norm
select regions, round((gdp_2019-3.78)/(9.15-3.78),2) as gdp_2019_norm FROM gdp_percapita;

select  min(YR2019), max(YR2019) from electricity;
create table electr_norm as
select regions, round((electricity_2019-51.3)/(100-51.3),2) as electricity_2019_norm FROM electricity;

select  min(YR2019), max(YR2019) from health_expenditure;
create table health_norm
select regions, round((health_expenditure_2019-61.3)/(1094.75-61.3),2) as health_2019_norm FROM health_expenditure;

select  min(YR2019), max(YR2019) from life_expectancy;
create table life_norm
select regions, round((life_expectancy_2019-58.1157227231324)/(77.2668440868557-58.1157227231324),2) as life_2019_norm FROM life_expectancy;

select  min(YR2019), max(YR2019) from unemployment_rate;
create table unemployment_norm
select regions, round((unemployment_rate_2019-3.78125137870702)/(9.14592708290942-3.78125137870702),2) as unemployment_2019_norm FROM unemployment_rate;


select  min(YR2019), max(YR2019) from sanitation;
create table sanitation_norm
select regions, round((YR2019-24.2314884943868)/(84.9508549306014-24.2314884943868),2) as sanitation_2019_norm FROM sanitation;


ALTER TABLE electricity
RENAME COLUMN YR2019_norm TO electricity_2019;

ALTER TABLE gdp_percapita
RENAME COLUMN gdp_2019 TO gdp_percapita_2019;

ALTER TABLE health_expenditure
RENAME COLUMN YR2019 TO health_expenditure_2019;

ALTER TABLE life_expectancy
RENAME COLUMN YR2019 TO life_expectancy_2019;

ALTER TABLE unemployment_rate
RENAME COLUMN YR2019 TO unemployment_rate_2019;

ALTER TABLE gdp_percapita
RENAME COLUMN economy TO regions;




select electricity.regions, electricity.electricity_2019, gdp_percapita.gdp_2019, health_expenditure.health_expenditure_2019,life_expectancy.life_expectancy_2019, unemployment_rate.unemployment_rate_2019
from electricity;


select electr_norm.regions, electr_norm.electricity_2019_norm, gdp_norm.gdp_2019_norm,unemployment_norm.unemployment_2019_norm,life_norm.life_2019_norm,health_norm.health_2019_norm
from electr_norm
left join  gdp_norm
on electr_norm.regions=gdp_norm.regions
left join unemployment_norm
on unemployment_norm.regions=gdp_norm.regions
left join life_norm
on life_norm.regions=unemployment_norm.regions
left join health_norm
on health_norm.regions=life_norm.regions;



select electricity.regions, electricity.electricity_2019, health_expenditure.health_expenditure_2019,life_expectancy.life_expectancy_2019, unemployment_rate.unemployment_rate_2019
from electricity;


select electr_norm.regions, electr_norm.electricity_2019_norm, sanitation_norm.sanitation_2019_norm,
unemployment_norm.unemployment_2019_norm,life_norm.life_2019_norm,health_norm.health_2019_norm
from electr_norm
left join  sanitation_norm
on electr_norm.regions=sanitation_norm.regions
left join unemployment_norm
on unemployment_norm.regions=sanitation_norm.regions
left join life_norm
on life_norm.regions=unemployment_norm.regions
left join health_norm
on health_norm.regions=life_norm.regions;

create table if not exists poverty_relief_index(
regions char(10),
poverty_relief_index_2019 char(10));

insert into poverty_relief_index(regions, poverty_relief_index_2019)
values ("AFW", "-0.086"),
("CEB", "0.8"),
("LAC", "0.4"),
("MEA", "0.3"),
("SAS", "0.3");

select regions, poverty_relief_index_2019 from poverty_relief_index;



