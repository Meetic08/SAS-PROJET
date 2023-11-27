* libname;
libname indata "/home/u62536009/Projet/data";


/*
Moyenne des années de scolarité selon la génération au Niger
*/
/* Préparation de la données */
proc sql;
create table g_filtered_data as
select *
  from indata.data
where naissance >= 1950 and naissance <= 2000;
quit;

/* Agregation groupe d'âge et sexe */
proc means data=g_filtered_data noprint;
class group_age sexe;
var educ_an;
output out=g_summary_data mean=mo n=n;
run;

/* Plot par génération et selon le sexe */
proc sgplot data=g_summary_data(firstobs=14);
scatter x=group_age y=mo / group=sexe groupdisplay=cluster
markerattrs=(symbol=circlefilled);
series x=group_age y=mo / group=sexe;
xaxis display=(nolabel);
yaxis grid label='Moyenne des années d''études';
keylegend / title='sexe (1=Homme, 2=Femme)' position=bottom across=2;
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
  output out=r_summary_data mean=mo n=n;
run;

/* Agregation groupe d'âge et sexe */
data r_summary_data;
  set r_summary_data;
  if not missing(mo) and not missing(n);
run;

/* Plot par génération, region d'habitation et selon le sexe */
* région de Niamey (la région la plus développée);
proc sgplot data=r_summary_data;
where region=8;
scatter x=group_age y=mo / group=sexe groupdisplay=cluster
markerattrs=(symbol=circlefilled);
series x=group_age y=mo / group=sexe;
xaxis display=(nolabel);
yaxis grid label='Moyenne des années d''études';
keylegend / title='sexe (1=Homme, 2=Femme)' position=bottom across=2;
title 'Moyenne des années de scolarité selon la génération au Niger (Niamey)';
run;
**************;
* région de Diffa (la région la moins développée);
proc sgplot data=r_summary_data;
where region=2;
scatter x=group_age y=mo / group=sexe groupdisplay=cluster
markerattrs=(symbol=circlefilled);
series x=group_age y=mo / group=sexe;
xaxis display=(nolabel);
yaxis grid label='Moyenne des années d''études';
keylegend / title='sexe (1=Homme, 2=Femme)' position=bottom across=2;
title 'Moyenne des années de scolarité selon la génération au Niger (Diffa)';
run;

**************;
* région de Maradi (économiquement développée mais conservatrice);
proc sgplot data=r_summary_data;
where region=4;
scatter x=group_age y=mo / group=sexe groupdisplay=cluster
markerattrs=(symbol=circlefilled);
series x=group_age y=mo / group=sexe;
xaxis display=(nolabel);
yaxis grid label='Moyenne des années d''études';
keylegend / title='sexe (1=Homme, 2=Femme)' position=bottom across=2;
title 'Moyenne des années de scolarité selon la génération au Niger (Maradi)';
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
  output out=d_summary_data mean=mo n=n;
run;

/* Plot par génération, milieu d'habitation et selon le sexe */
* milieu urbain;
proc sgplot data=d_summary_data;
where milieu=1;
scatter x=group_age y=mo / group=sexe groupdisplay=cluster
markerattrs=(symbol=circlefilled);
series x=group_age y=mo / group=sexe;
xaxis display=(nolabel);
yaxis grid label='Moyenne des années d''études';
keylegend / title='sexe (1=Homme, 2=Femme)' position=bottom across=2;
title 'Moyenne des années de scolarité selon la génération au Niger (urbain)';
run;

*milieu rural;
proc sgplot data=d_summary_data;
where milieu=2;
*panelby region;
scatter x=group_age y=mo / group=sexe groupdisplay=cluster
markerattrs=(symbol=circlefilled);
series x=group_age y=mo / group=sexe;
xaxis display=(nolabel);
yaxis grid label='Moyenne des années d''études';
keylegend / title='sexe (1=Homme, 2=Femme)' position=bottom across=2;
title 'Moyenne des années de scolarité selon la génération au Niger (rural)';
run;


