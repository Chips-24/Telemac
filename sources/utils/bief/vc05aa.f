!                   *****************
                    SUBROUTINE VC05AA
!                   *****************
!
     &( XMUL,SF,F,SURFAC,
     &  IKLE1,IKLE2,IKLE3,NELEM,NELMAX,W1,W2,W3)
!
!***********************************************************************
! BIEF   V7P1                                   27/04/2015
!***********************************************************************
!
!brief    COMPUTES THE FOLLOWING VECTOR IN FINITE ELEMENTS:
!code
!+                    /
!+    VEC(I) = XMUL  /    PSI(I) * F  D(OMEGA)
!+                  /OMEGA
!+
!+    PSI(I) IS A BASE OF TYPE P1 TRIANGLE
!+
!+    F IS A VECTOR OF DISCRETISATION P0, P1 OR DISCONTINUOUS P1
!
!warning  THE JACOBIAN MUST BE POSITIVE
!warning  THE RESULT IS IN W IN NOT ASSEMBLED FORM
!
!history  A JOLY (LNHE)
!+        27/04/2015
!+        V7P1
!+
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!| F              |-->| FUNCTION USED IN THE VECTOR FORMULA
!| IKLE1          |-->| FIRST POINT OF TRIANGLES
!| IKLE2          |-->| SECOND POINT OF TRIANGLES
!| IKLE3          |-->| THIRD POINT OF TRIANGLES
!| NELEM          |-->| NUMBER OF ELEMENTS
!| NELMAX         |-->| MAXIMUM NUMBER OF ELEMENTS
!| SF             |-->| BIEF_OBJ STRUCTURE OF F
!| SURFAC         |-->| AREA OF TRIANGLES
!| W1             |<--| RESULT IN NON ASSEMBLED FORM
!| W2             |<--| RESULT IN NON ASSEMBLED FORM
!| W3             |<--| RESULT IN NON ASSEMBLED FORM
!| XMUL           |-->| MULTIPLICATION COEFFICIENT
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
      USE DECLARATIONS_SPECIAL
      USE BIEF, EX_VC05AA => VC05AA
!
      IMPLICIT NONE
!
!+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
!
      INTEGER, INTENT(IN) :: NELEM,NELMAX
      INTEGER, INTENT(IN) :: IKLE1(NELMAX),IKLE2(NELMAX),IKLE3(NELMAX)
!
      DOUBLE PRECISION, INTENT(IN) :: SURFAC(NELMAX)
      DOUBLE PRECISION,INTENT(INOUT)::W1(NELMAX),W2(NELMAX),W3(NELMAX)
      DOUBLE PRECISION, INTENT(IN) :: XMUL
!
!     STRUCTURE OF F AND REAL DATA
!
      TYPE(BIEF_OBJ), INTENT(IN)   :: SF
      DOUBLE PRECISION, INTENT(IN) :: F(*)
!
!+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
!
!
! ! Method 1
!       INTEGER IELEM,IELMF
!       DOUBLE PRECISION XSUR03,F1,F2,F3,COEF
!
! Method 2
      INTEGER IELEM,IELMF
      DOUBLE PRECISION XSUR12,F1,F2,F3,F123,COEF
!
!
!-----------------------------------------------------------------------
!
      IELMF=SF%ELM
!
!-----------------------------------------------------------------------
!
!     F IS A LINEAR TRIANGLE
!
      IF(IELMF.EQ.11) THEN
!
! !---------------
! ! Method 1
! !---------------
!       XSUR03 = XMUL / 3.D0
! !
!       DO IELEM = 1 , NELEM
! !
!         F1  = F(IKLE1(IELEM))
!         F2  = F(IKLE2(IELEM))
!         F3  = F(IKLE3(IELEM))
! !
!         COEF = XSUR03 * SURFAC(IELEM)
! !
!         ! SURFACE / 3.D0 * NOEUD
!         W1(IELEM) = COEF * F1
!         W2(IELEM) = COEF * F2
!         W3(IELEM) = COEF * F3
!         W4(IELEM) = 0.D0
!         W5(IELEM) = 0.D0
!         W6(IELEM) = 0.D0
! !
!       ENDDO
!
!---------------
! Method 2
!---------------
      XSUR12 = XMUL / 12.D0
!
      DO IELEM = 1 , NELEM
!
        F1  = F(IKLE1(IELEM))
        F2  = F(IKLE2(IELEM))
        F3  = F(IKLE3(IELEM))
        F123  = F1 + F2 + F3
!
        COEF = XSUR12 * SURFAC(IELEM)
!
        ! SURFACE / 3.D0 * MOYENNE (FACE + NOEUD)
        W1(IELEM) = COEF * ( F123 + F1 )
        W2(IELEM) = COEF * ( F123 + F2 )
        W3(IELEM) = COEF * ( F123 + F3 )
!
      ENDDO
!
!-----------------------------------------------------------------------
!
      ELSE
!
!-----------------------------------------------------------------------
!
        WRITE(LU,101) IELMF,SF%NAME
101     FORMAT(1X,'VC05AA (BIEF) :',/,
     &         1X,'DISCRETIZATION OF F NOT AVAILABLE:',1I6,
     &         1X,'REAL NAME: ',A6)
        CALL PLANTE(1)
        STOP
!
      ENDIF
!
!-----------------------------------------------------------------------
!
      RETURN
      END
