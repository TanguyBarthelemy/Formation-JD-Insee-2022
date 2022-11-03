
################################################################################
##################         Bilan qualité avec crunhcer        ##################
################################################################################

# Exemple de bilan qualité avec cruncher sur Worskspace WS_fixed_model.xml

# Import des packages ----------------------------------------------------------

# Package Inseee
library("JDCruncheR")
# Or library(rjwsacruncher) --> CRAN


# Personnalisation des chemins et des séries -----------------------------------

# On choisit d'étudier un WS (par exemple ici le concurrent)
path_folder <- "./WS/WS_concurrent" 
path_xml <- "./WS/WS_concurrent.xml" 
path_matrix <- "./WS/WS_concurrent/Output/SAProcessing-1/demetra_m.csv"


# Paramètres et options du cruncher --------------------------------------------

# Si les fonctions suivantes ne renvoient rien ou que cela ne correspond pas 
#   à un chemin valide ou au bon chemin, il faut compléter les options

# Chemin du cruncher (dossier contenant le fichier .bat)
getOption("cruncher_bin_directory")
# Exemple d'option à poser :
# options(cruncher_bin_directory = "Y:/Logiciels/jwsacruncher-2.2.0/jdemetra-cli-2.2.0/bin")
# options(cruncher_bin_directory = "Y:/Logiciels/JDemetraplus/jwsacruncher-2.2.3/bin/")
# options(cruncher_bin_directory = "C:/Users/UTZK0M/Software/jwsacruncher-2.2.3-bin/bin")

# Séries issues de la décomposition
getOption("default_tsmatrix_series")
# Exemple d'option à poser :
# options(default_tsmatrix_series = c("y","sa","sa_f","s","s_f","ycal","cal","cal_f","d10","d10a"))

# Matrice de qualité
getOption("default_matrix_item")
# Exemple d'option à poser :
# options(default_matrix_item = c("period", "span.start", "span.end", "span.n", "span.missing",
#                                 "espan.start", "espan.end", "espan.n", "log", "adjust", "regression.lp",
#                                 "regression.ntd", "regression.nmh", "regression.td-derived",
#                                 "regression.td-ftest", "regression.easter", "regression.nout",
#                                 "regression.noutao", "regression.noutls", "regression.nouttc",
#                                 "regression.noutso", "regression.td(*):4", "regression.out(*)",
#                                 "regression.user(*)", "likelihood.neffectiveobs", "likelihood.np",
#                                 "likelihood.logvalue", "likelihood.adjustedlogvalue", "likelihood.ssqerr",
#                                 "likelihood.aic", "likelihood.aicc", "likelihood.bic", "likelihood.bicc",
#                                 "residuals.ser", "residuals.ser-ml", "residuals.mean", "residuals.skewness:3",
#                                 "residuals.kurtosis:3", "residuals.dh", "residuals.lb", "residuals.lb2:3",
#                                 "residuals.seaslb", "residuals.bp", "residuals.bp2", "residuals.seasbp",
#                                 "residuals.nudruns", "residuals.ludruns", "residuals.nruns",
#                                 "residuals.lruns", "arima", "arima.mean", "arima.p", "arima.d",
#                                 "arima.q", "arima.bp", "arima.bd", "arima.bq", "arima.phi(*)",
#                                 "arima.bphi(*)", "arima.th(*)", "arima.bth(*)", "decomposition.seasonality",
#                                 "decomposition.parameters_cutoff", "decomposition.model_changed",
#                                 "decomposition.tvar-estimator", "decomposition.tvar-estimate",
#                                 "decomposition.tvar-pvalue", "decomposition.savar-estimator",
#                                 "decomposition.savar-estimate", "decomposition.savar-pvalue",
#                                 "decomposition.svar-estimator", "decomposition.svar-estimate",
#                                 "decomposition.svar-pvalue", "decomposition.ivar-estimator",
#                                 "decomposition.ivar-estimate", "decomposition.ivar-pvalue", "decomposition.tscorr-estimator",
#                                 "decomposition.tscorr-estimate", "decomposition.tscorr-pvalue",
#                                 "decomposition.ticorr-estimator", "decomposition.ticorr-estimate",
#                                 "decomposition.ticorr-pvalue", "decomposition.sicorr-estimator",
#                                 "decomposition.sicorr-estimate", "decomposition.sicorr-pvalue",
#                                 "decomposition.ar_root(*)", "decomposition.ma_root(*)", "method",
#                                 "variancedecomposition.cycle", "variancedecomposition.seasonality",
#                                 "variancedecomposition.irregular", "variancedecomposition.tdh",
#                                 "variancedecomposition.others", "variancedecomposition.total",
#                                 "diagnostics.logstat", "diagnostics.levelstat", "diagnostics.fcast-insample-mean",
#                                 "diagnostics.fcast-outsample-mean", "diagnostics.fcast-outsample-variance",
#                                 "diagnostics.seas-lin-f", "diagnostics.seas-lin-qs", "diagnostics.seas-lin-kw",
#                                 "diagnostics.seas-lin-friedman", "diagnostics.seas-lin-periodogram",
#                                 "diagnostics.seas-lin-spectralpeaks", "diagnostics.seas-si-combined",
#                                 "diagnostics.seas-si-evolutive", "diagnostics.seas-si-stable",
#                                 "diagnostics.seas-res-f", "diagnostics.seas-res-qs", "diagnostics.seas-res-kw",
#                                 "diagnostics.seas-res-friedman", "diagnostics.seas-res-periodogram",
#                                 "diagnostics.seas-res-spectralpeaks", "diagnostics.seas-res-combined",
#                                 "diagnostics.seas-res-combined3", "diagnostics.seas-res-evolutive",
#                                 "diagnostics.seas-res-stable", "diagnostics.seas-i-f", "diagnostics.seas-i-qs",
#                                 "diagnostics.seas-i-kw", "diagnostics.seas-i-periodogram", "diagnostics.seas-i-spectralpeaks",
#                                 "diagnostics.seas-i-combined", "diagnostics.seas-i-combined3",
#                                 "diagnostics.seas-i-evolutive", "diagnostics.seas-i-stable",
#                                 "diagnostics.seas-sa-f", "diagnostics.seas-sa-qs", "diagnostics.seas-sa-kw",
#                                 "diagnostics.seas-sa-friedman", "diagnostics.seas-sa-periodogram",
#                                 "diagnostics.seas-sa-spectralpeaks", "diagnostics.seas-sa-combined",
#                                 "diagnostics.seas-sa-combined3", "diagnostics.seas-sa-evolutive",
#                                 "diagnostics.seas-sa-stable", "diagnostics.seas-sa-ac1", "diagnostics.td-sa-all",
#                                 "diagnostics.td-sa-last", "diagnostics.td-i-all", "diagnostics.td-i-last",
#                                 "diagnostics.td-res-all", "diagnostics.td-res-last", "diagnostics.ic-ratio-henderson",
#                                 "diagnostics.ic-ratio", "diagnostics.msr-global", "diagnostics.msr(*)",
#                                 "decomposition.trendfilter", "decomposition.seasfilter", "m-statistics.m1",
#                                 "m-statistics.m2", "m-statistics.m3", "m-statistics.m4", "m-statistics.m5",
#                                 "m-statistics.m6", "m-statistics.m7", "m-statistics.m8", "m-statistics.m9",
#                                 "m-statistics.m10", "m-statistics.m11", "m-statistics.q", "m-statistics.q-m2",
#                                 "diagnostics.basic checks.definition:2", "diagnostics.basic checks.annual totals:2",
#                                 "diagnostics.visual spectral analysis.spectral seas peaks", "diagnostics.visual spectral analysis.spectral td peaks",
#                                 "diagnostics.regarima residuals.normality:2", "diagnostics.regarima residuals.independence:2",
#                                 "diagnostics.regarima residuals.spectral td peaks:2", "diagnostics.regarima residuals.spectral seas peaks:2",
#                                 "diagnostics.outliers.number of outliers:2", "diagnostics.out-of-sample.mean:2",
#                                 "diagnostics.out-of-sample.mse:2", "diagnostics.m-statistics.q:2",
#                                 "diagnostics.m-statistics.q-m2:2", "diagnostics.seats.seas variance:2",
#                                 "diagnostics.seats.irregular variance:2", "diagnostics.seats.seas/irr cross-correlation:2",
#                                 "diagnostics.residual seasonality tests.qs test on sa:2", "diagnostics.residual seasonality tests.qs test on i:2",
#                                 "diagnostics.residual seasonality tests.f-test on sa (seasonal dummies):2",
#                                 "diagnostics.residual seasonality tests.f-test on i (seasonal dummies):2",
#                                 "diagnostics.combined seasonality test.combined seasonality test on sa:2",
#                                 "diagnostics.combined seasonality test.combined seasonality test on sa (last 3 years):2",
#                                 "diagnostics.combined seasonality test.combined seasonality test on irregular:2",
#                                 "diagnostics.residual trading days tests.f-test on sa (td):2",
#                                 "diagnostics.residual trading days tests.f-test on i (td):2",
#                                 "diagnostics.quality"
# ))


# Lecture et traitement des données --------------------------------------------

## Pondérations ----------------------------------------------------------------

POND_NAF4 <- read.csv2("./data/ponderations_2020.csv", sep = ";", dec = ".")
str(POND_NAF4)

colnames(POND_NAF4) <- c("series", "pond")
head(POND_NAF4)

# Tri des series avec le plus grand poids 
POND_NAF4 <- POND_NAF4[order(POND_NAF4$pond, decreasing = TRUE), ]



# Utilisation du cruncher ------------------------------------------------------

JDCruncheR::cruncher_and_param(workspace = path_xml,
                   rename_multi_documents = FALSE, 
                   delete_existing_file = TRUE, 
                   policy = "complete",
                   csv_layout = "vtable", 
                   log_file = "log.txt")
# rjwsacruncher::cruncher_and_param()


# Bilan qualité ----------------------------------------------------------------

## Création du premier Bilan qualité -------------------------------------------

# workspace auto 
# extract_QR : lecture fichier csv = matrice 
BQ_auto_base <- extract_QR(matrix_output_file = path_matrix, 
                           sep = ";", dec = ",")

# description du bilan qualité
str(BQ_auto_base)
head(BQ_auto_base[[1]])


## Calcul des scores -----------------------------------------------------------

# à ce stade pas de score, ni de formule du score
# compute_score : calcul des scores
?compute_score

# Explication des variables :
#   - n_contrib_score doit être spécifiée pour préciser le nombre de variables 
# à créer
#   - conditional_indicator permet de réduire le poids à 1
BQ_auto_score <- compute_score(
    BQ_auto_base, n_contrib_score = 5,
    conditional_indicator = list(list(
        indicator = "oos_mse",
        conditions = c("residuals_independency",
                       "residuals_homoskedasticity",
                       "residuals_normality"),
        conditions_modalities = c("Bad","Severe"))),
    na.rm = TRUE)
# str(BQ_auto_score)
waldo::compare(BQ_auto_base, BQ_auto_score)

score <- extract_score(BQ_auto_score)
head(score)


## Ajouter pondérations --------------------------------------------------------

# add_indicator : fonction native du cruncher
BQ_auto_indicator <- add_indicator(BQ_auto_score, POND_NAF4)
# str(BQ_auto_indicator)
waldo::compare(BQ_auto_score, BQ_auto_indicator)


## Score pondéré ---------------------------------------------------------------

# weighted score : fonction native du cruncher
# Voir params : ajoute pond dans le DF values
?weighted_score
BQ_auto_weighted <- weighted_score(BQ_auto_indicator, "pond")
# str(BQ_auto_weighted)
waldo::compare(BQ_auto_indicator, BQ_auto_weighted)

JDCruncheR::export_xlsx(x = BQ_auto_weighted, 
                        file_name = "./output/BQ_weighted.xlsx", 
                        layout = "all")
