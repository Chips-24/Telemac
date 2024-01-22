#/usr/bin/env python
# -*- coding: latin-1 -*-
TelemacdicoEn = {
'MATRIX_STORAGE' : {
    1:"Classical EBE",
    2:"Assembled EBE",
    3:"Edge-based storage",
  },
'PRECONDITIONING' : {
    0:"no preconditioning",
    2:"diagonal preconditioning",
    3:"block-diagonal preconditioning",
    5:"absolute value diagonal preconditioning",
    7:"Crout preconditioning",
  },
'SOLVER' : {
    1:"conjugate gradient",
    2:"conjugate residual",
    3:"conjugate gradient on a normal equation",
    4:"minimum error",
    5:"squared conjugate gradient",
    6:"CGSTAB",
    7:"GMRES",
    8:"direct",
    9:"parallel direct (MUMPS)",
  },
'VARIABLES_FOR_GRAPHIC_PRINTOUTS' : {
    'HS':"wave height",
    'PHAS':"wave phase",
    'U0':"velocity u (free surface)(t=0)",
    'V0':"velocity v (free surface)(t=0)",
    'ZS':"free surface elevation (t=0)",
    'ZF':"bottom elevation",
    'HW':"still water height",
    'C':"phase velocity",
    'CG':"group velocity",
    'K':"wave number",
    'PHIR':"real potential",
    'PHII':"imaginal potential",
    'D':"prive(1,1)",
    'E':"prive(1,2)",
    'F':"prive(1,3)",
    'G':"prive(1,4)",
    'T01':"first mean spectral period",
    'T02':"second mean spectral period",
    'TM':"third mean spectral period",
    'FX':"force along X",
    'FY':"force along Y",
    'INC':"wave incidence radian",
    'QB':"breaking rate",
    'SXX':"SXX stress",
    'SXY':"SXY stress",
    'SYY':"SYY stress",
  },
'VARIABLES_TO_BE_PRINTED' : {
    'HS':"wave height",
    'PHAS':"wave phase",
    'U0':"velocity u (free surface)(t=0)",
    'V0':"velocity v (free surface)(t=0)",
    'ZS':"free surface elevation (t=0)",
    'ZF':"bottom elevation",
    'HW':"still water height",
    'C':"phase velocity",
    'CG':"group velocity",
    'K':"wave number",
    'PHIR':"real potential",
    'PHII':"imaginal potential",
    'D':"prive(1,1)",
    'E':"prive(1,2)",
    'F':"prive(1,3)",
    'G':"prive(1,4)",
    'T01':"first mean spectral period",
    'T02':"second mean spectral period",
    'TM':"third mean spectral period",
    'FX':"force along X",
    'FY':"force along Y",
    'INC':"wave incidence radian",
    'QB':"breaking rate",
    'SXX':"SXX stress",
    'SXY':"SXY stress",
    'SYY':"SYY stress",
  },
'BREAKING_LAW' : {
    1:"BATTJES \& JANSSEN",
    2:"DALLY",
  },
'HYDRAULIC_REGIME_TYPE' : {
    1:"laminar regime",
    2:"smooth-turbulent regime",
    3:"rough-turbulent regime",
    4:"transient regime",
  },
'BOTTOM_FRICTION_LAW' : {
    1:"Kostense formulation integrating Ue calculation (1986)",
    2:"Putnam \& Johnson formulation (1949)",
  },
'RAPIDLY_VARYING_TOPOGRAPHY' : {
    0:"mild-slope equation",
    1:"gradient second order term",
    2:"curvature second order term",
    3:"gradient + curvature second order terms",
  },
'NESTING_WITHIN_TOMAWAC_OUTER_MODEL' : {
    0:"No nesting",
    1:"Uses a TOMAWAC spectrum (1 point) as input to ARTEMIS",
    2:"Uses several TOMAWAC spectra located along ARTEMIS boundary",
  },
}
TelemacdicoFr = {
'MATRIX_STORAGE' : {
    1:"EBE classique",
    2:"EBE assemble",
    3:"Stockage par segments",
  },
'PRECONDITIONING' : {
    0:"pas de preconditionnement",
    2:"preconditionnement diagonal",
    3:"preconditionnement bloc-diagonal",
    5:"preconditionnement diagonal en valeur absolue",
    7:"preconditionnement de Crout par element",
  },
'SOLVER' : {
    1:"gradient conjugue",
    2:"residu conjugue",
    3:"gradient conjugue sur equation normale",
    4:"erreur minimale",
    5:"gradient conjugue carre (non programme)",
    6:"CGSTAB",
    7:"GMRES",
    8:"direct",
    9:"direct parallele (MUMPS)",
  },
'VARIABLES_FOR_GRAPHIC_PRINTOUTS' : {
    'HS':"hauteur de la houle",
    'PHAS':"phase de la houle",
    'U0':"vitesse u en surface a t=0",
    'V0':"vitesse v en surface a t=0",
    'ZS':"cote de la surface libre",
    'ZF':"fond",
    'HW':"hauteur d eau au repos",
    'C':"vitesse de phase",
    'CG':"vitesse de groupe",
    'K':"nombre d onde",
    'PHIR':"potentiel reel",
    'PHII':"potentiel imaginaire",
    'D':"prive(1,1)",
    'E':"prive(1,2)",
    'F':"prive(1,3)",
    'G':"prive(1,4)",
    'T01':"premiere periode moyenne spectrale",
    'T02':"deuxieme periode moyenne spectrale",
    'TM':"troisieme periode moyenne spectrale",
    'FX':"force en X",
    'FY':"force en Y",
    'INC':"incidence de la houle",
    'QB':"taux de deferlement",
    'SXX':"contrainte SXX",
    'SXY':"contrainte SXY",
    'SYY':"contrainte SYY",
  },
'VARIABLES_TO_BE_PRINTED' : {
    'HS':"hauteur de la houle",
    'PHAS':"phase de la houle",
    'U0':"vitesse u en surface a t=0",
    'V0':"vitesse v en surface a t=0",
    'ZS':"cote de la surface libre",
    'ZF':"fond",
    'HW':"hauteur d eau au repos",
    'C':"vitesse de phase",
    'CG':"vitesse de groupe",
    'K':"nombre d onde",
    'PHIR':"potentiel reel",
    'PHII':"potentiel imaginaire",
    'D':"prive(1,1)",
    'E':"prive(1,2)",
    'F':"prive(1,3)",
    'G':"prive(1,4)",
    'T01':"premiere periode moyenne spectrale",
    'T02':"deuxieme periode moyenne spectrale",
    'TM':"troisieme periode moyenne spectrale",
    'FX':"force en X",
    'FY':"force en Y",
    'INC':"incidence de la houle",
    'QB':"taux de deferlement",
    'SXX':"contrainte SXX",
    'SXY':"contrainte SXY",
    'SYY':"contrainte SYY",
  },
'BREAKING_LAW' : {
    1:"BATTJES \& JANSSEN",
    2:"DALLY",
  },
'HYDRAULIC_REGIME_TYPE' : {
    1:"regime laminaire",
    2:"regime turbulent lisse",
    3:"regime turbulent rugueux",
    4:"regime transitoire",
  },
'BOTTOM_FRICTION_LAW' : {
    1:"Formulation de Kostense integrant le calcul de Ue (1986)",
    2:"Formulation de Putnam \& Johnson (1949)",
  },
'RAPIDLY_VARYING_TOPOGRAPHY' : {
    0:"BERKHOFF SIMPLE",
    1:"PRISE EN COMPTE TERME DE PENTE",
    2:"PRISE EN COMPTE TERME DE COURBURE",
    3:"PRISE EN COMPTE DES TERMES DE PENTE ET COURBURE",
  },
'NESTING_WITHIN_TOMAWAC_OUTER_MODEL' : {
    0:"Pas de chainage",
    1:"Utilise un spectre TOMAWAC (1 point) en entree du calcul artemis",
    2:"Utilise plusieurs spectres TOMAWAC le long de la frontiere",
  },
}

DicoCasFrToCata = {
  "FICHIER DE GEOMETRIE":"GEOMETRY_FILE",
  "TITRE":"TITLE",
  "DEBUGGER":"DEBUGGER",
  "LONGUEUR DU VECTEUR":"VECTOR_LENGTH",
  "STOCKAGE DES MATRICES":"MATRIX_STORAGE",
  "PRODUIT MATRICE-VECTEUR":"MATRIX_VECTOR_PRODUCT",
  "PERIODE DE SORTIE GRAPHIQUE":"GRAPHIC_PRINTOUT_PERIOD",
  "PERIODE DE SORTIE LISTING":"LISTING_PRINTOUT_PERIOD",
  "MAXIMUM D'ITERATIONS POUR LE SOLVEUR":"MAXIMUM_NUMBER_OF_ITERATIONS_FOR_SOLVER",
  "NOMBRE DE PERIODES DE DISCRETISATION":"NUMBER_OF_PERIODS",
  "LISSAGES DU FOND":"BOTTOM_TOPOGRAPHY_SMOOTHING",
  "COTE INITIALE":"INITIAL_WATER_LEVEL",
  "PRECONDITIONNEMENT":"PRECONDITIONING",
  "SOLVEUR":"SOLVER",
  "OPTION DU SOLVEUR":"SOLVER_OPTION",
  "PERIODE DE PIC":"PEAK_PERIOD",
  "GAMMA":"GAMMA",
  "HOULE ALEATOIRE MONODIRECTIONNELLE":"MONODIRECTIONAL_RANDOM_WAVE",
  "HOULE ALEATOIRE MULTIDIRECTIONNELLE":"MULTIDIRECTIONAL_RANDOM_WAVE",
  "BALAYAGE EN PERIODE":"PERIOD_SCANNING",
  "PRECISION DU SOLVEUR":"SOLVER_ACCURACY",
  "HAUTEUR INITIALE":"INITIAL_DEPTH",
  "PERIODE DE LA HOULE":"WAVE_PERIOD",
  "ACCELERATION DE LA PESANTEUR":"GRAVITY_ACCELERATION",
  "CONDITIONS INITIALES":"INITIAL_CONDITIONS",
  "NOMBRE DE DIRECTIONS DE DISCRETISATION":"NUMBER_OF_DIRECTIONS",
  "DIRECTION DE PROPAGATION DE LA HOULE":"DIRECTION_OF_WAVE_PROPAGATION",
  "ZERO":"ZERO",
  "PERIODE DE DEBUT POUR LE BALAYAGE EN PERIODE":"BEGINNING_PERIOD_FOR_PERIOD_SCANNING",
  "PERIODE DE FIN POUR LE BALAYAGE EN PERIODE":"ENDING_PERIOD_FOR_PERIOD_SCANNING",
  "PAS POUR LE BALAYAGE EN PERIODE":"STEP_FOR_PERIOD_SCANNING",
  "ANGLE MINIMUM DE PROPAGATION":"MINIMUM_ANGLE_OF_PROPAGATION",
  "ANGLE MAXIMUM DE PROPAGATION":"MAXIMUM_ANGLE_OF_PROPAGATION",
  "EXPOSANT S":"S_EXPONENT",
  "SORTIE LISTING":"LISTING_PRINTOUT",
  "INFORMATIONS SUR LE SOLVEUR":"INFORMATIONS_ABOUT_SOLVER",
  "VARIABLES POUR LES SORTIES GRAPHIQUES":"VARIABLES_FOR_GRAPHIC_PRINTOUTS",
  "VARIABLES A IMPRIMER":"VARIABLES_TO_BE_PRINTED",
  "FICHIER FORTRAN":"FORTRAN_FILE",
  "FICHIER DES PARAMETRES":"STEERING_FILE",
  "FICHIER DES CONDITIONS AUX LIMITES":"BOUNDARY_CONDITIONS_FILE",
  "FICHIER DES RESULTATS":"RESULTS_FILE",
  "FICHIER DES FONDS":"BOTTOM_TOPOGRAPHY_FILE",
  "FICHIER DE DONNEES BINAIRE 1":"BINARY_DATA_FILE_1",
  "FICHIER DE DONNEES BINAIRE 2":"BINARY_DATA_FILE_2",
  "FICHIER DE DONNEES FORMATE 1":"FORMATTED_DATA_FILE_1",
  "FICHIER DE DONNEES FORMATE 2":"FORMATTED_DATA_FILE_2",
  "FICHIER DES RESULTATS BINAIRE":"BINARY_RESULTS_FILE",
  "FICHIER DES RESULTATS FORMATE":"FORMATTED_RESULTS_FILE",
  "PRECISION SUR LES SOUS-ITERATIONS POUR LA DISSIPATION":"SUB_ITERATIONS_ACCURACY_FOR_DISSIPATION",
  "PRECISION SUR LES SOUS-ITERATIONS POUR COURANT":"SUB_ITERATIONS_ACCURACY_FOR_CURRENT",
  "PRECISION SUR LES SOUS-ITERATIONS POUR TETAP":"SUB_ITERATIONS_ACCURACY_FOR_TETAP",
  "DEFERLEMENT":"BREAKING",
  "COURANT":"CURRENT",
  "CALCUL AUTOMATIQUE DE TETAP":"AUTOMATIC_TETAP_CALCULATION",
  "CALCUL AUTOMATIQUE DE LA PHASE":"AUTOMATIC_CALCULATION_OF_PHASE",
  "PROFONDEUR DE REFERENCE POUR LA PHASE AUTOMATIQUE":"REFERENCE_WATER_DEPTH_FOR_AUTOMATIC_PHASE",
  "COORDONNEES DE REFERENCE POUR LA PHASE":"PHASE_REFERENCE_COORDINATES",
  "KDALLY":"KDALLY",
  "FORMULATION DU DEFERLEMENT":"BREAKING_LAW",
  "MAXIMUM DE SOUS-ITERATIONS":"MAXIMUM_OF_SUB_ITERATIONS",
  "RELAXATION SUR LA DISSIPATION":"DISSIPATION_RELAXATION",
  "MAXIMUM DE SOUS-ITERATIONS POUR TETAP":"MAXIMUM_OF_SUB_ITERATIONS_FOR_TETAP",
  "RELAXATION SUR TETAP":"RELAXATION_ON_TETAP",
  "ALPHA":"ALPHA",
  "GAMMAS":"GAMMAS",
  "GDALLY":"GDALLY",
  "FROTTEMENT":"FRICTION",
  "VISCOSITE CINEMATIQUE DU FLUIDE":"FLUID_KINEMATIC_VISCOSITY",
  "DIAMETRE90":"DIAMETER90",
  "DIAMETRE50":"DIAMETER50",
  "MASSE VOLUMIQUE DU SEDIMENT":"SEDIMENT_SPECIFIC_WEIGHT",
  "MASSE VOLUMIQUE DU FLUIDE":"FLUID_SPECIFIC_MASS",
  "REGIME HYDRAULIQUE IMPOSE":"HYDRAULIC_REGIME_IMPOSED",
  "RUGOSITE DE PEAU SEULE":"SKIN_ROUGHNESS_ONLY",
  "LISSAGE DES HAUTEURS DE HOULE":"WAVE_HEIGHTS_SMOOTHING",
  "VALIDATION":"VALIDATION",
  "TYPE DU REGIME HYDRAULIQUE":"HYDRAULIC_REGIME_TYPE",
  "FORMULATION DU FROTTEMENT DE FOND":"BOTTOM_FRICTION_LAW",
  "FACTEUR DE FROTTEMENT IMPOSE":"FRICTION_FACTOR_IMPOSED",
  "FACTEUR DE FROTTEMENT":"FRICTION_FACTOR",
  "COEFFICIENT DE FROTTEMENT":"FRICTION_COEFFICIENT",
  "COEFFICIENT DE RIDES":"RIPPLES_COEFFICIENT",
  "PERIODE MINIMUM DU SPECTRE":"MINIMUM_SPECTRAL_PERIOD",
  "PERIODE MAXIMUM DU SPECTRE":"MAXIMUM_SPECTRAL_PERIOD",
  "DATE DE L'ORIGINE DES TEMPS":"ORIGINAL_DATE_OF_TIME",
  "HEURE DE L'ORIGINE DES TEMPS":"ORIGINAL_HOUR_OF_TIME",
  "NOMBRE DE VARIABLES PRIVEES":"NUMBER_OF_PRIVATE_VARIABLES",
  "PROCESSEURS PARALLELES":"PARALLEL_PROCESSORS",
  "PARTITIONNEUR":"PARTITIONING_TOOL",
  "COORDONNEES DE L'ORIGINE":"ORIGIN_COORDINATES",
  "FICHIER DE REFERENCE":"REFERENCE_FILE",
  "FORMAT DU FICHIER DE GEOMETRIE":"GEOMETRY_FILE_FORMAT",
  "FORMAT DU FICHIER DE RESULTATS":"RESULTS_FILE_FORMAT",
  "FORMAT DU FICHIER DE REFERENCE":"REFERENCE_FILE_FORMAT",
  "FORMAT DU FICHIER DE DONNEES BINAIRE 1":"BINARY_DATA_FILE_1_FORMAT",
  "FORMAT DU FICHIER DE DONNEES BINAIRE 2":"BINARY_DATA_FILE_2_FORMAT",
  "VARIATION RAPIDE DE LA BATHYMETRIE":"RAPIDLY_VARYING_TOPOGRAPHY",
  "VERIFICATION DU MAILLAGE":"CHECKING_THE_MESH",
  "ANIMATION DE LA SURFACE LIBRE":"FREE_SURFACE_ANIMATION",
  "FICHIER DES PHASES ET AMPLITUDES":"AMPLITUDE_AND_PHASE_FILE",
  "FORMAT DU FICHIER DES PHASES ET AMPLITUDES":"AMPLITUDE_AND_PHASE_FILE_FORMAT",
  "FICHIER DE SURFACE LIBRE":"FREE_SURFACE_FILE",
  "FORMAT DU FICHIER DE SURFACE LIBRE":"FREE_SURFACE_FILE_FORMAT",
  "PREMIER TEMPS DANS LE FICHIER DE SURFACE LIBRE":"FIRST_TIME_IN_THE_FREE_SURFACE_FILE",
  "PAS DE TEMPS":"TIME_STEP",
  "NOMBRE DE PAS DE TEMPS":"NUMBER_OF_TIME_STEPS",
  "CHAINAGE AVEC MODELE GLOBAL TOMAWAC":"NESTING_WITHIN_TOMAWAC_OUTER_MODEL",
  "INSTANT DE LECTURE DU SPECTRE TOMAWAC":"INSTANT_FOR_READING_TOMAWAC_SPECTRUM",
  "FICHIER DE SPECTRE GLOBAL TOMAWAC":"TOMAWAC_OUTER_SPECTRAL_FILE",
  "FORMAT DU FICHIER DE SPECTRE GLOBAL TOMAWAC":"TOMAWAC_OUTER_SPECTRAL_FILE_FORMAT",
  "FICHIER DE RESULTATS GLOBAL TOMAWAC":"TOMAWAC_OUTER_RESULT_FILE",
  "FORMAT DU FICHIER DE RESULTATS GLOBAL TOMAWAC":"TOMAWAC_OUTER_RESULT_FILE_FORMAT",
  "FICHIER DE FRONTIERES LIQUIDES TOMAWAC":"TOMAWAC_LIQUID_BOUNDARY_FILE",
  "FORMAT DU FICHIER DE FRONTIERES LIQUIDES TOMAWAC":"TOMAWAC_LIQUID_BOUNDARY_FILE_FORMAT",
  "COORDONNEES POUR LE SPECTRE F DE REFERENCE":"COORDINATES_OF_THE_REFERENCE_F_SPECTRUM",
  "DICTIONNAIRE":"DICTIONARY",
  "CONCATENATION SORTIE PARTEL":"CONCATENATE_PARTEL_OUTPUT",
}

DicoCasEnToCata = {
  'GEOMETRY FILE':'GEOMETRY_FILE',
  'TITLE':'TITLE',
  'DEBUGGER':'DEBUGGER',
  'VECTOR LENGTH':'VECTOR_LENGTH',
  'MATRIX STORAGE':'MATRIX_STORAGE',
  'MATRIX-VECTOR PRODUCT':'MATRIX_VECTOR_PRODUCT',
  'GRAPHIC PRINTOUT PERIOD':'GRAPHIC_PRINTOUT_PERIOD',
  'LISTING PRINTOUT PERIOD':'LISTING_PRINTOUT_PERIOD',
  'MAXIMUM NUMBER OF ITERATIONS FOR SOLVER':'MAXIMUM_NUMBER_OF_ITERATIONS_FOR_SOLVER',
  'NUMBER OF PERIODS':'NUMBER_OF_PERIODS',
  'BOTTOM TOPOGRAPHY SMOOTHING':'BOTTOM_TOPOGRAPHY_SMOOTHING',
  'INITIAL WATER LEVEL':'INITIAL_WATER_LEVEL',
  'PRECONDITIONING':'PRECONDITIONING',
  'SOLVER':'SOLVER',
  'SOLVER OPTION':'SOLVER_OPTION',
  'PEAK PERIOD':'PEAK_PERIOD',
  'GAMMA':'GAMMA',
  'MONODIRECTIONAL RANDOM WAVE':'MONODIRECTIONAL_RANDOM_WAVE',
  'MULTIDIRECTIONAL RANDOM WAVE':'MULTIDIRECTIONAL_RANDOM_WAVE',
  'PERIOD SCANNING':'PERIOD_SCANNING',
  'SOLVER ACCURACY':'SOLVER_ACCURACY',
  'INITIAL DEPTH':'INITIAL_DEPTH',
  'WAVE PERIOD':'WAVE_PERIOD',
  'GRAVITY ACCELERATION':'GRAVITY_ACCELERATION',
  'INITIAL CONDITIONS':'INITIAL_CONDITIONS',
  'NUMBER OF DIRECTIONS':'NUMBER_OF_DIRECTIONS',
  'DIRECTION OF WAVE PROPAGATION':'DIRECTION_OF_WAVE_PROPAGATION',
  'ZERO':'ZERO',
  'BEGINNING PERIOD FOR PERIOD SCANNING':'BEGINNING_PERIOD_FOR_PERIOD_SCANNING',
  'ENDING PERIOD FOR PERIOD SCANNING':'ENDING_PERIOD_FOR_PERIOD_SCANNING',
  'STEP FOR PERIOD SCANNING':'STEP_FOR_PERIOD_SCANNING',
  'MINIMUM ANGLE OF PROPAGATION':'MINIMUM_ANGLE_OF_PROPAGATION',
  'MAXIMUM ANGLE OF PROPAGATION':'MAXIMUM_ANGLE_OF_PROPAGATION',
  'S EXPONENT':'S_EXPONENT',
  'LISTING PRINTOUT':'LISTING_PRINTOUT',
  'INFORMATIONS ABOUT SOLVER':'INFORMATIONS_ABOUT_SOLVER',
  'VARIABLES FOR GRAPHIC PRINTOUTS':'VARIABLES_FOR_GRAPHIC_PRINTOUTS',
  'VARIABLES TO BE PRINTED':'VARIABLES_TO_BE_PRINTED',
  'FORTRAN FILE':'FORTRAN_FILE',
  'STEERING FILE':'STEERING_FILE',
  'BOUNDARY CONDITIONS FILE':'BOUNDARY_CONDITIONS_FILE',
  'RESULTS FILE':'RESULTS_FILE',
  'BOTTOM TOPOGRAPHY FILE':'BOTTOM_TOPOGRAPHY_FILE',
  'BINARY DATA FILE 1':'BINARY_DATA_FILE_1',
  'BINARY DATA FILE 2':'BINARY_DATA_FILE_2',
  'FORMATTED DATA FILE 1':'FORMATTED_DATA_FILE_1',
  'FORMATTED DATA FILE 2':'FORMATTED_DATA_FILE_2',
  'BINARY RESULTS FILE':'BINARY_RESULTS_FILE',
  'FORMATTED RESULTS FILE':'FORMATTED_RESULTS_FILE',
  'SUB-ITERATIONS ACCURACY FOR DISSIPATION':'SUB_ITERATIONS_ACCURACY_FOR_DISSIPATION',
  'SUB-ITERATIONS ACCURACY FOR CURRENT':'SUB_ITERATIONS_ACCURACY_FOR_CURRENT',
  'SUB-ITERATIONS ACCURACY FOR TETAP':'SUB_ITERATIONS_ACCURACY_FOR_TETAP',
  'BREAKING':'BREAKING',
  'CURRENT':'CURRENT',
  'AUTOMATIC TETAP CALCULATION':'AUTOMATIC_TETAP_CALCULATION',
  'AUTOMATIC CALCULATION OF PHASE':'AUTOMATIC_CALCULATION_OF_PHASE',
  'REFERENCE WATER DEPTH FOR AUTOMATIC PHASE':'REFERENCE_WATER_DEPTH_FOR_AUTOMATIC_PHASE',
  'PHASE REFERENCE COORDINATES':'PHASE_REFERENCE_COORDINATES',
  'KDALLY':'KDALLY',
  'BREAKING LAW':'BREAKING_LAW',
  'MAXIMUM OF SUB-ITERATIONS':'MAXIMUM_OF_SUB_ITERATIONS',
  'DISSIPATION RELAXATION':'DISSIPATION_RELAXATION',
  'MAXIMUM OF SUB-ITERATIONS FOR TETAP':'MAXIMUM_OF_SUB_ITERATIONS_FOR_TETAP',
  'RELAXATION ON TETAP':'RELAXATION_ON_TETAP',
  'ALPHA':'ALPHA',
  'GAMMAS':'GAMMAS',
  'GDALLY':'GDALLY',
  'FRICTION':'FRICTION',
  'FLUID KINEMATIC VISCOSITY':'FLUID_KINEMATIC_VISCOSITY',
  'DIAMETER90':'DIAMETER90',
  'DIAMETER50':'DIAMETER50',
  'SEDIMENT SPECIFIC WEIGHT':'SEDIMENT_SPECIFIC_WEIGHT',
  'FLUID SPECIFIC MASS':'FLUID_SPECIFIC_MASS',
  'HYDRAULIC REGIME IMPOSED':'HYDRAULIC_REGIME_IMPOSED',
  'SKIN ROUGHNESS ONLY':'SKIN_ROUGHNESS_ONLY',
  'WAVE HEIGHTS SMOOTHING':'WAVE_HEIGHTS_SMOOTHING',
  'VALIDATION':'VALIDATION',
  'HYDRAULIC REGIME TYPE':'HYDRAULIC_REGIME_TYPE',
  'BOTTOM FRICTION LAW':'BOTTOM_FRICTION_LAW',
  'FRICTION FACTOR IMPOSED':'FRICTION_FACTOR_IMPOSED',
  'FRICTION FACTOR':'FRICTION_FACTOR',
  'FRICTION COEFFICIENT':'FRICTION_COEFFICIENT',
  'RIPPLES COEFFICIENT':'RIPPLES_COEFFICIENT',
  'MINIMUM SPECTRAL PERIOD':'MINIMUM_SPECTRAL_PERIOD',
  'MAXIMUM SPECTRAL PERIOD':'MAXIMUM_SPECTRAL_PERIOD',
  'ORIGINAL DATE OF TIME':'ORIGINAL_DATE_OF_TIME',
  'ORIGINAL HOUR OF TIME':'ORIGINAL_HOUR_OF_TIME',
  'NUMBER OF PRIVATE VARIABLES':'NUMBER_OF_PRIVATE_VARIABLES',
  'PARALLEL PROCESSORS':'PARALLEL_PROCESSORS',
  'PARTITIONING TOOL':'PARTITIONING_TOOL',
  'ORIGIN COORDINATES':'ORIGIN_COORDINATES',
  'REFERENCE FILE':'REFERENCE_FILE',
  'GEOMETRY FILE FORMAT':'GEOMETRY_FILE_FORMAT',
  'RESULTS FILE FORMAT':'RESULTS_FILE_FORMAT',
  'REFERENCE FILE FORMAT':'REFERENCE_FILE_FORMAT',
  'BINARY DATA FILE 1 FORMAT':'BINARY_DATA_FILE_1_FORMAT',
  'BINARY DATA FILE 2 FORMAT':'BINARY_DATA_FILE_2_FORMAT',
  'RAPIDLY VARYING TOPOGRAPHY':'RAPIDLY_VARYING_TOPOGRAPHY',
  'CHECKING THE MESH':'CHECKING_THE_MESH',
  'FREE SURFACE ANIMATION':'FREE_SURFACE_ANIMATION',
  'AMPLITUDE AND PHASE FILE':'AMPLITUDE_AND_PHASE_FILE',
  'AMPLITUDE AND PHASE FILE FORMAT':'AMPLITUDE_AND_PHASE_FILE_FORMAT',
  'FREE SURFACE FILE':'FREE_SURFACE_FILE',
  'FREE SURFACE FILE FORMAT':'FREE_SURFACE_FILE_FORMAT',
  'FIRST TIME IN THE FREE SURFACE FILE':'FIRST_TIME_IN_THE_FREE_SURFACE_FILE',
  'TIME STEP':'TIME_STEP',
  'NUMBER OF TIME STEPS':'NUMBER_OF_TIME_STEPS',
  'NESTING WITHIN TOMAWAC OUTER MODEL':'NESTING_WITHIN_TOMAWAC_OUTER_MODEL',
  'INSTANT FOR READING TOMAWAC SPECTRUM':'INSTANT_FOR_READING_TOMAWAC_SPECTRUM',
  'TOMAWAC OUTER SPECTRAL FILE':'TOMAWAC_OUTER_SPECTRAL_FILE',
  'TOMAWAC OUTER SPECTRAL FILE FORMAT':'TOMAWAC_OUTER_SPECTRAL_FILE_FORMAT',
  'TOMAWAC OUTER RESULT FILE':'TOMAWAC_OUTER_RESULT_FILE',
  'TOMAWAC OUTER RESULT FILE FORMAT':'TOMAWAC_OUTER_RESULT_FILE_FORMAT',
  'TOMAWAC LIQUID BOUNDARY FILE':'TOMAWAC_LIQUID_BOUNDARY_FILE',
  'TOMAWAC LIQUID BOUNDARY FILE FORMAT':'TOMAWAC_LIQUID_BOUNDARY_FILE_FORMAT',
  'COORDINATES OF THE REFERENCE F SPECTRUM':'COORDINATES_OF_THE_REFERENCE_F_SPECTRUM',
  'DICTIONARY':'DICTIONARY',
  'CONCATENATE PARTEL OUTPUT':'CONCATENATE_PARTEL_OUTPUT',
}
DicoEnumCasFrToEnumCasEn = {
'INITIAL_CONDITIONS':{
  "COTE NULLE":"ZERO ELEVATION",
  "COTE CONSTANTE":"CONSTANT ELEVATION",
  "HAUTEUR NULLE":"ZERO DEPTH",
  "HAUTEUR CONSTANTE":"CONSTANT DEPTH",
  "PARTICULIERES":"SPECIAL",
},

'PARTITIONING_TOOL':{
  "METIS":"METIS",
  "SCOTCH":"SCOTCH",
  "PARMETIS":"PARMETIS",
  "PTSCOTCH":"PTSCOTCH",
},

'GEOMETRY_FILE_FORMAT':{
  "SERAFIN":"SERAFIN",
  "SERAFIND":"SERAFIND",
  "MED":"MED",
},

'RESULTS_FILE_FORMAT':{
  "SERAFIN":"SERAFIN",
  "SERAFIND":"SERAFIND",
  "MED":"MED",
},

'REFERENCE_FILE_FORMAT':{
  "SERAFIN":"SERAFIN",
  "SERAFIND":"SERAFIND",
  "MED":"MED",
},

'BINARY_DATA_FILE_1_FORMAT':{
  "SERAFIN":"SERAFIN",
  "SERAFIND":"SERAFIND",
  "MED":"MED",
},

'BINARY_DATA_FILE_2_FORMAT':{
  "SERAFIN":"SERAFIN",
  "SERAFIND":"SERAFIND",
  "MED":"MED",
},

}