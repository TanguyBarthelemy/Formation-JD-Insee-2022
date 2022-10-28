
################################################################################
##################            Initialiser nos WS            ####################
################################################################################


# Définition des paramètres ----------------------------------------------------

chemin_du_dossier <- "C:/Users/Tanguy/Documents/.../Votre_chemin/...Formations-JD-Insee-2022"

chemin_donnees <- paste0(chemin_du_dossier, "/data/IPI_nace4.csv")

changer_chemin_WS <- function(new_chemin_donnees, new_chemin_xml) {
    # Transformation des chemins ---------------------------------------------------
    
    # mise au format JD+ du chemin de donnees 
    ch_donnees_JD <- new_chemin_donnees
    ch_donnees_JD <- gsub(x = ch_donnees_JD, pattern = ":", replacement = "%3A")
    ch_donnees_JD <- gsub(x = ch_donnees_JD, pattern = "/", replacement = "%5C")
    
    # lecture fichier xml 
    anc_xml <- readLines(ch_fic_xml)
    
    # on recupere les noms de series dans fichier donnees
    donnees <- read.csv2(chemin_donnees)
    noms_series_csv <- colnames(donnees)[-1] # on enleve la date
    
    # Ecriture des chemins ---------------------------------------------------------
    
    # Pour chaque série
    #   - On remplace chaque occurence de l'ancien chemin par le nouveau
    #   - On recupère sa position +8 = ligne avec le chemin du fichier de donnees
    new_xml <- anc_xml
    for (i in seq_along(noms_series_csv)) {
        ligne_path <- grep(noms_series_csv[i], new_xml) + 8
        chaine1 <- strsplit(x = new_xml[ligne_path], split = "file=")[[1]]
        chaine2 <- strsplit(x = chaine1[2], split = ".csv")[[1]]
        # Ajout de la nouvelle ligne de chemin
        new_xml[ligne_path] <- paste0(chaine1[1], "file=", ch_donnees_JD, chaine2[2])
    }
    # Ecriture du fichier XML
    writeLines(text = new_xml, con = new_chemin_xml)
}

# Il y a 4 WS à modifier :

changer_chemin_WS(new_chemin_donnees = chemin_donnees, 
                  new_chemin_xml = paste0(chemin_du_dossier, "/WS/WS_ref/IPI_nace4.csv"))

changer_chemin_WS(new_chemin_donnees = chemin_donnees, 
                  new_chemin_xml = paste0(chemin_du_dossier, "/WS/WS_AO_current_approach/IPI_nace4.csv"))

changer_chemin_WS(new_chemin_donnees = chemin_donnees, 
                  new_chemin_xml = paste0(chemin_du_dossier, "/WS/WS_fixed_model/IPI_nace4.csv"))

changer_chemin_WS(new_chemin_donnees = chemin_donnees, 
                  new_chemin_xml = paste0(chemin_du_dossier, "/WS/WS_concurrent/IPI_nace4.csv"))
