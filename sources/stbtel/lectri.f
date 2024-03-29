!                       *****************
                        SUBROUTINE LECTRI
!                       *****************
!
     & (X, Y, IKLE, NCOLOR,NGEO , NFO1)
!
!***********************************************************************
!   STBTEL V5P2
!***********************************************************************
!
!brief    Parsing the geometry file from the TRIGRID mesh generator
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!| NDP           |-->| Number of nodes per element
!| X,Y           |<->| Coordinates
!| NCOLOR        |<--| Color of the boudary nodes
!| NPOIN         |<--| Total number of nodes in the mesh
!| NGEO          |-->| Index refering to the mesh generator file
!| NFO1          |-->| Index refering to the triangle trigrid file
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
      USE DECLARATIONS_SPECIAL
      USE DECLARATIONS_STBTEL, ONLY: NELEM,NPOIN,NELMAX
      IMPLICIT NONE
!
      INTEGER, INTENT(IN) :: NGEO, NFO1
      INTEGER, INTENT(INOUT) :: IKLE(NELMAX,4)
      INTEGER, INTENT(INOUT) :: NCOLOR(*)
      DOUBLE PRECISION, INTENT(INOUT) :: X(*), Y(*)
!
      INTEGER ITYPND,NUMNOD,I,J
!
      REWIND (NGEO)
      REWIND (NFO1)
      READ (NGEO,'(//)')
      DO I=1,NPOIN
        READ (NGEO,*,ERR=8000,END=9000) NUMNOD,X(I),Y(I),ITYPND
        IF (ITYPND.EQ.1) NCOLOR(I) = 11
        IF (ITYPND.EQ.2) NCOLOR(I) = 4
        IF (ITYPND.EQ.3) NCOLOR(I) = 5
        IF (ITYPND.EQ.4) NCOLOR(I) = 7
        IF (ITYPND.EQ.5) NCOLOR(I) = 8
        IF (ITYPND.EQ.6) NCOLOR(I) = 9
        IF (ITYPND.EQ.7) NCOLOR(I) = 1
        IF (ITYPND.EQ.8) NCOLOR(I) = 12
        IF (ITYPND.EQ.9) NCOLOR(I) = 15
        IF (ITYPND.EQ.10) NCOLOR(I) = 2
        IF (ITYPND.EQ.11) NCOLOR(I) = 3
        IF (ITYPND.EQ.12) NCOLOR(I) = 14
        IF (ITYPND.EQ.13) NCOLOR(I) = 13
      ENDDO
!
      DO I=1,NELEM
        READ (NFO1, * , ERR=8010, END=9010) (IKLE(I,J),J=1,3)
      ENDDO
      RETURN
 8000 CONTINUE
      WRITE (LU,4001)
 4001 FORMAT (//,1X,'****************************'
     &        ,/,1X,'SUBROUTINE LECTRI :'
     &        ,/,1X,'ERROR READING TRIGRID FILE.'
     &        ,/,1X,'****************************')
      CALL PLANTE(1)
      STOP
 9000 CONTINUE
      WRITE (LU,4011)
 4011 FORMAT (//,1X,'***************************************'
     &        ,/,1X,'SUBROUTINE LECTRI : UNEXPECTED END OF'
     &        ,/,1X,'TRIGRID FILE ENCOUNTERED'
     &        ,/,1X,'***************************************')
      CALL PLANTE(1)
      STOP
 8010 CONTINUE
      WRITE (LU,4021)
 4021 FORMAT (//,1X,'***************************************'
     &        ,/,1X,'SUBROUTINE LECTRI : ERROR READING'
     &        ,/,1X,'TRIGRID TRIANGLE FILE'
     &        ,/,1X,'***************************************')
      CALL PLANTE(1)
      STOP
 9010 CONTINUE
      WRITE (LU,4031)
 4031 FORMAT (//,1X,'***************************************'
     &        ,/,1X,'SUBROUTINE LECTRI : END OF'
     &        ,/,1X,'TRIGRID TRIANGLE FILE ENCOUNTERED'
     &        ,/,1X,'***************************************')
      CALL PLANTE(1)
      STOP
      END
