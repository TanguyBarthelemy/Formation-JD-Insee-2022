# Formations-JD-Insee-2022

## Présentation et installation
Voici les supports, codes et data utilisés pour la formation. Pour obtenir ces documents :
 - Soit vous les téléchargez avec en .zip avec le bouton `Code` puis les dézippez dans un dossier sur votre ordinateur
 ![plot](https://github.com/TanguyBarthelemy/Formations-JD-Insee-2022/blob/main/img/code_button.png?raw=true)
 - Soit vous pouvez directement cloner le répertoire entier avec `git clone https://github.com/TanguyBarthelemy/Formations-JD-Insee-2022.git` *via* Rstudio ou la console Git par exemple. 

## Utiliser les supports
Une fois le répertoire sur votre ordinateur :
 * les documents, slides et WS sont accessibles en ouvrant le dossier et les différents éléments directement.
 * Concernant le code, je conseille fortement d'ouvrir le projet *via* Rstudio en ouvrant le fichier **Formations-JD-Insee-2022.Rproj**.
 * Sinon (dans le cas où vous ouvrez les fichiers R sans avoir au préalable ouvert le .Rproj), il faut penser à changer la localisation du dossier de travail (le working directory). Ainsi, il faut rajouter en début de code :
```r
setwd("C:/Users/Tanguy/Documents/.../Votre_chemin/...Formations-JD-Insee-2022")
```
⚠️ Sans oublier de remplacer les `\` par des `/` !

## Utiliser les WS
⚠️ Dans tous les cas, les datas des WS (dossier data) ont été déplacés et les chemins doivent être modifiés ! 

Si vous voulez **utiliser et tester les WS fournis**, il faut faire tourner le programme `initialise_chemin_WS.R` qui s'appuie sur le code `Modif_chemin_WS.R` vu en formation.
Le seul argument à changer est la variable `chemin_du_dossier` à la ligne 9 :
```r
# Définition des paramètres ----------------------------------------------------
chemin_du_dossier <- "C:/Users/Tanguy/Documents/.../Votre_chemin/...Formations-JD-Insee-2022"
```
Une fois le chemin changé, vous pouvez faire tourner le programme en entier (`Ctrl + A` puis `Ctrl + Enter`).

Si vous souhaiter uniquement utiliser vos données la section précédente n'est pas utile.


