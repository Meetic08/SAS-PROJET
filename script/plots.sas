* libname;
libname indata "/home/u62536009/Projet/data";
libname outdata "/home/u62536009/Projet/data";
libname result "/home/u62536009/Projet/resultat";

/*
Moyenne des années de scolarité selon la génération au Niger
*/
/* Préparation de la données */
proc sql;
create table filtered_data as
select *
  from indata.data
where naissance >= 1950 and naissance <= 2000;
quit;

/* Agregation groupe d'âge et sexe */
  proc means data=filtered_data noprint;
class group_age sexe;
var educ_an;
output out=summary_data mean=mo n=n;
run;

/* Plot par génération et selon le sexe */
proc sgplot data=summary_data(firstobs=14);
scatter x=group_age y=mo / group=sexe groupdisplay=cluster
markerattrs=(symbol=circlefilled);
series x=group_age y=mo / group=sexe;
xaxis display=(nolabel);
yaxis grid label='Moyenne des années d''études';
keylegend / title='sexe' position=bottom across=1;
title 'Moyenne des années de scolarité selon la génération au Niger';
run;

***************;

/*
'Moyenne des années de scolarité selon la génération au Niger et la région'
*/
/* Préparation de la données */
proc means data=indata.data nway noprint;
  where naissance >= 1950 and naissance <= 2000;
  class group_age sexe region;
  var educ_an;
  output out=summary_data mean=mo n=n;
run;

/* Agregation groupe d'âge et sexe */
data summary_data;
  set summary_data;
  if not missing(mo) and not missing(n);
run;

/* Plot par génération, region d'habitation et selon le sexe */
* région de Niamey (la région la plus développée);
proc sgplot data=summary_data;
where region=8;
scatter x=group_age y=mo / group=sexe groupdisplay=cluster
markerattrs=(symbol=circlefilled);
series x=group_age y=mo / group=sexe;
xaxis display=(nolabel);
yaxis grid label='Moyenne des années d''études';
keylegend / title='sexe' position=bottom across=1;
title 'Moyenne des années de scolarité selon la génération au Niger';
run;
**************;
* région de Diffa (la région la moins développée);
proc sgplot data=summary_data;
where region=2;
scatter x=group_age y=mo / group=sexe groupdisplay=cluster
markerattrs=(symbol=circlefilled);
series x=group_age y=mo / group=sexe;
xaxis display=(nolabel);
yaxis grid label='Moyenne des années d''études';
keylegend / title='sexe' position=bottom across=1;
title 'Moyenne des années de scolarité selon la génération au Niger';
run;

**************;
* région de Maradi (économiquement développée mais conservatrice);
proc sgplot data=summary_data;
where region=4;
scatter x=group_age y=mo / group=sexe groupdisplay=cluster
markerattrs=(symbol=circlefilled);
series x=group_age y=mo / group=sexe;
xaxis display=(nolabel);
yaxis grid label='Moyenne des années d''études';
keylegend / title='sexe' position=bottom across=1;
title 'Moyenne des années de scolarité selon la génération au Niger';
run;
**************;
*milieu;

/*
'Moyenne des années de scolarité selon la génération au Niger et le milieu d'habitation'
*/
/* Préparation de la données */
proc means data=indata.data nway noprint;
  where naissance >= 1950 and naissance <= 2000;
  class group_age sexe milieu;
  var educ_an;
  output out=summary_data mean=mo n=n;
run;

/* Plot par génération, milieu d'habitation et selon le sexe */
* milieu urbain;
proc sgplot data=summary_data;
where milieu=1;
scatter x=group_age y=mo / group=sexe groupdisplay=cluster
markerattrs=(symbol=circlefilled);
series x=group_age y=mo / group=sexe;
xaxis display=(nolabel);
yaxis grid label='Moyenne des années d''études';
keylegend / title='sexe' position=bottom across=1;
title 'Moyenne des années de scolarité selon la génération au Niger';
run;

*milieu rural;
proc sgplot data=summary_data;
where milieu=2;
*panelby region;
scatter x=group_age y=mo / group=sexe groupdisplay=cluster
markerattrs=(symbol=circlefilled);
series x=group_age y=mo / group=sexe;
xaxis display=(nolabel);
yaxis grid label='Moyenne des années d''études';
keylegend / title='sexe' position=bottom across=1;
title 'Moyenne des années de scolarité selon la génération au Niger';
run;


