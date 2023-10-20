/* Définition de libname pour faciliter l'accèes aux dossiers
d'importation et de stockage des données et des résultats;*/
libname indata "/home/u62536009/Projet/data";
libname outdata "/home/u62536009/Projet/data";
libname result "/home/u62536009/Projet/resultat";
* importation des données;

proc import out=indata.indi(keep=grappe vague menage numind sexe age milieu 
		region rename=(menage=id_menage)) 
		datafile='/home/u62536009/Projet/data/individus.dta' dbms=DTA replace;
run;

proc import out=indata.educ(keep=grappe vague id_menage s01q00a s02q03 s02q05 
		s02q14 s02q16 s02q29 s02q31 rename=(s01q00a=numind)) 
		datafile='/home/u62536009/Projet/data/data_educ.dta' dbms=DTA replace;
run;

* structure des data;

proc contents data=indata.indi;
run;

proc contents data=indata.educ;
run;

* Jointure données;
* sort;

proc sort data=indata.indi out=indata.s_indi;
	by grappe vague id_menage numind;
run;

proc sort data=indata.educ out=indata.s_educ;
	by grappe vague id_menage numind;
run;

* merge;

data indata.m_data;
	merge indata.s_indi (in=a) indata.s_educ (in=b);
	by grappe vague id_menage numind;

	if b;
run;

/*
Recodage variables
Passage de niveau d'éducation à années d'études
groupe d'âge selon les années de naissance
*/
data indata.data(keep=sexe age milieu region ane naissance age group_age 
		rename=(ane=educ_an));
	set indata.m_data;

	if s02q14 in (1) or s02q29 in (1) then
		eq_ane=-10000;
	else if s02q14 in (2) or s02q29 in (2) then
		eq_ane=0;
	else if s02q14 in (3, 4) or s02q29 in (3, 4) then
		eq_ane=6;
	else if s02q14 in (5, 6) or s02q29 in (5, 6) then
		eq_ane=10;
	else if s02q14 in (7, 8) or s02q29 in (7, 8) then
		eq_ane=13;

	if not missing(s02q16) then
		an=s02q16;
	else if not missing(s02q31) then
		an=s02q31;
	ane=eq_ane + an;

	if ane < 0 then
		ane=0;
	naissance=2018 - age;
	group_age="..........";

	if naissance < 1949 then
		group_age="-1950";
	else if naissance >=1950 and naissance <=1954 then
		group_age='1950-1954';
	else if naissance >=1955 and naissance <=1959 then
		group_age='1955-1959';
	else if naissance >=1960 and naissance <=1964 then
		group_age='1960-1964';
	else if naissance >=1965 and naissance <=1969 then
		group_age='1965-1969';
	else if naissance >=1970 and naissance <=1974 then
		group_age='1970-1974';
	else if naissance >=1975 and naissance <=1979 then
		group_age='1975-1979';
	else if naissance >=1980 and naissance <=1984 then
		group_age='1980-1984';
	else if naissance >=1985 and naissance <=1989 then
		group_age='1985-1989';
	else if naissance >=1990 and naissance <=1994 then
		group_age='1990-1994';
	else if naissance >=1995 and naissance <=2000 then
		group_age='1995-2000';
	else if naissance > 2000 then
		group_age='+2000';
	where sexe^=. or age^=. or milieu^=.;
run;

* some stats;

proc freq data=indata.data;
	tables sexe;
run;