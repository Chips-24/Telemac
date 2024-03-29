!                       *****************
                        SUBROUTINE EXTRAC
!                       *****************
!
     &(X,Y,SOM,IKLE,INDIC,NELEM,NELMAX,NPOIN,NSOM,PROJEC)
!
!***********************************************************************
! PSTBTEL V5P2
!***********************************************************************
!
!brief    Preprocessing information before call to FMTSEL
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!| X,Y      |<--| Coordinates
!| IKLE     |-->| Connectivity matrix
!| MESH     |<--| Mesh
!| NDP      |-->| Number of nodes per element
!| NPOIN    |<--| Total number of nodes in the mesh
!| NELEM    |<--| Total number of element in the mesh
!| NPMAX    |-->| Actual size of the node-based x and y arrays
!|          |   | (NPMAX = NPOIN + 0.1*NELEM)
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
      USE DECLARATIONS_SPECIAL
      IMPLICIT NONE
!
      INTEGER, INTENT(INOUT) :: NELEM
      INTEGER, INTENT(IN) :: NELMAX,NPOIN,NSOM
      INTEGER, INTENT(INOUT) :: IKLE(NELMAX,3),INDIC(NPOIN)
      DOUBLE PRECISION, INTENT(INOUT) :: X(NPOIN),Y(NPOIN)
      DOUBLE PRECISION, INTENT(IN) :: SOM(10,2)
      LOGICAL, INTENT(IN) :: PROJEC
!
      LOGICAL FLAG,F1,F2,F3
!
      INTEGER IELEM,IPOIN,ISOM,IDP,I1,I2,I3
      DOUBLE PRECISION DX,DY,A1,A2,A3
!
!=======================================================================
!     LOOP OVER ALL CROSS-SECTIONS
!=======================================================================
!
      DO ISOM = 1,NSOM
!
        DX = SOM(ISOM+1,1) - SOM(ISOM,1)
        DY = SOM(ISOM+1,2) - SOM(ISOM,2)
!
!=======================================================================
!      FOR A CROSS-SECTION SEARCH FOR
!         EXT. NODES(=0) , INT. NODES(=1) , BOUNDARY NODES(=2)
!=======================================================================
!
        DO IPOIN = 1,NPOIN
          INDIC(IPOIN) = 0
          IF (DX*(Y(IPOIN)-SOM(ISOM,2)).GE.DY*(X(IPOIN)-SOM(ISOM,1)))
     &        INDIC(IPOIN) = 1
        ENDDO
!
        IELEM = 1
20      CONTINUE
        I1 = INDIC(IKLE(IELEM,1))
        I2 = INDIC(IKLE(IELEM,2))
        I3 = INDIC(IKLE(IELEM,3))
        IF (I1.EQ.0.OR.I2.EQ.0.OR.I3.EQ.0) THEN
          IF (I1.EQ.1) INDIC(IKLE(IELEM,1)) = 2
          IF (I2.EQ.1) INDIC(IKLE(IELEM,2)) = 2
          IF (I3.EQ.1) INDIC(IKLE(IELEM,3)) = 2
          IKLE(IELEM,1) = IKLE(NELEM,1)
          IKLE(IELEM,2) = IKLE(NELEM,2)
          IKLE(IELEM,3) = IKLE(NELEM,3)
          NELEM = NELEM - 1
        ELSE
          IELEM = IELEM + 1
        ENDIF
        IF (IELEM.NE.NELEM+1) GOTO 20
!
!=======================================================================
!      FOR A CROSS-SECTIONS REMOVE THE DEGENERATED ELEMENTS
!=======================================================================
!
30      CONTINUE
        IELEM = 1
        FLAG = .FALSE.
35      CONTINUE
        I1 = IKLE(IELEM,1)
        I2 = IKLE(IELEM,2)
        I3 = IKLE(IELEM,3)
        F1 = INDIC(I1).EQ.2
        F2 = INDIC(I2).EQ.2
        F3 = INDIC(I3).EQ.2
        IF (F1.AND.F2.AND.F3) THEN
          IKLE(IELEM,1) = IKLE(NELEM,1)
          IKLE(IELEM,2) = IKLE(NELEM,2)
          IKLE(IELEM,3) = IKLE(NELEM,3)
          NELEM = NELEM - 1
        ELSE
          IF (F1.AND.F2) THEN
            IF (DX*(X(I2)-X(I1))+DY*(Y(I2)-Y(I1)).LE.0.D0) THEN
              FLAG = .TRUE.
              INDIC(I3) = 2
            ENDIF
          ENDIF
          IF (F2.AND.F3) THEN
            IF (DX*(X(I3)-X(I2))+DY*(Y(I3)-Y(I2)).LE.0.D0) THEN
              FLAG = .TRUE.
              INDIC(I1) = 2
            ENDIF
          ENDIF
          IF (F3.AND.F1) THEN
            IF (DX*(X(I1)-X(I3))+DY*(Y(I1)-Y(I3)).LE.0.D0) THEN
              FLAG = .TRUE.
              INDIC(I2) = 2
            ENDIF
          ENDIF
          IELEM = IELEM + 1
        ENDIF
        IF (IELEM.NE.NELEM+1) GOTO 35
        IF (FLAG) GOTO 30
!
!=======================================================================
!       FOR A CROSS-SECTION, PROJECT THE NEW BOUNDARY NODES
!=======================================================================
!
        IF (PROJEC) THEN
          A1 = 1.D0 / (DX*DX + DY*DY)
          A2 = A1 * (SOM(ISOM,1)*SOM(ISOM+1,2) -
     &               SOM(ISOM,2)*SOM(ISOM+1,1) )
          DO IDP = 1,3
            DO IELEM = 1,NELEM
              IPOIN = IKLE(IELEM,IDP)
              IF (INDIC(IPOIN).EQ.2) THEN
                A3 = A1*(X(IPOIN)*DX+Y(IPOIN)*DY)
                X(IPOIN) = DX*A3 + DY*A2
                Y(IPOIN) = DY*A3 - DX*A2
              ENDIF
            ENDDO
          ENDDO
        ENDIF
!
      ENDDO !ISOM
!
!=======================================================================
!
      RETURN
      END
