
################################################################################
#####################        Modifier chemin d'un WS        ####################
################################################################################


# Définition des paramètres ----------------------------------------------------

# Les chemins doivent être écrit de manière absolue

# PARAM 1 : nouvel emplacement du workspace 
ch_new_ws <- "Z:/temp/nouveau_projet/WS_folder/"

# PARAM 2 : nouvel emplacement donnees
ch_donnees <- "Z:/temp/nouveau_projet/data/IPI_nace4.csv"

# PARAM 3 : chemin du xml
ch_fic_xml <- paste0(ch_new_ws, "/WS_ref/SAProcessing/SAProcessing-1.xml")
ch_fic_xml


# Transformation des chemins ---------------------------------------------------

# mise au format JD+ du chemin de donnees 
ch_donnees_JD <- ch_donnees |> 
    gsub(pattern = ":", replacement = "%3A") |> 
    gsub(pattern = "/", replacement = "%5C")
ch_donnees_JD

# lecture fichier xml 
anc_xml <- readLines(ch_fic_xml)

# on recupere les noms de series dans fichier donnees
ipi <- read.csv2(ch_donnees)
noms_series_csv <- colnames(ipi)[-1] # on enleve la date


# Ecriture des chemins ---------------------------------------------------------

# Pour chaque série
#   - On remplace chaque occurence de l'ancien chemin par le nouveau
#   - On recupère sa position +8 = ligne avec le chemin du fichier de donnees
new_xml <- anc_xml
for (i in seq_along(noms_series_csv)) {
  print(noms_series_csv[i])
  ligne_path <- grep(noms_series_csv[i], new_xml) + 8
  chaine1 <- strsplit(x = new_xml[ligne_path], split = "file=")[[1]]
  chaine2 <- strsplit(x = chaine1[2], split = ".csv")[[1]]
  # Ajout de la nouvelle ligne de chemin
  new_xml[ligne_path] <- paste0(chaine1[1], "file=", ch_donnees_JD, chaine2[2])
}
# Ecriture du fichier XML
writeLines(new_xml, ch_fic_xml)
