!                    *****************
                     SUBROUTINE DRAGFO
!                    *****************
!
     &(FUDRAG,FVDRAG)
!
!***********************************************************************
! TELEMAC2D   V6P2                                   21/08/2010
!***********************************************************************
!
!brief    ADDS THE DRAG FORCE OF VERTICAL STRUCTURES IN THE
!+                MOMENTUM EQUATION.
!code
!+  FU IS THEN USED IN THE EQUATION AS FOLLOWS :
!+
!+  DU/DT + U GRAD(U) = - G * GRAD(FREE SURFACE) +..... + FU_IMP * U
!+
!+  AND THE TERM FU_IMP * U IS TREATED IMPLICITLY.
!
!warning  USER SUBROUTINE
!
!history  J-M HERVOUET
!+        01/03/1990
!+        V5P2
!+
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
!history  J,RIEHME (ADJOINTWARE)
!+        November 2016
!+        V7P2
!+   Replaced EXTERNAL statements to parallel functions / subroutines
!+   by the INTERFACE_PARALLEL
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!| FUDRAG         |<--| DRAG FORCE ALONG X
!| FVDRAG         |<--| DRAG FORCE ALONG Y
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
      USE BIEF
      USE DECLARATIONS_TELEMAC2D
!
      USE DECLARATIONS_SPECIAL
      USE INTERFACE_PARALLEL, ONLY : P_SUM
      IMPLICIT NONE
!
!+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
!
      TYPE(BIEF_OBJ), INTENT(INOUT) :: FUDRAG,FVDRAG
!
!+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
!
      INTEGER IELEM,I,I4,DISCLIN
      INTEGER NPONT,NSOM
      DOUBLE PRECISION UNORM
      DOUBLE PRECISION X4,Y4
      DOUBLE PRECISION, PARAMETER :: CD=0.1D0,DIAM=2.D0
!
!     VARIABLES AJOUTEES POUR PROGRAMMATION OBA
      INTEGER N(16), K(16)
      INTEGER J,L
      DOUBLE PRECISION COEF,SL
      DOUBLE PRECISION XSOMJ(4),YSOMJ(4)
      DOUBLE PRECISION OBST(16),SURF(16),AIRE(16)
      DOUBLE PRECISION SL1(16),SL2(16)
      DOUBLE PRECISION SL3(16),SL4(16),SL5(16)
      DOUBLE PRECISION SO1(16),SO2(16)
      DOUBLE PRECISION SO3(16),SO4(16),SO5(16)
      DOUBLE PRECISION SOM(16),XSOM(16,4),YSOM(16,4)
!
!      DOUBLE PRECISION P_DSUM
!      EXTERNAL         P_DSUM
!
!-----------------------------------------------------------------------
!
!     COMPUTES THE MASSE INTEGRALS
!
      CALL VECTOR (T1,'=','MASBAS          ',UN%ELM,1.D0,
     &             S,S,S,S,S,S,MESH,.FALSE.,S)
!
      CALL CPSTVC(UN,FUDRAG)
      CALL CPSTVC(VN,FVDRAG)
      CALL OS('X=C     ',FUDRAG,FUDRAG,FUDRAG,0.D0)
      CALL OS('X=C     ',FVDRAG,FVDRAG,FVDRAG,0.D0)
!
!-----------------------------------------------------------------------
!
!     NOMBRE TOTAL DE PONTS
!
      NPONT=2
!
!     DEFINITION D'UN POLYGONE D'APPLICATION POUR CHAQUE PONT
!     SI ON VEUT DETAILLER PAR ARCHE, DEFINIR UN POLYGONE PAR ARCHE
!
!     NOMBRE DE SOMMETS POUR CHAQUE POLYGONE
!     CHOISIR LE MEME NOMBRE DE SOMMETS, C'EST PLUS SIMPLE
!
      NSOM=4
!-----------------------------------------------------------------------
!       1.Pile rive gauche
!     EMPRISE
      XSOM(1,1) = -1782.4410D0
      XSOM(1,2) = -1771.6830D0
      XSOM(1,3) = -1772.2807D0
      XSOM(1,4) = -1783.2379D0
      YSOM(1,1) = 2197.7203D0
      YSOM(1,2) = 2193.8355D0
      YSOM(1,3) = 2192.7398D0
      YSOM(1,4) = 2196.3258D0
!     COURBE D'OBSTRUCTION
      SL1(1)=-3.3D0
      SO1(1)=0.0D0
      SL2(1)=8.0D0
      SO2(1)=13.56D0
!     NOMBRE DE NOEUDS SUR LA LARGEUR DU PONT
      K(1)=1.D0
!     NOMBRE DE NOEUDS DANS L'EMPRISE DU PONT SUR LESQUELS ON APPLIQUE
!     LA TRAINEE DUE A LA MISE EN CHARGE
      N(1)=2.D0
!
!       2.Pile rive droite
!     EMPRISE
      XSOM(2,1) = -1769.4916D0
      XSOM(2,2) = -1769.8900D0
      XSOM(2,3) = -1756.3430D0
      XSOM(2,4) = -1756.0442D0
      YSOM(2,1) = 2233.8292D0
      YSOM(2,2) = 2232.3350D0
      YSOM(2,3) = 2229.0479D0
      YSOM(2,4) = 2229.9444D0
!     COURBE D'OBSTRUCTION
      SL1(2)=-3.5D0
      SO1(2)=0.0D0
      SL2(2)=8.0D0
      SO2(2)=13.8D0
!     NOMBRE DE NOEUDS SUR LA LARGEUR DU PONT
      K(2)=1.D0
!     NOMBRE DE NOEUDS DANS L'EMPRISE DU PONT SUR LESQUELS ON APPLIQUE
!     LA TRAINEE DUE A LA MISE EN CHARGE
      N(2)=2.D0
!--------------------------------------------------------------
!
!     P1 POINTS
!
      DO J=1,NPONT
!
        AIRE(J)=0.D0
        OBST(J)=0.D0
        DO L=1,NSOM
          XSOMJ(1)=XSOM(J,1)
          XSOMJ(2)=XSOM(J,2)
          XSOMJ(3)=XSOM(J,3)
          XSOMJ(4)=XSOM(J,4)
          YSOMJ(1)=YSOM(J,1)
          YSOMJ(2)=YSOM(J,2)
          YSOMJ(3)=YSOM(J,3)
          YSOMJ(4)=YSOM(J,4)
        ENDDO
!
        DO I=1,BIEF_NBPTS(11,MESH)
!
          IF(INPOLY(X(I),Y(I),XSOMJ,YSOMJ,NSOM)) THEN
            UNORM = SQRT(UN%R(I)**2+VN%R(I)**2)
            SL=HN%R(I)+ZF%R(I)
!
!         CALCUL DE LA SURFACE TOTALE OBSTRUEE EN FONCTION DE LA COTE
!
            IF(SL.LE.SL1(J)) THEN
              SURF(J)=0.D0
            ELSEIF(SL.GT.SL1(J).AND.SL.LE.SL2(J)) THEN
              IF(SL2(J)-SL1(J).GT.1.D-6) THEN
                COEF=(SL-SL1(J))/(SL2(J)-SL1(J))
              ELSE
                COEF=0.D0
              ENDIF
              SURF(J)=SO1(J)+COEF*(SO2(J)-SO1(J))
            ELSEIF(SL.GT.SL2(J).AND.SL.LE.SL3(J)) THEN
              IF(SL3(J)-SL2(J).GT.1.D-6) THEN
                COEF=(SL-SL2(J))/(SL3(J)-SL2(J))
              ELSE
                COEF=0.D0
              ENDIF
              SURF(J)=SO2(J)+COEF*(SO3(J)-SO2(J))
            ELSEIF(SL.GT.SL3(J).AND.SL.LE.SL4(J)) THEN
              IF(SL4(J)-SL3(J).GT.1.D-6) THEN
                COEF=(SL-SL3(J))/(SL4(J)-SL3(J))
              ELSE
                COEF=0.D0
              ENDIF
              SURF(J)=SO3(J)+COEF*(SO4(J)-SO3(J))
            ELSEIF(SL.GT.SL4(J).AND.SL.LE.SL5(J)) THEN
              IF(SL5(J)-SL4(J).GT.1.D-6) THEN
                COEF=(SL-SL4(J))/(SL5(J)-SL4(J))
              ELSE
                COEF=0.D0
              ENDIF
              SURF(J)=SO4(J)+COEF*(SO5(J)-SO4(J))
            ELSE
             SURF=SO5(J)            
            ENDIF
!           
!           CALCUL DE L'OBSTRUCTION POUR CHAQUE NOEUD DU PONT
!           
            IF(HN%R(I).GT.0) THEN
              OBST(J)=1.D0/K(J)*SURF(J)/HN%R(I)
            ELSE
              OBST(J)=0.D0
            ENDIF
            FUDRAG%R(I) =  - 0.5D0 * N(J)* OBST(J) * CD * UNORM
            FVDRAG%R(I) =  - 0.5D0 * N(J)* OBST(J) * CD * UNORM
            AIRE(J) = AIRE(J) + T1%R(I)
          ENDIF
!
!
        ENDDO
!
!       IN PARALLEL THE AREA MAY BE SPLIT INTO SEVERAL SUB-DOMAINS
!       
        IF(NCSIZE.GT.0) THEN
           AIRE(J)=P_SUM(AIRE(J))
!           SURF(J)=P_SUM(SURF(J))
        ENDIF
!       
!       NOW PREPARING THE DIVISION
!       
        IF(AIRE(J).GT.1.D-6) THEN
          SOM(J) = 1.D0 / AIRE(J)
        ELSE
          IF(LNG.EQ.1) WRITE(LU,*) 'DRAGFO : AIRE DE LA ZONE NULLE'
          IF(LNG.EQ.2) WRITE(LU,*) 'DRAGFO: AREA OF ZONE EQUAL TO ZERO'
          CALL PLANTE(1)
          STOP
        ENDIF
!       
!       DIVIDING BY THE AREA
!       
        DO I=1,BIEF_NBPTS(11,MESH)
          IF(INPOLY(X(I),Y(I),XSOMJ,YSOMJ,NSOM)) THEN
!            FUDRAG%R(I)=FUDRAG%R(I)/AIRE(J)
            FUDRAG%R(I)=FUDRAG%R(I)
!            FVDRAG%R(I)=FVDRAG%R(I)/AIRE(J)
            FVDRAG%R(I)=FVDRAG%R(I)
          ENDIF
        ENDDO
!
        ! IF(ENTET) THEN
          ! WRITE(LU,*) '--------------------------------'
          ! WRITE(LU,*) 'TRAINEE U', J,'FUDRAG =',FUDRAG%R(I)
          ! WRITE(LU,*) 'TRAINEE V', J,'FVDRAG =',FVDRAG%R(I)
          ! WRITE(LU,*) 'PONT     ', J,'SURF   =',SURF(J)
          ! WRITE(LU,*) 'PONT     ', J,'AIRE   =',AIRE(J)
          ! WRITE(LU,*) '--------------------------------'
        ! ENDIF
!
      ENDDO
!
      RETURN
      END
!
