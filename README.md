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

\begin{table}[!htbp] \centering \renewcommand*{\arraystretch}{1.1}\caption{Variable Table}
\begin{tabular}{p{0.25\textwidth}p{0.4375\textwidth}p{0.3125\textwidth}}
\hline
\hline
Name & Label & Values \\ 
\hline
sexe & Genre & '1: Masculin' '2: Féminin' \\ 
age & Age en années & Num: 0 to 130 \\ 
milieu & Milieu residence & '1: Urbain' '2: Rural' \\ 
s02q03 & 2.03. [NOM] a-t-il fait ou fait-il des études actuellement dans une école formelle & '1: Oui' '2: Non' \\ 
s02q05 & 2.05. Est ce que [NOM] a suivi un Ã©col non formelle ou un formation non formelle & '1: Oui' '2: Non' \\ 
s02q14 & 2.14. Quel est le niveau d'études suivi par [NOM] au cours de l'année 2017/18 ? & '1: Maternelle' '2: Primaire' '3: Secondaire 1  (Post Primaire) générale' '4: Secondaire 1  (Post Primaire) technique' '5: Secondaire 2 générale' and 3 more \\ 
s02q16 & 2.16. Quelle est la classe fréquente par [NOM] dans le niveau déclaré en 2017/18 & '1: 1ère année' '2: 2ème année' '3: 3ème année' '4: 4ème année' '5: 5ème année' and 5 more \\ 
s02q29 & 2.29. Quel est le niveau d'études le plus Ã©levÃ© atteint par [NOM]? & '1: Maternelle' '2: Primaire' '3: Secondaire 1  (Post Primaire) générale' '4: Secondaire 1  (Post Primaire) technique' '5: Secondaire 2 générale' and 3 more \\ 
s02q31 & 2.31. Quelle est la dernière classe fréquente par [NOM]  dans le niveau déclaré & '1: 1ère année' '2: 2ème année' '3: 3ème année' '4: 4ème année' '5: 5ème année' and 5 more \\ 
\hline
\hline
\end{tabular}
\end{table}


### Clés de correspondance 

"grappe"="grappe",

"vague"="vague",

 "id_menage"="menage",
 
 "s01q00a"="numind")

