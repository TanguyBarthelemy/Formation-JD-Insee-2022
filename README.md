# Formations JDemetra+ Insee

## Présentation et installation
Voici les supports, codes et data utilisés pour la formation. Pour obtenir ces documents :

- Soit vous les téléchargez avec en .zip avec le bouton `Code` puis `Download ZIP` et les dézippez dans un dossier sur votre ordinateur

![plot](https://github.com/TanguyBarthelemy/Formations-JD-Insee/blob/main/img/code_button.png?raw=true)
 
- Soit vous pouvez directement cloner le répertoire entier avec `git clone https://github.com/TanguyBarthelemy/Formations-JD-Insee.git` *via* Rstudio ou la console Git par exemple. 

## Utiliser les supports
Une fois le répertoire sur votre ordinateur :

* les documents, slides et WS sont accessibles en ouvrant le dossier et les différents éléments directement.
* Concernant le code, je conseille fortement d'ouvrir le projet *via* Rstudio en ouvrant le fichier **Formations-JD-Insee.Rproj**.
* Sinon (dans le cas où vous ouvrez les fichiers R sans avoir au préalable ouvert le .Rproj), il faut penser à changer la localisation du dossier de travail (le working directory). Ainsi, il faut rajouter en début de code :
 
```r
setwd("C:/Users/Tanguy/Documents/.../Votre_chemin/.../Formations-JD-Insee-main/")
```

⚠️ Sans oublier de remplacer les `\` par des `/` !

## Utiliser les WS
⚠️ Dans tous les cas, les datas des WS (dossier data) ont été déplacés et les chemins doivent être modifiés ! 

Si vous voulez **utiliser et tester les WS fournis**, il faut faire tourner le programme `initialise_chemin_WS.R` qui s'appuie sur le code `Modif_chemin_WS.R` vu en formation.
Le seul argument à changer est la variable `chemin_du_dossier` à la ligne 9 :

```r
# Définition des paramètres ----------------------------------------------------
chemin_du_dossier <- "C:/Users/Tanguy/Documents/.../Votre_chemin/.../Formations-JD-Insee-main/"
```
Une fois le chemin changé, vous pouvez faire tourner le programme en entier (`Ctrl + A` puis `Ctrl + Enter`).

Si vous souhaiter uniquement utiliser vos données la section précédente n'est pas utile.

## Les packages à installer

Il faut installer les packages **JDCruncher**, **RJDemetra**, **rjwsacruncher**, **rjdmarkdown**, **ggdemetra**, **gridExtra**, **dplyr**, **zoo**, **tidyr**, **magrittr**, **forecast**, **dygraphs**, **ggplot2**, **xlsx**, **waldo**, **XLConnect**, **XML**, **remotes**.

Voilà les codes :
```r
install.packages(c("RJDemetra", "rjwsacruncher", "rjdmarkdown", "ggdemetra", "forecast", "zoo", 
                   "magrittr", "dplyr", "tidyr", "ggplot2", "dygraphs", "gridExtra", 
                   "XLConnect", "xlsx", "XML", "remotes", "waldo"))
remotes::install_github("InseeFr/JDCruncheR")
```

## Comment poser une question ?

Pour poser une question, vous pouvez nous envoyer un mail à Anna (anna.smyk@insee.fr) et moi (tanguy.barthelemy@insee.fr) ou compléter une issue directement sur Github.
Pour compléter une issue, il suffit de :

1. Se rendre dans l'onglet *Issues* :

![plot](https://github.com/TanguyBarthelemy/Formations-JD-Insee/blob/main/img/issue_panel.png?raw=true)

2. Cliquer sur *New issue* :

![plot](https://github.com/TanguyBarthelemy/Formations-JD-Insee/blob/main/img/create_issue.png?raw=true)

3. Choisir un des thèmes proposés dans la liste et cliquer sur *Get started* :

![plot](https://github.com/TanguyBarthelemy/Formations-JD-Insee/blob/main/img/choose_issue.png?raw=true)

4. Remplir la question avec un titre et un texte pour expliquer le problème ou la question et cliquer sur *Submit new issue* :

![plot](https://github.com/TanguyBarthelemy/Formations-JD-Insee/blob/main/img/complete_issue.png?raw=true)

Voilà et merci !

