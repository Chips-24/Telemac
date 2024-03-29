!                   ************************************
                    DOUBLE PRECISION FUNCTION ANTI_DIRAC
!                   ************************************
!
     &( X,EPS )
!
!***********************************************************************
! TELEMAC2D   V7P1                                    29/09/2015
!***********************************************************************
!
!brief    GIVES 0 IF (ABS(X)<EPS) AND 1 ELSWHERE
!+
!
!history  R.ATA (LNHE)
!+        29/09/2015
!+        V7P1
!+
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!| X              |-->| INPUT VARIABLE
!| EPS            |-->| TOLERENCE
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
      USE BIEF, EX_ANTI_DIRAC => ANTI_DIRAC
      USE DECLARATIONS_SPECIAL
!
      IMPLICIT NONE
!
!+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
!
      DOUBLE PRECISION, INTENT(IN) :: X,EPS
!
!+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
!
      IF(ABS(X).LT.EPS) THEN
        ANTI_DIRAC=0.D0
      ELSE
        ANTI_DIRAC=1.0D0
      ENDIF
!
!-----------------------------------------------------------------------
!
      RETURN
      END
