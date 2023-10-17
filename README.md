# SAS-PROJET-grp4

test initiation git 

## Exposé de l'analyse

Dans le cadre de notre projet de groupe, nous proposons une analyse sur le niveau d'éducation au Niger.
Nous utiliserons principalement des données issues de l'Enquête Harmonisée sur le Conditions de Vie des 
Ménages conduite au Niger par l'Institut National de la statistique entre 2018 et 2019.
Cette enquête représentative de la population nigérienne permet à la foiS une analyse sur les individus et les ménages. 

Pour notre par, nous ménerons une analyse un peu plus agrégée. En effet, nous nous demanderons:
* s'il existe une différence de niveau d'éducation entre les femmes et les hommes?
* Existe-t-il un ligne entre le milieu de résidence (rural vs urbain) et le niveau d'éducation?
* Comment ces différences fonction du genre et du sexe ont-elles variée dans le temps?
* si cette différence existe est-elle uniformément repartie sur le territoire nigérien ?


## Les différentes étapes d'analyse

### Etape 1
Joindre les deux bases de données

### Etape 2 
Construire le nombre d'années études de chaque individu ; nous disposons d'informations parcellaires 
dans les variables s02q14, s02q16, s02q29 et s02q31

### Etape 3
Construire des classes d'âges

### Etape 5
Faire l'analyse et sortir principalement des plots


### Les variables
sexe,

age,

milieu,

s02q03 (a-t-il fait ou fait-il des études actuellement dans une école formelle?)

s02q05 (Est ce que X a suivi une école non formelle ou une formation non-formelle?)

s02q14 (Quel est le niveau d'études suivi par X au cours de l'année 2017/2018?)

s02q16 (Quelle est la classe fréquentée par X  dans le niveau déclaré au cours de l'année 2017/2018?)

s02q29 (Quel est le niveau d'études le plus élevé atteint par X?)

s02q31 (Quelle est la dernière classe fréquentée par X dans le niveau déclaré?)



### Clés de correspondance 

"grappe"="grappe",

"vague"="vague",

 "id_menage"="menage",
 
 "s01q00a"="numind")

