!                   ***************************
                    MODULE DECLARATIONS_SPECIAL
!                   ***************************
!
!
!***********************************************************************
! SPECIAL                                             09/05/2014
!***********************************************************************
!
!brief    Defining parameters that need to be created first because they
!+        could be used by any other library.
!
!history  Y. AUDOUIN & J-M HERVOUET (EDF LAB, LNHE)
!+        09/05/2014
!+        V7P0
!+   First version.
!
!history Y AUDOUIN (LNHE)
!+       25/05/2015
!+       V7P0
!+       Modification to comply with the hermes module
!
!history S.E. BOURBAN (HRW)
!+       20/09/2016
!+       V7P2
!+       Enabling ENDIAN and FLOAT formats of the GEOMETRY file to be
!+       the default of all OUTPUT FILES binaries, unless the user sets
!+       it otherwise in the CAS file. Also:
!+       - ENDIAN is also compiler dependent
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
      IMPLICIT NONE
!----------------------------------------------------------------------
!
      INTEGER, PARAMETER :: LNG_FR=1
      INTEGER, PARAMETER :: LNG_EN=2
      INTEGER :: LNG=LNG_EN ! Language for listing outputs
      INTEGER, PARAMETER :: PATH_LEN = 250

      ! If false listing for proc 1 will be written into a file
      LOGICAL :: STD_OUTPUT = .TRUE.
      INTEGER :: LU=6 ! Output id
      INTEGER :: LI=5 ! Input id
      ! VERSION THAT IS DISPLAYED everywhere in the system
      CHARACTER(LEN=6), PARAMETER :: VERSION = 'V8P5  '
      ! Max number of keywords
      INTEGER, PARAMETER :: MAXKEYWORD = 300
      ! Max lenght of the path of the temporary folder
      INTEGER, PARAMETER :: MAXLENTMPDIR = 250
      ! Max lenght for the name of a file
      INTEGER, PARAMETER :: MAXLENFILE = 250
      !
      !True if partel should have only generated concatenated files and
      !their index. False if partel should have generated one set of
      !input files per process. Value is set in lecdon.
      LOGICAL :: PARTEL_CONCAT = .FALSE.
      !
!     Integer values to allow the allocation of I4 and I8 integers.
!
!     The syntax will be :
!
!     INTEGER(KIND=K4) :: I (I WILL BE A 4-BYTE INTEGER)
!     INTEGER(KIND=K8) :: I (I WILL BE A 8-BYTE INTEGER)
!
      INTEGER, PARAMETER :: K4 = SELECTED_INT_KIND(8)
      INTEGER, PARAMETER :: K8 = SELECTED_INT_KIND(16)
      INTEGER, PARAMETER :: R4 = SELECTED_REAL_KIND( 5, 20 )  ! SINGLE PRECISION SIZE
      INTEGER, PARAMETER :: R8 = SELECTED_REAL_KIND( 10, 60 ) ! DOUBLE PRECISION SIZE
!
!     ERROR HANDLING
      CHARACTER(LEN=200) :: ERROR_MESSAGE
      INTEGER, PARAMETER :: NO_ERROR = 0
      INTEGER, PARAMETER :: UNCONTROLLED_ERR = 1
      INTEGER, PARAMETER :: UNKNOWN_ELT_TYPE_ERR = 2
!
!     ERROR FOR HERMES
      INTEGER, PARAMETER :: HERMES_RECORD_UNKNOWN_ERR = 1000
      INTEGER, PARAMETER :: HERMES_VAR_UNKNOWN_ERR = 1001
      INTEGER, PARAMETER :: HERMES_FILE_ID_ALREADY_IN_USE_ERR = 1002
      INTEGER, PARAMETER :: HERMES_FILE_NOT_OPENED_ERR = 1003
      INTEGER, PARAMETER :: HERMES_MAX_FILE_ERR = 1004
      INTEGER, PARAMETER :: HERMES_WRONG_ARRAY_SIZE_ERR = 1005
      INTEGER, PARAMETER :: HERMES_MED_NOT_LOADED_ERR = 1006
      INTEGER, PARAMETER :: HERMES_UNKNOWN_ELEMENT_TYPE_ERR = 1007
      INTEGER, PARAMETER :: HERMES_WRONG_ELEMENT_TYPE_ERR = 1008
      INTEGER, PARAMETER :: HERMES_UNKNOWN_GROUP_ERR = 1009
      INTEGER, PARAMETER :: HERMES_WRONG_HDF_FORMAT_ERR = 1010
      INTEGER, PARAMETER :: HERMES_WRONG_MED_FORMAT_ERR = 1011
      INTEGER, PARAMETER :: HERMES_WRONG_MED_VERSION_ERR = 1012
      INTEGER, PARAMETER :: HERMES_WRONG_AXE_ERR = 1013
      INTEGER, PARAMETER :: HERMES_BND_POINT_NOT_FOUND_ERR = 1014
      INTEGER, PARAMETER :: HERMES_INVALID_OPEN_MODE_ERR = 1015
      INTEGER, PARAMETER :: HERMES_INVALID_SERAFIN_FILE = 1016
      INTEGER, PARAMETER :: HERMES_WRONG_SIZE = 1017
      INTEGER, PARAMETER :: HERMES_UNKNOWN_BND_CONDITION = 1018
      INTEGER, PARAMETER :: HERMES_TWO_DIFF_LIQ_BND_ERR = 1019
      INTEGER, PARAMETER :: HERMES_VTK_NOT_LOADED_ERR = 1020
      INTEGER, PARAMETER :: HERMES_WRITE_ONLY_ERR = 1021
      INTEGER, PARAMETER :: HERMES_CGNS_NOT_LOADED_ERR = 1022
      INTEGER, PARAMETER :: HERMES_UNKNOWN_FILE_FORMAT_ERR = 1023
!
!     TYPE OF ELEMENTS
!
      INTEGER, PARAMETER :: TYPE_NULL = -1
      INTEGER, PARAMETER :: POINT_ELT_TYPE = 0
      INTEGER, PARAMETER :: POINT_BND_ELT_TYPE = 1
      INTEGER, PARAMETER :: TRIANGLE_ELT_TYPE = 10
      INTEGER, PARAMETER :: QUADRANGLE_ELT_TYPE = 20
      INTEGER, PARAMETER :: TETRAHEDRON_ELT_TYPE = 30
      INTEGER, PARAMETER :: PRISM_ELT_TYPE = 40
      INTEGER, PARAMETER :: SPLIT_PRISM_ELT_TYPE = 50
      INTEGER, PARAMETER :: EDGE_BND_ELT_TYPE = 55
      INTEGER, PARAMETER :: TRIANGLE_BND_ELT_TYPE = 60
      INTEGER, PARAMETER :: QUADRANGLE_BND_ELT_TYPE = 70
      INTEGER, PARAMETER :: TRIANGLE_3D_BND_ELT_TYPE = 80
!
!     ID Tracking
!
      INTEGER :: MAX_ID = 10
!
!     SHARING AND PASSING ON THE ENDIAN AND THE PRECISION FORMATS
!
#if defined COMPAD || defined LITTLE_ENDIAN
      CHARACTER(LEN=13) :: ENDIAN = 'LITTLE_ENDIAN'
#else
      CHARACTER(LEN=13) :: ENDIAN = 'BIG_ENDIAN   '
#endif
!
      DOUBLE PRECISION TEL_OFFSET
!
!-----------------------------------------------------------------------
!
!    SPECIAL FLAGS THAT ALTER BEHAVIOUT OF DIFFERENTIATED MODELS
!
!     USE OF SYMBOLIC LINEAR SOLVER FOR AD
!
      LOGICAL AD_SYMBLINSOLV
!
!     RESET DERIVATIVES FOR ITERATIVE LINEAR SOLVER FOR AD
!
      LOGICAL AD_LINSOLV_RESETDERIV
!
!     USE DERIVATIVES FOR CONVERGENCE TEST IN LINEAR SOLVER FOR AD
!
      LOGICAL AD_LINSOLV_DERIVATIVE_CONVERGENCE
!
!-----------------------------------------------------------------------
!
      CONTAINS

      CHARACTER(LEN=12) FUNCTION I2CHAR(INT_IN)
      IMPLICIT NONE
      INTEGER, INTENT(IN) :: INT_IN ! THE INTEGER TO CONVERT
!
      CHARACTER(LEN=12) :: STRING    ! TEMPORARY STRING
      CHARACTER(LEN=5)  :: THEFORMAT ! FORMAT TO USE FOR THE INTEGER
      INTEGER           :: N         ! NUMBER OF DECIMALS IN THE INTEGER
      ! WE LOOK FOR N SUCH THAT 10^{N-1} < INT_IN < 10^{N}
      ! THIS IS DONE TO MAKE SURE THAT WE DO NOT CREATE A FORMAT "OVERFLOW"
      N = 1
      DO WHILE (INT_IN.GE.10**N)
          N = N + 1
      ENDDO
      ! CHECK ON THE "LENGTH" OF THE INTEGER
      IF (N .LE. 9) THEN
      ! WRITE THE INTEGER IN A STRING WITH THE RIGHT FORMAT
        WRITE(UNIT=THEFORMAT,FMT='(''(I'',I1,'')'')') N
        WRITE(UNIT=STRING,FMT=THEFORMAT) INT_IN
      ELSE IF ( (N .GE. 10) .AND. (N .LE. 12) ) THEN
      !   WRITE THE INTEGER IN A STRING WITH THE RIGHT FORMAT
        WRITE(UNIT=THEFORMAT,FMT='(''I'',I2)') N
        WRITE(UNIT=STRING,FMT=THEFORMAT) INT_IN
      ENDIF
      ! TRIM THE STRING AND RETURN
      I2CHAR = TRIM(STRING)
      END FUNCTION I2CHAR

      CHARACTER(LEN=20) FUNCTION TYP2STR(ITYPE)
        IMPLICIT NONE
        INTEGER, INTENT(IN) :: ITYPE

      IF(ITYPE.EQ.POINT_ELT_TYPE) THEN
        TYP2STR = "POINT"
      ELSEIF(ITYPE.EQ.POINT_BND_ELT_TYPE) THEN
        TYP2STR = "POINT"
      ELSEIF(ITYPE.EQ.TRIANGLE_ELT_TYPE) THEN
        TYP2STR = "TRIANGLE"
      ELSEIF(ITYPE.EQ.QUADRANGLE_ELT_TYPE) THEN
        TYP2STR = "QUADRANGLE"
      ELSEIF(ITYPE.EQ.TETRAHEDRON_ELT_TYPE) THEN
        TYP2STR = "TETRAHEDRON"
      ELSEIF(ITYPE.EQ.PRISM_ELT_TYPE) THEN
        TYP2STR = "PRISM"
      ELSEIF(ITYPE.EQ.SPLIT_PRISM_ELT_TYPE) THEN
        TYP2STR = "SPLIT_PRISM"
      ELSEIF(ITYPE.EQ.EDGE_BND_ELT_TYPE) THEN
        TYP2STR = "EDGE"
      ELSEIF(ITYPE.EQ.TRIANGLE_BND_ELT_TYPE) THEN
        TYP2STR = "TRIANGLE"
      ELSEIF(ITYPE.EQ.QUADRANGLE_BND_ELT_TYPE) THEN
        TYP2STR = "QUADRANGLE"
      ELSEIF(ITYPE.EQ.TRIANGLE_3D_BND_ELT_TYPE) THEN
        TYP2STR = "TRIANGLE"
      ELSEIF(ITYPE.EQ.TYPE_NULL) THEN
        TYP2STR = "NONE"
      ELSE
        TYP2STR = "UNKNOWN TYPE"
      ENDIF
      END FUNCTION TYP2STR

      END MODULE DECLARATIONS_SPECIAL
