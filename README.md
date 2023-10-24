# SAS-PROJET-grp4

# Attention!!! Changez le libname si vous tourner les code

## Exposé de l'analyse

Dans le cadre de notre projet de groupe, nous proposons une analyse sur le niveau d'éducation au Niger.
Nous utiliserons principalement des données issues de l'Enquête Harmonisée sur le Conditions de Vie des 
Ménages conduite au Niger par l'Institut National de la statistique entre 2018 et 2019.
Cette enquête sur un échantillon de 35470 individus représentatif de la population nigérienne permet à la foiS une analyse sur les individus et les ménages. 

Pour notre part, nous mènerons une analyse un peu plus agrégée. En effet, nous nous intéressons à l'évolution du niveau d'éducation moyen de la population nigérienne.
Notre analyse tâchera de repondre aux questions suivantes:
* s'il existe une différence de niveau d'éducation entre les femmes et les hommes?
* Existe-t-il un ligne entre le milieu de résidence (rural vs urbain) et le niveau d'éducation?
* Comment ces différences fonction du genre et du sexe ont-elles variée dans le temps?
* si cette différence existe est-elle uniformément repartie sur le territoire nigérien ?


## Les différentes étapes d'analyse

### Etape 1: Joindre les tables de données
Nous disposons de deux tables de données issues de l'enquête sus mentionnée. 
La première table nommée individus regroupe les informations propres aux individus notamment l'âge, le genre, le milieu d'habitation ou la région d'habitation.
La seconde table présente de manière spécifique des informations exhaustives sur le parcours scolaire de chaque individu.
Pour pouvoir croiser les caractérisques individuelles des enquêtés et les informations sur leur parcours scolaire, nous constituons une table commune à partir de nos deux tables de données.

#### Clés de correspondance 

"grappe"="grappe",

"vague"="vague",

 "id_menage"="menage",
 
 "s01q00a"="numind"

### Etape 2: Reconstituer le nombre d'années études de chaque individu ; 
Nous disposons d'informations dispersées dans plusieurs variables pour reconstituer le nombre d'année de scolarité de chaque individu. Ces informations se trouvent principalement dans les variables s02q14, s02q16, s02q29 et s02q31. A partir de ces variables, nous reconstituons le nombre d'années d'études de chaque individu de notre table de données.

#### Les variables

sexe : Genre  \\ '1: Masculin' '2: Féminin' \\ 

age : Age en années \\ Num: 0 to 130 \\ 

milieu : Milieu residence \\ '1: Urbain' '2: Rural' \\ 

s02q03 : X a-t-il fait ou fait-il des études actuellement dans une école formelle \\ '1: Oui' '2: Non' \\ 

s02q05 : Est ce que X a suivi une école non formelle ou un formation non formelle 
\\ '1: Oui' '2: Non' \\ 

s02q14 : Quel est le niveau d'études suivi par X au cours de l'année 2017/18 ? \\ '1: Maternelle' '2: Primaire' '3: Secondaire 1  (Post Primaire) générale' '4: Secondaire 1  (Post Primaire) technique' '5: Secondaire 2 générale'... \\ 

s02q16 : Quelle est la classe fréquente par X dans le niveau déclaré en 2017/18 \\ '1: 1ère année' '2: 2ème année' '3: 3ème année' '4: 4ème année' '5: 5ème année'... \\ 

s02q29 : Quel est le niveau d'études le plus élevé atteint par X? \\ '1: Maternelle' '2: Primaire' '3: Secondaire 1  (Post Primaire) générale' '4: Secondaire 1  (Post Primaire) technique' '5: Secondaire 2 générale'... \\ 

s02q31 : Quelle est la dernière classe fréquente par X  dans le niveau déclaré \\ '1: 1ère année' '2: 2ème année' '3: 3ème année' '4: 4ème année' '5: 5ème année'... \\ 


### Etape 3 : Construire des classes d'âges
A partir de la variable age, nous construisons des cohortes ou classes d'âge de 5 années. Nous ne tenons que les individus nés entre 1950 et 2000.

### Etape 5
Notre analyse commence par une brêve description de la composition de notre échantillon à travers quelques statistiques descriptives. On présente la répartion des individus par genre, par milieu d'habitation.

Nous présentons les résultats de nos analyses à l'aide de trois graphiques:
* le premier présente l'évolution du nombre d'années d'études moyen selon le genre et la génération de naissance.
* le second présente l'évolution du nombre d'années d'études moyen selon le genre, la génération de naissance et le milieu de résidence.
* et le dernier présente l'évolution du nombre d'années d'études moyen selon le genre, la génération de naissance et la région de résidence.




## Dossier `Programme`

Dans le dossier `Programme` se trouve deux script sous language SAS et un script R. Le premier nommé `wrangling` nous a servi pour le traitement et la mise en forme des données et le second `plotsSAS` a servi générer les différents graphiques. Ces graphes sont stockés dans le dossier `Projet`. Le script R reproduit le même graphes que ceux généré avec le script SAS.

## Dossier `Projet`

Dans le dossier `Projet` se trouve les graphiques générés avec le code SAS et R.
