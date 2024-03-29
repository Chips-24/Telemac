!                   ***************************
                    MODULE DECLARATIONS_TOMAWAC
!                   ***************************
!
!***********************************************************************
! TOMAWAC   V7P0                                  25/06/2012
!***********************************************************************
!
!brief    DECLARES BIEF STRUCTURES IN TOMAWAC.
!
!history  OPTIMER
!+        14/06/00
!+        V5P2
!+   M. BENOIT / J.M HERVOUET, LEADS FOR EDF
!
!history  OPTIMER
!+        25/08/00
!+        V6P0
!+   D. VIOLEAU, LEAD FOR EDF
!
!history  N.DURAND (HRW), S.E.BOURBAN (HRW)
!+        13/07/2010
!+        V6P0
!+   Translation of French comments within the FORTRAN sources into
!+   English comments
!
!history  N.DURAND (HRW), S.E.BOURBAN (HRW)
!+        21/08/2010
!+        V6P0
!+   Creation of DOXYGEN tags for automated documentation and
!+   cross-referencing of the FORTRAN sources
!
!history  G.MATTAROLO (EDF)
!+        16/05/2011
!+        V6P1
!+   Declaration of new variables defined by
!+       E. GAGNAIRE-RENOU for solving new source terms models.
!
!history  G.MATTAROLO (EDF)
!+        25/06/2012
!+        V6P2
!+   Declaration of new variables for representing diffraction
!
!history  J-M HERVOUET (EDF R&D, LNHE)
!+        24/12/2013
!+        V7P0
!+   Logical variable RAZTIM added (initial time set to zero).
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
      USE BIEF_DEF
!
!+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
!
!     DECLARES BIEF STRUCTURES
!
!     4D VARIABLES TO BE ADVECTED
!
      TYPE (BIEF_OBJ), TARGET :: SF
!
!     ADVECTION COEFFICIENT B
!
      TYPE (BIEF_OBJ), TARGET :: SB
!
!     FREQUENCIES
!
      TYPE (BIEF_OBJ), TARGET :: SFR
!
!     FREQUENCY STEPS
!
      TYPE (BIEF_OBJ), TARGET :: SDFR
!
!     SPECTRAL DENSITY
!
      TYPE (BIEF_OBJ), TARGET :: SSPEC
!
!     DIRECTIONAL FUNCTION
!
      TYPE (BIEF_OBJ), TARGET :: SFRA
!
!     NON-LINEAR INTERACTIONS
!
      TYPE (BIEF_OBJ), TARGET :: SCOEF
!
!     tableau des pieds des caracteristiques
!
      TYPE (BIEF_OBJ), TARGET :: SSHP1
!
!     tableau des pieds des caracteristiques
!
      TYPE (BIEF_OBJ), TARGET :: SSHZ
!
      TYPE (BIEF_OBJ), TARGET ::SCT,SCF,SSHF,SXK,SCG ,
     & SZF,SDEPTH,SUC,SVC,SUC1,SVC1,SUC2,SVC2,SDZHDT,SDZX ,
     & SDZY,SDF_LIM,SUV,SVV,SUV1,SVV1,SUV2,SVV2,SZM1,SZM2,
     & SCOSF,STGF,SDUX,SDUY,SDVX,SDVY,STETA,SCOSTE,SSINTE,
     & SFBOR,AM1,STSDER,STSTOT,ST0,ST1,ST2,ST3,ST4,BST1,VARSOR,
     & SBOUNDARY_COLOUR
!
      TYPE (BIEF_OBJ), TARGET :: STRA01, STOLD , STNEW, 
     &  STRA35, STRA36, STRA37, STRA38, STRA39,
     &  STRA40, STRA41, STRA42
!
!     Variance
      TYPE(BIEF_OBJ), TARGET :: SVARIA
      DOUBLE PRECISION, DIMENSION(:) ,POINTER :: VARIAN
!
!     Wave height
      TYPE(BIEF_OBJ), TARGET :: SHM0
      DOUBLE PRECISION, DIMENSION(:) ,POINTER :: HM0
!
!     Mean Direction 
      TYPE(BIEF_OBJ), TARGET :: SDMOY
      DOUBLE PRECISION, DIMENSION(:) ,POINTER :: DMOY     
!
!     Direction Spread
      TYPE(BIEF_OBJ), TARGET :: SSPREA
      DOUBLE PRECISION, DIMENSION(:) ,POINTER :: SPREAD
!
!     Mean Wave number
      TYPE(BIEF_OBJ), TARGET :: SXKMOY
      DOUBLE PRECISION, DIMENSION(:) ,POINTER :: XKMOY
!
!     Mean frequency
      TYPE(BIEF_OBJ), TARGET :: SFMOY
      DOUBLE PRECISION, DIMENSION(:) ,POINTER :: FMOY
!
!     Wave stress
      TYPE(BIEF_OBJ), TARGET :: STAUWA
      DOUBLE PRECISION, DIMENSION(:) ,POINTER :: TAUWAV
!
!     FRICTION VELOCITY
      TYPE(BIEF_OBJ), TARGET :: SUSOLD, SUSNEW
      DOUBLE PRECISION, DIMENSION(:), POINTER ::  USOLD, USNEW
!
!     SURFACE ROUGHNESS
      TYPE(BIEF_OBJ), TARGET :: SZ0OLD
      DOUBLE PRECISION, DIMENSION(:), POINTER :: Z0OLD
!
!     WIND DIRECTION
      TYPE(BIEF_OBJ), TARGET :: STWOLD
      DOUBLE PRECISION, DIMENSION(:), POINTER :: TWOLD
!
!     DRIVING FORCE
      TYPE(BIEF_OBJ), TARGET :: FORCEX, FORCEY
      DOUBLE PRECISION, DIMENSION(:), POINTER :: FX, FY
!
!     RADIATION STRESS
      TYPE(BIEF_OBJ), TARGET :: CONTXX, CONTXY, CONTYY
      DOUBLE PRECISION, DIMENSION(:), POINTER :: SXX, SXY, SYY
!
!     Peak Frequency by read method of order 5
      TYPE(BIEF_OBJ), TARGET :: PFREA5
      DOUBLE PRECISION, DIMENSION(:), POINTER :: FREA5
!
!     Peak Frequency by read method of order 8
      TYPE(BIEF_OBJ), TARGET :: PFREA8
      DOUBLE PRECISION, DIMENSION(:), POINTER :: FREA8
!
!     DRAG COEFFICIENT
      TYPE(BIEF_OBJ), TARGET :: SCDRA2
      DOUBLE PRECISION, DIMENSION(:) ,POINTER :: CDRA2
!
!     MAXIMUM ORBITAL VELOCITY NEAR THE BOTTOM
      TYPE(BIEF_OBJ), TARGET :: SVIFON
      DOUBLE PRECISION, DIMENSION(:), POINTER :: VIFOND
!
!     POWER PER UNIT LENGTH
      TYPE(BIEF_OBJ), TARGET :: SPOWER
      DOUBLE PRECISION, DIMENSION(:), POINTER :: POWER
!
!     MEAN PERIOD Tmoy
      TYPE(BIEF_OBJ), TARGET :: SPTMOY
      DOUBLE PRECISION, DIMENSION(:), POINTER :: PTMOY
!
!     MEAN PERIOD Tm01
      TYPE(BIEF_OBJ), TARGET :: SPTM01
      DOUBLE PRECISION, DIMENSION(:), POINTER :: PTM01
!
!     FREQUENCE FM01 
      TYPE(BIEF_OBJ), TARGET :: SFRM01
      DOUBLE PRECISION, DIMENSION(:) ,POINTER :: FRM01
!
!     MEAN PERIOD TM02
      TYPE(BIEF_OBJ), TARGET :: SPTM02
      DOUBLE PRECISION, DIMENSION(:), POINTER :: PTM02
!
!     FREQUENCE FM02
      TYPE(BIEF_OBJ), TARGET :: SFRM02
      DOUBLE PRECISION, DIMENSION(:) ,POINTER :: FRM02
!
!     Discrete peak period
      TYPE(BIEF_OBJ), TARGET :: SPPTPD
      DOUBLE PRECISION, DIMENSION(:), POINTER :: PPTPD
!
!     Discrete peak frequency
      TYPE(BIEF_OBJ), TARGET :: SFRPD
      DOUBLE PRECISION, DIMENSION(:), POINTER :: FRPD
!
!     Discrete peak period READ5
      TYPE(BIEF_OBJ), TARGET :: PPREA5
      DOUBLE PRECISION, DIMENSION(:), POINTER :: PREA5
!
!     Discrete peak period READ8
      TYPE(BIEF_OBJ), TARGET :: PPREA8
      DOUBLE PRECISION, DIMENSION(:), POINTER :: PREA8

      TYPE(BIEF_OBJ), TARGET :: SPRIVE, SIBOR, SLIFBR,
     & SLIQ,   SELT,   SETA,   SFRE,   SIAGNL, SITR11, SITR12, SITR13,
     & SITR01, SITR31, SITR32, SITR33, SBETBR, SBETWC, SISUB,
     & SAMORP

!     DU vieux
      TYPE (BIEF_OBJ), TARGET :: SXRELC, SYRELC, SXRELV, SYRELV
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: XRELC, XRELV, YRELC,
     & YRELV
!     FIN DU vieux

!     BLOCK OF BIEF_OBJ STRUCTURES
!
      TYPE(BIEF_OBJ) :: TB
!
!     EXTENSION OF IKLE2 (WITH LARGER NUMBER OF ELEMENTS)
!
      TYPE(BIEF_OBJ) :: IKLE_EXT
!
!     BIEF_OBJ STRUCTURES FOR ARRAYS OF DIMENSION NPOIN3
!
      TYPE(BIEF_OBJ), POINTER :: T3_01,T3_02,T3_03,T3_04,T3_05,T3_06
      TYPE(BIEF_OBJ), POINTER :: T3_07,T3_08,T3_09,T3_10
!
!     MESH STRUCTURES FOR 2D AND 3D
!
      TYPE(BIEF_MESH), TARGET :: MESH,MESH3D
!
!     DIFFRACTION
!
      TYPE(BIEF_OBJ), TARGET :: SA, SA_RMSE, SCCG, SDELTA, SDDX, SDDY
      TYPE(BIEF_OBJ), TARGET :: SDIV, SNB_CLOSE, SNEIGB
      TYPE(BIEF_OBJ), TARGET :: SRK, SRX, SRXX, SRY, SRYY, SXKONPT

!-----------------------------------------------------------------------
!     KEYWORDS AND PARAMETERS
!-----------------------------------------------------------------------
!
!     NUMBER OF DISCRETISED DIRECTIONS
!
      INTEGER, TARGET :: NDIRE
!
!     NUMBER OF DISCRETISED FREQUENCIES
!
      INTEGER, TARGET :: NF
!
!     PERIOD FOR LISTING PRINTOUTS
!
      INTEGER LISPRD
!
!     PERIOD FOR GRAPHIC PRINTOUTS
!
      INTEGER GRAPRD
!
!     NUMBER OF TIME STEP
!
      INTEGER, TARGET :: NIT
!
!     TIDE REFRESHING PERIOD
!
      INTEGER LAM
!
!     RANK OF THE WATER LEVEL DATA IN THE TELEMAC FILE
!
      INTEGER IDHMA
!
!     NUMBER OF FIRST ITERATION FOR GRAPHICS PRINTOUTS
!
      INTEGER GRADEB
!
!     NUMBER OF BOTTOM SMOOTHINGS
!
      INTEGER LISFON
!
!     WIND GENERATION
!
      INTEGER SVENT
!
!     WHITECAPPING DISSIPATION
!
      INTEGER, TARGET :: SMOUT
!
!     BOTTOM FRICTION DISSIPATION
!
      INTEGER SFROT
!
!     NON-LINEAR TRANSFERS BETWEEN FREQUENCIES
!
      INTEGER STRIF
!
!     DEPTH-INDUCED BREAKING DISSIPATION
!
      INTEGER, TARGET :: SBREK
!
!     DEPTH-INDUCED BREAKING 1 (BJ) QB COMPUTATION METHOD
!
      INTEGER, TARGET :: IQBBJ
!
!     DEPTH-INDUCED BREAKING 1 (BJ) HM COMPUTATION METHOD
!
      INTEGER IHMBJ
!
!     DEPTH-INDUCED BREAKING 1 (BJ) CHARACTERISTIC FREQUENCY
!
      INTEGER IFRBJ
!
!     DEPTH-INDUCED BREAKING 2 (TG) CHARACTERISTIC FREQUENCY
!
      INTEGER IFRTG
!
!     DEPTH-INDUCED BREAKING 2 (TG) WEIGHTING FUNCTION
!
      INTEGER IWHTG
!
!     DEPTH-INDUCED BREAKING 3 (RO) WAVE HEIGHT DISTRIBUTION
!
      INTEGER IDISRO
!
!     DEPTH-INDUCED BREAKING 3 (RO) EXPONENT WEIGHTING FUNCTION
!
      INTEGER IEXPRO
!
!     DEPTH-INDUCED BREAKING 3 (RO) CHARACTERISTIC FREQUENCY
!
      INTEGER IFRRO
!
!     DEPTH-INDUCED BREAKING 4 (IH) CHARACTERISTIC FREQUENCY
!
      INTEGER IFRIH
!
!     NUMBER OF BREAKING TIME STEPS
!
      INTEGER NDTBRK
!
!     NUMBER OF TIME STEPS FOR SURFACE ROLLERS
!
      INTEGER SUBSTEP_SURFROL
!
!     WAVE GROWTH LIMITER
!
      INTEGER LIMIT
!
!     CURRENTS FILE FORMAT
!
      INTEGER INDIC
!
!     WINDS FILE FORMAT
!
      INTEGER INDIV
!
!     TIDAL WATER LEVEL FILE FORMAT
!
      INTEGER INDIM
!
!     TYPE OF INITIAL DIRECTIONAL SPECTRUM
!
      INTEGER INISPE
!
!     TYPE OF BOUNDARY DIRECTIONAL SPECTRUM
!
      INTEGER LIMSPE
!
!     TRIAD INTERACTIONS
!
      INTEGER STRIA
!
!     NUMBER OF ITERATIONS FOR THE SOURCE TERMS
!
      INTEGER NSITS
!
!     TIME INCREMENT NUMBER IN TELEMAC FILE
!
      INTEGER NPTT
!
!     VECTOR LENGTH
!
      INTEGER LVMAC
!
!     NUMBER OF PRIVATE ARRAYS, NUMBER OF PRIVATE ARRAYS WITH GIVEN NAME
!
      INTEGER NPRIV,N_NAMES_PRIV
!
!     NUMBER OF DIFFERENTIATING ARRAYS, AND THOSE WITH A GIVEN NAME
!
      INTEGER NADVAR,N_NAMES_ADVAR
!
!     INITIAL ANGULAR DISTRIBUTION FUNCTION
!
      INTEGER FRABI
!
!     BOUNDARY ANGULAR DISTRIBUTION FUNCTION
!
      INTEGER FRABL
!
!     GODA CONSTANT FOR THE ANGULAR DISTRIBUTION FUNCTION
!
      DOUBLE PRECISION SMAX
!
!     NUMBER OF POINTS FOR WHICH WE WANT TO WRITE THEIR SPECTRUM
!
      INTEGER NPLEO
!
!     NUMBER OF POINTS FOR WHICH WE WILL IMPOSE A SPECTRUM
!
      INTEGER NPSPE
!
!     DEBUGGER
!
      INTEGER,TARGET :: DEBUG
!
!     COORDINATES OF THE ORIGIN IN (X, Y)
!
      INTEGER I_ORIG,J_ORIG
!
!     LINEAR WAVE GROWTH
!
      INTEGER LVENT
!
!     SETTING FOR INTEGRATION ON OMEGA1
!
      INTEGER IQ_OM1
!
!     SETTING FOR INTEGRATION ON THETA1
!
      INTEGER NQ_TE1
!
!     SETTING FOR INTEGRATION ON OMEGA2
!
      INTEGER NQ_OM2
!
!     DIFFRACTION
!
      INTEGER DIFFRA
!
!     STARTING TIME STEP FOR DIFFRACTION
!
      INTEGER NPTDIF
!
!     DIAGNOSTIC TAIL OPTION
!
      INTEGER DIAGHF
!
!     OPTION FOR SECOND DERIVATIVES
!
      INTEGER OPTDER
!
!     DISSIPATION BY STRONG CURRENT
!
      INTEGER SDSCU
!
!     MODELISATION CBAJ
!
      INTEGER CBAJ
!
!     TIME STEP
!
      DOUBLE PRECISION, TARGET :: DT
!
!     MINIMAL FREQUENCY
!
      DOUBLE PRECISION F1
!
!     FREQUENTIAL RATIO
!
      DOUBLE PRECISION, TARGET :: RAISF
!
!     DATE OF COMPUTATION BEGINNING
!
      DOUBLE PRECISION DDC
!
!     BOTTOM FRICTION COEFFICIENT
!
      DOUBLE PRECISION CFROT1
!
!     WHITE CAPPING DISSIPATION COEFFICIENT
!
      DOUBLE PRECISION, TARGET :: CMOUT1
!
!     WHITE CAPPING WEIGHTING COEFFICIENT
!
      DOUBLE PRECISION, TARGET :: CMOUT2
!
!     AIR DENSITY
!
      DOUBLE PRECISION ROAIR
!
!     WATER DENSITY
!
      DOUBLE PRECISION ROEAU
!
!     WIND GENERATION COEFFICIENT
!
      DOUBLE PRECISION, TARGET :: BETAM
!
!     VON KARMAN CONSTANT
!
      DOUBLE PRECISION XKAPPA
!
!     CHARNOCK CONSTANT
!
      DOUBLE PRECISION, TARGET :: ALPHA
!
!     SHIFT GROWING CURVE DUE TO WIND
!
      DOUBLE PRECISION DECAL
!
!     ELEVATION FOR WIND MEASUREMENTS
!
      DOUBLE PRECISION ZVENT
!
!     WIND DRAG COEFFICIENT
!
      DOUBLE PRECISION CDRAG
!
!     DEPTH-INDUCED BREAKING 1 (BJ) COEFFICIENT ALPHA
!
      DOUBLE PRECISION ALFABJ
!
!     DEPTH-INDUCED BREAKING 1 (BJ) COEFFICIENT GAMMA1
!
      DOUBLE PRECISION GAMBJ1
!
!     DEPTH-INDUCED BREAKING 1 (BJ) COEFFICIENT GAMMA2
!
      DOUBLE PRECISION GAMBJ2
!
!     DEPTH-INDUCED BREAKING 2 (TG) COEFFICIENT B
!
      DOUBLE PRECISION BORETG
!
!     DEPTH-INDUCED BREAKING 2 (TG) COEFFICIENT GAMMA
!
      DOUBLE PRECISION GAMATG
!
!     DEPTH-INDUCED BREAKING 3 (RO) COEFFICIENT ALPHA
!
      DOUBLE PRECISION ALFARO
!
!     DEPTH-INDUCED BREAKING 3 (RO) COEFFICIENT GAMMA
!
      DOUBLE PRECISION GAMARO
!
!     DEPTH-INDUCED BREAKING 3 (RO) COEFFICIENT GAMMA2
!
      DOUBLE PRECISION GAM2RO
!
!     DEPTH-INDUCED BREAKING 4 (IH) COEFFICIENT BETA0
!
      DOUBLE PRECISION BETAIH
!
!     DEPTH-INDUCED BREAKING 4 (IH) COEFFICIENT M2STAR
!
      DOUBLE PRECISION EM2SIH
!
!     MAXIMUM VALUE OF THE RATIO HM0 OVER D
!
      DOUBLE PRECISION COEFHS
!
!     COEFFICIENT OF THE TIME SUB-INCREMENTS FOR BREAKING
!
      DOUBLE PRECISION XDTBRK
!
!     STANDARD CONFIGURATION PARAMETER
!
      DOUBLE PRECISION XLAMD
!
!     IMPLICITATION COEFFICIENT FOR SOURCE TERMS
!
      DOUBLE PRECISION CIMPLI
!
!     INITIAL STILL WATER LEVEL
!
      DOUBLE PRECISION ZREPOS
!
!     TRIADS 1 (LTA) COEFFICIENT ALPHA
!
      DOUBLE PRECISION ALFLTA
!
!     TRIADS 1 (LTA) COEFFICIENT RFMLTA
!
      DOUBLE PRECISION RFMLTA
!
!     TRIADS 2 (SPB) NUMBER OF CONFIGURATIONS
!
      INTEGER NBD
!
!     TRIADS 2 (SPB) COEFFICIENT K
!
      DOUBLE PRECISION KSPB
!
!     TRIADS 2 (SPB) LOWER DIRECTIONAL BOUNDARY
!
      DOUBLE PRECISION BDISPB
!
!     TRIADS 2 (SPB) UPPER DIRECTIONAL BOUNDARY
!
      DOUBLE PRECISION BDSSPB
!
!     BETA_S PARAMETER IN SURFACE ROLLES
!
      DOUBLE PRECISION ::  BETA_S_SURFROL
!
!     BETA_2 PARAMETER IN SURFACE ROLLES
!
      DOUBLE PRECISION ::  BETA_2_SURFROL

      ! TRIAD QT2
      INTEGER, ALLOCATABLE :: QINDI(:)
      LOGICAL :: DEJA_QT2 = .FALSE.
!
!     INITIAL SIGNIFICANT WAVE HEIGHT
!
      DOUBLE PRECISION HM0I
!
!     PEAK FREQUENCY
!
      DOUBLE PRECISION FPIC
!
!     PEAK FACTOR
!
      DOUBLE PRECISION GAMMA
!
!     VALUE OF SIGMA-A FOR SPECTRUM
!
      DOUBLE PRECISION SIGMAA
!
!     VALUE OF SIGMA-B FOR SPECTRUM
!
      DOUBLE PRECISION SIGMAB
!
!     PHILLIPS CONSTANT
!
      DOUBLE PRECISION ALPHIL
!
!     MEAN FETCH VALUE
!
      DOUBLE PRECISION FETCH
!
!     MAXIMUM PEAK FREQUENCY
!
      DOUBLE PRECISION FREMAX
!
!     MAIN DIRECTION 1
!
      DOUBLE PRECISION TETA1
!
!     DIRECTIONAL SPREAD 1
!
      DOUBLE PRECISION SPRED1
!
!     MAIN DIRECTION 2
!
      DOUBLE PRECISION TETA2
!
!     DIRECTIONAL SPREAD 2
!
      DOUBLE PRECISION SPRED2
!
!     WEIGHTING FACTOR FOR ADF (DIRECTIONAL SPREADING FUNCTION)
!
      DOUBLE PRECISION XLAMDA
!
!     SPECTRUM TAIL FACTOR
!
      DOUBLE PRECISION TAILF
!
!     SPECTRUM ENERGY THRESHOLD
!
      DOUBLE PRECISION E2FMIN
!
!     BOUNDARY SIGNIFICANT WAVE HEIGHT
!
      DOUBLE PRECISION HM0L
!
!     BOUNDARY PEAK FREQUENCY
!
      DOUBLE PRECISION FPICL
!
!     BOUNDARY SPECTRUM VALUE OF SIGMA-A
!
      DOUBLE PRECISION SIGMAL
!
!     BOUNDARY SPECTRUM VALUE OF SIGMA-B
!
      DOUBLE PRECISION SIGMBL
!
!     BOUNDARY PHILLIPS CONSTANT
!
      DOUBLE PRECISION APHILL
!
!     BOUNDARY MEAN FETCH VALUE
!
      DOUBLE PRECISION FETCHL
!
!     BOUNDARY MAXIMUM PEAK FREQUENCY
!
      DOUBLE PRECISION FPMAXL
!
!     BOUNDARY MAIN DIRECTION 1
!
      DOUBLE PRECISION TETA1L
!
!     BOUNDARY DIRECTIONAL SPREAD 1
!
      DOUBLE PRECISION SPRE1L
!
!     BOUNDARY MAIN DIRECTION 2
!
      DOUBLE PRECISION TETA2L
!
!     BOUNDARY DIRECTIONAL SPREAD 2
!
      DOUBLE PRECISION SPRE2L
!
!     BOUNDARY WEIGHTING FACTOR FOR ADF
!
      DOUBLE PRECISION XLAMDL
!
!     BOUNDARY PEAK FACTOR
!
      DOUBLE PRECISION GAMMAL
!
!     WIND VELOCITY ALONG X AND Y
!
      DOUBLE PRECISION, TARGET :: VX_CTE
      DOUBLE PRECISION, TARGET :: VY_CTE
!
!     MINIMUM WATER DEPTH
!
      DOUBLE PRECISION PROMIN
!
!     COORDINATES OF SPECTRUM PRINTOUT POINTS
!
      DOUBLE PRECISION, ALLOCATABLE :: XLEO(:),YLEO(:)
!
!     ID OF SPECTRUM PRINTOUT NODE
!
      INTEGER, ALLOCATABLE :: NOLEO(:)
!
!     COORDINATES OF THE SPECTRUM THAT WILL BE IMPOSED
!
      DOUBLE PRECISION, ALLOCATABLE :: XSPE(:),YSPE(:)
!
!     YAN GENERATION COEFFICIENT D
!
      DOUBLE PRECISION COEFWD
!
!     YAN GENERATION COEFFICIENT E
!
      DOUBLE PRECISION COEFWE
!
!     YAN GENERATION COEFFICIENT F
!
      DOUBLE PRECISION COEFWF
!
!     YAN GENERATION COEFFICIENT H
!
      DOUBLE PRECISION COEFWH
!
!     WESTHUYSEN DISSIPATION COEFFICIENT
!
      DOUBLE PRECISION, TARGET ::  CMOUT3
!
!     SATURATION THRESHOLD FOR THE DISSIPATION
!
      DOUBLE PRECISION, TARGET ::  CMOUT4
!
!     WESTHUYSEN WHITE CAPPING DISSIPATION
!
      DOUBLE PRECISION, TARGET ::  CMOUT5
!
!     WESTHUYSEN WEIGHTING COEFFICIENT
!
      DOUBLE PRECISION, TARGET ::  CMOUT6
!
!     QNL4 - THRESHOLD0 FOR CONFIGURATIONS ELIMINATION
!
      DOUBLE PRECISION SEUIL
!
!     QNL4 - THRESHOLD1 FOR CONFIGURATIONS ELIMINATION
!
      DOUBLE PRECISION SEUIL1
!
!     QNL4 - THRESHOLD2 FOR CONFIGURATIONS ELIMINATION
!
      DOUBLE PRECISION SEUIL2
!
!     SPECTRUM VARIANCE THRESHOLD FOR DIFFRACTION
!
      DOUBLE PRECISION F2DIFM
!
!     DISSIPATION COEFFICIENT FOR STRONG CURRENT
!
      DOUBLE PRECISION CDSCUR
!
!     TIME OF BEGGINNING CALCULATION
!
      DOUBLE PRECISION AT0
!
!     REFLECTION COEFFICIENT
!
      DOUBLE PRECISION COEREF
!
!     VEGETATION DISSIPATION COEFFICIENT
!
      DOUBLE PRECISION COEVEG      
!
!     NUMBER OF PLANTS PER M2
!
      DOUBLE PRECISION NUMPLAM2
!
!     DIAMETER OF CYLINDRICAL STEM
!
      DOUBLE PRECISION STEMDIAM
!
!     BULK DRAG COEFFICIENT
!
      DOUBLE PRECISION BDC
!
!     VEGETATION HEIGHT
!
      DOUBLE PRECISION VEGH
!
!     CONSIDERATION OF SOURCE TERMS
!
      LOGICAL TSOU
!
!     SPHERICAL COORDINATES
!
      LOGICAL SPHE
!
!     GLOBAL OUTPUT AT THE END
!
      LOGICAL GLOB
!
!     NEXT COMPUTATION
!
      LOGICAL SUIT
!
!     INFINITE DEPTH
!
      LOGICAL PROINF
!
!     CONSIDERATION OF A CURRENT
!
      LOGICAL COURAN
!
!     CONSIDERATION OF A WIND
!
      LOGICAL VENT
!
!     CONSIDERATION OF A STATIONARY CURRENT
!
      LOGICAL COUSTA
!
!     CONSIDERATION OF A STATIONARY WIND
!
      LOGICAL VENSTA
!
!     CONSIDERATION OF TIDE
!
      LOGICAL MAREE
!
!     TRIGONOMETRICAL CONVENTION
!
      LOGICAL TRIGO
!
!     RECOVERY OF TELEMAC DATA ITEM
!
      LOGICAL DONTEL
!
!     CONSIDERATION OF PROPAGATION
!
      LOGICAL PROP
!
!     VALIDATION
!
      LOGICAL VALID
!
!     LIMIT SPECTRUM MODIFIED BY USER
!
      LOGICAL SPEULI
!
!     DIFFRACTION FILTER
!
      LOGICAL FLTDIF
!
!     INITIAL TIME SET TO ZERO
!
      LOGICAL RAZTIM
!
!     VEGETATION TAKEN INTO ACCOUNT
!
      LOGICAL VEGETATION
!
!     POROUS MEDIA TAKEN INTO ACCOUNT
!
      LOGICAL POROUS
!
!     SOURCE TERMS CALCULATED ON IMPOSED BOUNDARIES
!
      LOGICAL SOURCE_ON_BND
!
!     REFLECTION TAKEN INTO ACCOUNT
!
      LOGICAL REFLECTION
!
!     LOGICAL INDICATE THAT VELOCITY FRICTION IS SET BY API
!
      LOGICAL, TARGET :: APISET
!
!     USE SURFACE ROLLERS
!
      LOGICAL :: SURF_ROL
!
!     CALCULATE BREAKING DISSIPATION
!
      LOGICAL :: CALC_DISSIP
!
!     TITLE
!
      CHARACTER (LEN=80) :: TITCAS
!
!     VARIABLES FOR 2D GRAPHIC PRINTOUTS
!
      CHARACTER(LEN=PATH_LEN) :: SORT2D
!
      INTEGER, PARAMETER :: MAXVAR = 39
!
!     EQUATION SOLVED
!
      CHARACTER(LEN=20) EQUA
!
!     NAMES OF PRIVATE ARRAYS (GIVEN BY USER)
!
      CHARACTER(LEN=32) NAMES_PRIVE(4)
!
!     NAMES OF DIFFERENTING ARRAYS (GIVEN BY USER)
!
      CHARACTER(LEN=32) NAMES_ADVAR(MAXVAR)
!
!     TYPE OF ELEMENT IN 2D, 3D
!
      INTEGER IELM2,IELM3
!
!     NPOIN2*NDIRE
!
      INTEGER NPOIN3
!
!GM V6P1 - NEW SOURCE TERMS
!> @brief
! declaration for QNL4 - MDIA method
      INTEGER, PARAMETER :: MDIA = 4
!> @brief
! declaration for QNL4 - MDIA method
      INTEGER         , ALLOCATABLE ::  IANMDI(:,:,:)
!> @brief
! declaration for QNL4 - MDIA method
      DOUBLE PRECISION,ALLOCATABLE :: COEMDI(:,:),XMUMDI(:),XLAMDI(:)
!> @brief
! declaration for QNL4 - GQM method
      INTEGER  NCONF , NCONFM , NF1 , NF2 , NT1
!> @brief
! declaration for QNL4 - GQM method
      DOUBLE PRECISION ELIM
!> @brief
! declaration for QNL4 - GQM method
      INTEGER, ALLOCATABLE :: K_IF1(:) , K_1P(:,:) , K_1M(:,:),
     &                        K_IF2 (:,:,:), K_IF3 (:,:,:),
     &                        K_1P2P(:,:,:), K_1P2M(:,:,:),
     &                        K_1P3P(:,:,:), K_1P3M(:,:,:),
     &                        K_1M2P(:,:,:), K_1M2M(:,:,:),
     &                        K_1M3P(:,:,:), K_1M3M(:,:,:),
     &                        IDCONF(:,:)
!> @brief
! declaration for QNL4 - GQM method
      DOUBLE PRECISION, ALLOCATABLE :: TB_V24(:,:,:), TB_V34(:,:,:),
     &                                 TB_TPM(:,:,:), TB_TMP(:,:,:),
     &                                 TB_FAC(:,:,:),
     &                                 TB_V14(:)
!> @brief
! declaration for QNL4 - GQM method
      INTEGER, PARAMETER :: LBUF = 500
!> @brief
! declaration for QNL4 - GQM method
      INTEGER, PARAMETER :: DIMBUF = 2*LBUF+200
!> @brief
! declaration for QNL4 - GQM method
      INTEGER F_POIN(DIMBUF) , T_POIN(DIMBUF)
!> @brief
! declaration for QNL4 - GQM method
      DOUBLE PRECISION F_COEF(DIMBUF), F_PROJ(DIMBUF), TB_SCA(DIMBUF)
!GM Fin
!
!V6P2 Diffraction
!> @brief NAME
! description
      INTEGER, PARAMETER :: MAXNSP = 30
      INTEGER :: NRK_C
!V6P2 End diffraction
!
!> @brief
      LOGICAL SORLEO(MAXVAR) , SORIMP(MAXVAR)
!> @brief
      CHARACTER(LEN=32) VARCLA(10)
!> @brief
! nom des variables
      CHARACTER(LEN=32) TEXTE(MAXVAR)
!
      INTEGER :: ALIRE(MAXVAR)
!      DATA ALIRE /
!     BE ABSOLUTLY SURE THAT ALIRE IS SIZE MAXVAR
      PARAMETER ( ALIRE = (/
     &    0,1,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,
     &    0,0,0,0,0,0,0,0,0,0,0,0  /) )
!
!-----------------------------------------------------------------------
!   DECLARES POINTERS FOR ALIASES
!   THE TARGETS ARE DEFINED IN POINT
!-----------------------------------------------------------------------
!
!     MESH COORDINATES PER POINT
!
      DOUBLE PRECISION, DIMENSION(:), POINTER :: X,Y
!
!     MESH COORDINATES IN ELEMENTS
!
      DOUBLE PRECISION, DIMENSION(:), POINTER :: XEL,YEL
!> @brief
! inverse du determinant des elements 2d
      DOUBLE PRECISION, DIMENSION(:), POINTER :: SURDET
!> @brief
! correspondance numerotation locale-globale
      INTEGER, DIMENSION(:) , POINTER :: IKLE2
!> @brief
! numeros 2d des elements ayant une face commune avec l'element.
! si ifabor<=0 on a une face liquide,solide,ou periodique
      INTEGER, DIMENSION(:) , POINTER :: IFABOR
!> @brief
! numeros globaux des points frontieres
      INTEGER, DIMENSION(:) , POINTER :: NBOR
!> @brief
! nombre d'elements du maillage 2d
      INTEGER, POINTER:: NELEM2
!> @brief
! nombre de points 'frontiere'
      INTEGER, POINTER:: NPTFR
!> @brief NUMBER OF POINTS IN THE 2D MESH
! nombre de points du maillage 2d
      INTEGER, POINTER :: NPOIN2
!> @brief
! spectre directionnel de variance
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: F
!> @brief
! champ convecteur selon teta
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: CT
!> @brief
! champ convecteur selon freq. relat.
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: CF
!> @brief
! coordonnees barycentriques suivant z des noeuds dans leurs etages "eta" associes
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: SHZ
!> @brief
! coordonnees barycentriques suivant f des noeuds dans leurs frequences "fre" associees
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: SHF
!> @brief
! jacobien passage de n(kx,ky) a f(fr,teta)
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: B
!> @brief
! nombres d'onde
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: XK
!> @brief
! vitesses de groupe
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: CG
!> @brief BOTTOM ELEVATION
! cote du fond
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: ZF
!> @brief
! profondeur
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: DEPTH
!> @brief
! composantes ouest-est du courant (a t)
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: UC
!> @brief
! composantes sud-nord du courant (a t)
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: VC
!> @brief
! composantes ouest-est du courant (a t1)
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: UC1
!> @brief
! composantes sud-nord du courant (a t1)
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: VC1
!> @brief
! composantes ouest-est du courant (a t2)
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: UC2
!> @brief
! composantes sud-nord du courant (a t2)
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: VC2
!> @brief
! variation temporelle de la profondeur
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: DZHDT
!> @brief
! gradient de profondeur par rapport a x
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: DZX
!> @brief
! gradient de profondeur par rapport a y
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: DZY
!> @brief
! tableau utilise pour le limiteur de croissance
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: DF_LIM
!> @brief
! composantes ouest-est du vent (a t)
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: UV
!> @brief
! composantes sud-nord du vent (a t)
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: VV
!> @brief
! composantes ouest-est du vent (a t1)
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: UV1
!> @brief
! composantes sud-nord du vent (a t1)
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: VV1
!> @brief
! composantes ouest-est du vent (a t2)
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: UV2
!> @brief
! composantes sud-nord du vent (a t2)
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: VV2
!> @brief
! hauteur de la maree par rapport a zrepos a t1
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: ZM1
!> @brief
! hauteur de la maree par rapport a zrepos a t2
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: ZM2
!> @brief
! frequences de discretisation
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: FREQ
!> @brief
! pas de frequence
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: DFREQ
!> @brief
! VARIANCE DENSITY FREQUENCY SPECTRUM
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: SPEC
!> @brief
! DIRECTIONAL SPREADING FUNCTION VALUES
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: FRA
!> @brief
! coefficients de calcul pour dia
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: COEFNL
!> @brief
! cosinus des latitudes des points 2d
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: COSF
!> @brief
! tangentes des latitudes des points 2d
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: TGF
!> @brief
! gradient de courant u  par rapport a x
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: DUX
!> @brief
! gradient de courant u  par rapport a y
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: DUY
!> @brief
! gradient de courant v  par rapport a x
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: DVX
!> @brief
! gradient de courant v  par rapport a y
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: DVY
!> @brief
! directions de discretisation
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: TETA
!> @brief
! cosinus des directions
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: COSTET
!> @brief
! sinus des directions
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: SINTET
!> @brief
! densite spectrale au bord
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: FBOR
!> @brief
! contribution terme source - partie derivee
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: TSDER
!> @brief
! contribution terme source - partie totale
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: TSTOT
!> @brief WORKING ARRAY
! tableau de travail structures
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: T0
!> @brief WORKING ARRAY
! tableau de travail structures
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: T1
!> @brief WORKING ARRAY
! tableau de travail structures
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: T2
!> @brief WORKING ARRAY
! tableau de travail structures
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: T3
!> @brief WORKING ARRAY
! tableau de travail structures
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: T4
! BREAKING WAVE RATIO (CALCULATED IN QBREAK AND USED IN FDISS3D AND FDISSK)
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: BETABR
! WHITE CAPPING BREAKING WAVE RATIO (CALCULATED IN QMOUT)
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: BETAWC
!> @brief
! tableau de travail
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: TOLD
!> @brief
! tableau de travail
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: TNEW
!> @brief
! AMORTISSEMENT DE MILIEU POREUX
      DOUBLE PRECISION, DIMENSION(:) , POINTER ::  AMORP
!> @brief
!
      DOUBLE PRECISION, DIMENSION(:) ,POINTER ::
     & TRA35, TRA36 , TRA37 , TRA38 , TRA39, TRA40, TRA41
!> @brief
! tableau de travail
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: TRA01
!> @brief
! tableau utilisateur
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: PRIVE
!> @brief
! differentiable arrays
      DOUBLE PRECISION, DIMENSION(:) , POINTER :: ADVAR
!> @brief
!
      INTEGER, DIMENSION(:), POINTER :: IBOR
!> @brief
! type des conditions a la limite sur f(libre / impose)
      INTEGER, DIMENSION(:), POINTER :: LIFBOR
!> @brief
! COLOUR OF BOUNDARY POINT (DEFAULT: ITS RANK)
      INTEGER, DIMENSION(:), POINTER :: BOUNDARY_COLOUR
!> @brief
! numeros des elements 2d choisis pour chaque noeud
      INTEGER, DIMENSION(:), POINTER :: ELT
!> @brief
! numeros des directions/etages choisis pour chaque noeud
      INTEGER, DIMENSION(:), POINTER :: ETA
! numeros des Sous-domaines ou sont les pieds des caracteristiques
      INTEGER, DIMENSION(:), POINTER :: ISUB
!> @brief
! numeros des frequences choisies pour chaque noeud
      INTEGER, DIMENSION(:), POINTER :: FRE
!> @brief
! tableau des indices angulaires pour dia
      INTEGER, DIMENSION(:), POINTER :: IANGNL
!> @brief
!
      INTEGER, DIMENSION(:), POINTER :: ITR11 , ITR12 , ITR13
!> @brief
! tableau de travail
      INTEGER, DIMENSION(:), POINTER :: ITR01
!> @brief
!
      INTEGER, DIMENSION(:), POINTER :: ITR31,ITR32,ITR33
!
!     Diffraction
!
      INTEGER, DIMENSION(:), POINTER ::   NB_CLOSE, NEIGB
      DOUBLE PRECISION, DIMENSION(:), POINTER :: AMPLI, A_RMSE, CCG,
     &               DELTA, DIV, DDX, DDY, RK, RX, RXX, RY, RYY, XKONPT
!
!     GEOMETRY FILE
!
      INTEGER, TARGET :: WACGEO
!
!     STEERING FILE
!
      INTEGER :: WACCAS
!
!     BOUNDARY CONDITIONS FILE
!
      INTEGER, TARGET :: WACCLI
!
!     BOTTOM TOPOGRAPHY FILE
!
      INTEGER :: WACFON
!
!     TIME SERIES FILE
!
      INTEGER, TARGET :: WACHI2
!
!     COORDINATES OF POINTS FOR TIME SERIES FILE
!
      INTEGER, TARGET :: WACCOO
!
!     2D RESULTS FILE
!
      INTEGER, TARGET :: WACRES
!
!     1D SPECTRA RESULTS FILE
!
      INTEGER :: WACSPE
!
!     PUNCTUAL RESULTS FILE
!
      INTEGER :: WACLEO
!
!     PREVIOUS COMPUTATION FILE
!
      INTEGER :: WACPRE
!
!     GLOBAL RESULT FILE
!
      INTEGER :: WACRBI
!
!     BINARY CURRENTS FILE
!
      INTEGER :: WACCOB
!
!     FORMATTED CURRENTS FILE
!
      INTEGER :: WACCOF
!
!     BINARY FILE 1
!
      INTEGER :: WACBI1
!
!     FORMATTED FILE 1
!
      INTEGER :: WACFO1
!
!     BINARY WINDS FILE
!
      INTEGER :: WACVEB
!
!     FORMATTED WINDS FILE
!
      INTEGER :: WACVEF
!
!     VALIDATION FILE
!
      INTEGER :: WACREF
!
!     BINARY TIDAL WATER LEVEL FILE
!
      INTEGER :: WACMAB
!
!     FORMATTED TIDAL WATER LEVEL FILE
!
      INTEGER :: WACMAF
!
!     TEXT FILE WHICH DEFINES X AND Y COORDINATES FOR OUTPUTED SPECTRA
!
      INTEGER :: LEOWXY
!
!     TEXT FILE WHICH DEFINES X AND Y COORDINATES FOR IMPOSED SPECTRA
!
      INTEGER :: LEOIXY
!
!     TEXT FILE THAT DEFINE AREAS FOR POROUS MEDIA AND VEGETATION
!
      INTEGER :: WACZON
      
!
!     BINARY FILE WITH THE IMPOSED SPECTRA
!
      INTEGER :: IMPSPE
!
!     MAXIMUM OF LOGICAL UNITS NUMBERS
!
      INTEGER, PARAMETER :: MAXLU_WAC = 46
!
!     BIEF_FILES STRUCTURES
!
      TYPE(BIEF_FILE), TARGET :: WAC_FILES(MAXLU_WAC)
!     THOSE POINTER WILL DIRECTLY ADDRESS LOGICAL UNIT, NAME, AND FORMAT
      INTEGER, POINTER :: LUGEO, LURES, LUPRE, LUBI1, LUFO1,
     &    LUFON, LULEO, LUSPE, LUWXY, LUIXY, LUVEB, LUVEF, LUREF, LURBI,
     &    LUCOB, LUCOF, LUMAB, LUMAF
      CHARACTER(LEN=PATH_LEN), POINTER :: NAMFON, NAMRES, NAMLEO,
     &NAMSPE, NAMWXY, NAMIXY, NAMVEB, NAMVEF, NAMCOB, NAMCOF, NAMMAF,
     &NAMMAB
      CHARACTER(LEN=8), POINTER :: FMTGEO, FMTRES, FMTPRE, FMTBI1,
     & FMTLEO, FMTVEB, FMTVEF, FMTREF, FMTRBI, FMTCOB, FMTCOF,
     & FMTMAF, FMTMAB
!
!     TOMAWAC CONSTANTS (INITIALISED INTO TOMAWAC_CONSTANTS)
!
      DOUBLE PRECISION, PARAMETER :: PI = 4.D0 * ATAN( 1.D0 )
      DOUBLE PRECISION, PARAMETER :: DEUPI = 2.D0*PI
      DOUBLE PRECISION, PARAMETER :: GRAVIT = 9.81D0
      DOUBLE PRECISION, PARAMETER :: PISUR2 = PI*0.5D0
      DOUBLE PRECISION, PARAMETER :: RADDEG = 180.D0/PI
      DOUBLE PRECISION, PARAMETER :: DEGRAD = PI/180.D0
      DOUBLE PRECISION, PARAMETER :: SR = 1.D0/6400.D3
      DOUBLE PRECISION, PARAMETER :: R2 = (6400.D3)**2
      DOUBLE PRECISION, PARAMETER :: USDPI = 1.D0/DEUPI
      
!     FOR READING NAMES OF VARIABLES IN SERAFIN DATA FILES
!     30 IS HERE A MAXIMUM OF VARIABLES PER FILE
!
      CHARACTER(LEN=32) :: TEXCOB(30),TEXMAB(30),TEXVEB(30)
!
!     NAMES OF VARIABLES IN SERAFIN DATA FILES (VELOCITY ALONG X AND Y
!                                               WIND ALONG X AND Y
!                                               DEPTH)
!
      CHARACTER(LEN=32) :: NAMEU,NAMEV,NAMEWX,NAMEWY,NAMEH
!
!     UNIT OF TIME IN SERAFIN DATA FILES
!
      DOUBLE PRECISION :: UNITCOB,UNITMAB,UNITVEB,UNITSPE
!
!     TIME SHIFT IN SERAFIN DATA FILES
!
      DOUBLE PRECISION :: PHASCOB,PHASMAB,PHASVEB,PHASSPE
!
!     SAVED VARIABLE
!
      ! limwac
      DOUBLE PRECISION, ALLOCATABLE :: UV2D(:),VV2D(:),PROF(:)
      DOUBLE PRECISION, ALLOCATABLE :: FB_CTE(:,:)
      INTEGER :: NPB
      ! rpi_invr
      DOUBLE PRECISION, ALLOCATABLE:: RK_I(:,:), RN(:,:)
      DOUBLE PRECISION, ALLOCATABLE:: RX_I(:,:), RY_I(:,:)
      DOUBLE PRECISION, ALLOCATABLE:: RXX_I(:,:), RYY_I(:,:)
      DOUBLE PRECISION, ALLOCATABLE:: RAD1(:,:)
      LOGICAL :: DEJA_RPI = .FALSE.
      ! frmset
      INTEGER,ALLOCATABLE:: ILM_POIN(:,:), CLM(:), KACC(:)
      INTEGER,ALLOCATABLE:: NB_C(:), SUR_P(:,:)
      INTEGER,ALLOCATABLE:: STACK(:), STACK2(:)
      LOGICAL,ALLOCATABLE:: ALREADY_POM(:)
      DOUBLE PRECISION,ALLOCATABLE:: MINDIST(:)
      LOGICAL :: DEJA_FRMSET = .FALSE.
      ! diffrac
      DOUBLE PRECISION, ALLOCATABLE :: SQRDELTA(:)
      DOUBLE PRECISION, ALLOCATABLE :: SQRCCG(:)
      DOUBLE PRECISION, ALLOCATABLE :: FRDK(:,:),FRDA(:,:),SCDA(:,:)
      LOGICAL, ALLOCATABLE :: L_DELTA(:)
      LOGICAL :: DEJA_DIFFRAC = .FALSE.
      ! rpi_intr
      DOUBLE PRECISION, ALLOCATABLE :: WU_OM_RPI(:)
      LOGICAL :: DEJA_RPI_INTR = .FALSE.
      DOUBLE PRECISION DTSI
      ! Time step informations
      DOUBLE PRECISION, TARGET :: AT
      INTEGER, TARGET :: LT
!     NUMBER OF VARIABLES OF THE FORMATTED CURRENT FILE
      INTEGER NVCOU
!     TIME T1 AND T2 IN THE CURRENT FILE
      DOUBLE PRECISION TC1,TC2
!     N.OF VARIABLES OF THE FORMATTED WATER LEVEL FILE
      INTEGER NVHMA
!     TIME T1 AND T2 IN THE WATER LEVEL FILE
      DOUBLE PRECISION TM1,TM2
!     N.OF VARIABLES OF THE WIND FILE
      INTEGER NVWIN
!     TIME T1 AND T2 IN THE WIND FILE
      DOUBLE PRECISION TV1,TV2
!     SAY IF WE TAKE BOUNDARY CONDITION BEFORE OR AFTER THE TIMESTEP
!     true limwac at the beginning of the loop in time
      LOGICAL AVANT
!     SAY IF WE USE ECRETE FUNCTION FOR THE SPECTRUM.
      LOGICAL ECRET
      ! Coupling informations
      TYPE CPL_WAC_DATA_OBJ
        ! Number of telemac time steps
        INTEGER :: NIT_TEL
        ! Coupling period with telemac
        INTEGER :: PERCOU_WAC
        ! Current velocity along x in telemac model
        TYPE(BIEF_OBJ), POINTER :: U_TEL
        ! Current velocity along y in telemac model
        TYPE(BIEF_OBJ), POINTER :: V_TEL
        ! Telemac model water depth
        TYPE(BIEF_OBJ), POINTER :: H_TEL
        
        !Surface roller energy
        TYPE(BIEF_OBJ), POINTER :: SURFROL_TEL
        !Surface roller energy dissipation
        TYPE(BIEF_OBJ), POINTER :: SURFDIS_TEL                

        ! Mean direction of wave
        TYPE(BIEF_OBJ), POINTER :: DIRMOY_TEL
        ! Significant wave height
        TYPE(BIEF_OBJ), POINTER :: HM0_TEL
        ! Peak Period order 5th
        TYPE(BIEF_OBJ), POINTER :: TPR5_TEL

        ! Orbital velocity
        TYPE(BIEF_OBJ), POINTER :: ORBVEL_TEL
        ! Driving force along x passed to telemac
        TYPE(BIEF_OBJ), POINTER :: FX_WAC
        ! Driving force along y passed to telemac
        TYPE(BIEF_OBJ), POINTER :: FY_WAC
        ! Wind velocity along x in telemac model
        TYPE(BIEF_OBJ), POINTER :: UV_TEL
        ! Wind velocity along y in telemac model
        TYPE(BIEF_OBJ), POINTER :: VV_TEL
        ! Telemac model time step
        DOUBLE PRECISION :: DT_TEL
        ! Computation time of telemac model
        DOUBLE PRECISION :: AT_TEL
        LOGICAL :: COUPL3D
!       WAVE INDUCED PRESSURE AND ITS DERIVATIVES
        TYPE(BIEF_OBJ),POINTER :: WIPW, WIPDXW, WIPDYW
!       STOKES VELOCITY
        TYPE(BIEF_OBJ),POINTER :: USTW, VSTW, WSTW
!       ELEVATION
        TYPE(BIEF_OBJ),POINTER :: ZTELW
        INTEGER :: NZW
!       SURFACES STRESS DUE TO DEPTH INDUCED WAVE BREAKING
        TYPE(BIEF_OBJ),POINTER :: FDXW, FDYW
!       DISSIPATION DUE TO BOTTOM FRICTION
        TYPE(BIEF_OBJ),POINTER :: FBXW, FBYW
!       MODIFIED FRICTION COEFFICIENT DUE TO WAVES + CURRENTS
        TYPE(BIEF_OBJ),POINTER :: CFWCW
!       MODIFIED TURBULENT WAVES VISCOSITY DUE TO BREAKING
        TYPE(BIEF_OBJ),POINTER :: FDKW
!       FORCES DUE TO WIND
        TYPE(BIEF_OBJ),POINTER :: FWX, FWY
      END TYPE

      TYPE(CPL_WAC_DATA_OBJ) :: CPL_WAC_DATA
      INTEGER, PARAMETER :: WAC_FULL_RUN = -1
      INTEGER, PARAMETER :: WAC_CPL_INIT = 0
      INTEGER, PARAMETER :: WAC_CPL_RUN = 1
      INTEGER, PARAMETER :: WAC_API_INIT = 2
      INTEGER, PARAMETER :: WAC_API_RUN = 3

      SAVE
!
!     COUPLING VARIABLES
      TYPE(BIEF_OBJ), TARGET :: U_TEL,V_TEL,H_TEL
      TYPE(BIEF_OBJ), TARGET :: DIRMOY_TEL,HM0_TEL,TPR5_TEL
      TYPE(BIEF_OBJ), TARGET :: COSDIR_TEL,SINDIR_TEL
      TYPE(BIEF_OBJ), TARGET :: ORBVEL_TEL
      TYPE(BIEF_OBJ), TARGET :: FX_WAC,FY_WAC
      TYPE(BIEF_OBJ), TARGET :: UV_TEL,VV_TEL
      TYPE(BIEF_OBJ), TARGET :: SURFROL_TEL,SURFDIS_TEL

!     COUPLING VARS 3D COUPLING
      TYPE (BIEF_OBJ), TARGET :: WIPDX,WIPDY,WIPW,FWXW,FWYW
      TYPE (BIEF_OBJ), TARGET :: USTW,VSTW,WSTW,ZTELW
      TYPE (BIEF_OBJ), TARGET :: FDXW,FDYW,FBXW,FBYW,CFWCW,FDKW
      TYPE (BIEF_OBJ), TARGET :: ZPERPLAN,USTOPLAN,VSTOPLAN,FDKPPL      

      ! NUMBER OF VARIABLES TO COMMUNICATE
      INTEGER :: NVARTOM2TEL
      INTEGER :: NVARTEL2TOM

      ! BLOCK FOR COMMUNICATION
      TYPE(BIEF_OBJ)   :: TEL2TOM, TOM2TEL

      ! COPIES OF TELEMAC VARIABLES
      LOGICAL :: COUROU_TEL, VENT_TEL, COPGAI_TEL

      ! ENERGY DISSIPATION DUE TO BREAKING WAVES
      TYPE(BIEF_OBJ), TARGET :: DISSIP_BREAK

      END MODULE DECLARATIONS_TOMAWAC
