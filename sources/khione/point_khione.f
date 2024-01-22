!                   ***********************
                    SUBROUTINE POINT_KHIONE
!                   ***********************
!
     &( MESH,IELMX,MESH3D,IELM3 )
!
!***********************************************************************
! KHIONE   V7P3
!***********************************************************************
!
!brief    Memory allocation of structures, aliases, blocks...
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
      USE BIEF
      USE DECLARATIONS_SPECIAL
      USE DECLARATIONS_KHIONE
      USE INTERFACE_KHIONE, EX_POINT_KHIONE => POINT_KHIONE
!      USE DECLARATIONS_WAQTEL, ONLY: TDEW,VISBI
!
      IMPLICIT NONE
!
!+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
!
      INTEGER,         INTENT(IN) :: IELMX
      TYPE(BIEF_MESH), INTENT(IN) :: MESH
      TYPE(BIEF_MESH), INTENT(INOUT),OPTIONAL :: MESH3D
      INTEGER,         INTENT(IN   ),OPTIONAL :: IELM3
!
!+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
!
      INTEGER NTR,I,J
      INTEGER CFG(2),IELM0,ILAST
!
!+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
      CFG(1) = 3
      CFG(2) = 1
      IELM0 = 10*(IELMX/10)
!
!     THERMAL BUDGET
      CALL BIEF_ALLVEC(1,PHCL,  'PHCL  ',IELMX,1,1,MESH)
      CALL BIEF_ALLVEC(1,PHRI,  'PHRI  ',IELMX,1,1,MESH)
      CALL BIEF_ALLVEC(1,PHPS,  'PHPS  ',IELMX,1,1,MESH)
      CALL BIEF_ALLVEC(1,PHIB,  'PHIB  ',IELMX,1,1,MESH)
      CALL BIEF_ALLVEC(1,PHIE,  'PHIE  ',IELMX,1,1,MESH)
      CALL BIEF_ALLVEC(1,PHIH,  'PHIH  ',IELMX,1,1,MESH)
      CALL BIEF_ALLVEC(1,PHIP,  'PHIP  ',IELMX,1,1,MESH)
      CALL BIEF_ALLVEC(1,PHIW,  'PHIW  ',IELMX,1,1,MESH)
      CALL BIEF_ALLVEC(1,SUMPH, 'SUMPH ',IELMX,1,1,MESH)
      CALL BIEF_ALLVEC(1,HWI,   'HWI   ',IELMX,1,1,MESH)
      CALL BIEF_ALLVEC(1,SUMPH_ICE, 'SUMPH_ICE ',IELMX,1,1,MESH)
!
!     FRAZIL ICE
      IF(PRESENT(MESH3D)) THEN
        CALL BIEF_ALLVEC(1,TMELT, 'TMELT ' ,IELM3,1,1,MESH3D)
        CALL BIEF_ALLVEC(1,KGM,   'KGM   ' ,IELM3,1,1,MESH3D)
        CALL BIEF_ALLVEC(1,EPSGM, 'EPSGM ' ,IELM3,1,1,MESH3D)
        CALL BIEF_ALLVEC(1,ALPGM, 'ALPGM ' ,IELM3,1,1,MESH3D)
      ELSE
        CALL BIEF_ALLVEC(1,TMELT, 'TMELT ' ,IELMX,1,1,MESH)
        CALL BIEF_ALLVEC(1,KGM,   'KGM   ' ,IELMX,1,1,MESH)
        CALL BIEF_ALLVEC(1,EPSGM, 'EPSGM ' ,IELMX,1,1,MESH)
        CALL BIEF_ALLVEC(1,ALPGM, 'ALPGM ' ,IELMX,1,1,MESH)
      ENDIF
!
      IF(THERMAL_BUDGET) THEN
        CALL BIEF_ALLVEC(1,DYNCOVC ,  'DYNCOC' ,IELMX,1,1,MESH)
        CALL BIEF_ALLVEC(1,DYNCOVT ,  'DYNCOT' ,IELMX,1,1,MESH)
        CALL BIEF_ALLVEC(1,SUM_SRCP,  'SRCPSM' ,IELMX,1,1,MESH)
        CALL BIEF_ALLVEC(1,NTOT,  'NTOT  ' ,IELMX,1,1,MESH)
        CALL BIEF_ALLVEC(1,CTOT,  'CTOT  ' ,IELMX,1,1,MESH)
        CALL ALLBLO(FRZL      ,'FRAZIL')
        CALL ALLBLO(NBP       ,'NBPART')
        CALL BIEF_ALLVEC_IN_BLOCK(FRZL,NC_FRA,1,'F     ',
     &                            IELMX,1,1,MESH)
        CALL BIEF_ALLVEC_IN_BLOCK(NBP,NC_FRA,1,'NBFRZL',
     &                            IELMX,1,1,MESH)
        CALL BIEF_ALLVEC(1,TEMP,  'TEMP  ' ,IELMX,1,1,MESH)
        CALL BIEF_ALLVEC(1,SAL ,  'SAL   ' ,IELMX,1,1,MESH)
        CALL BIEF_ALLVEC(1,NTOTS,  'NTOTS ' ,IELMX,1,1,MESH)
        CALL BIEF_ALLVEC(1,CTOTS,  'CTOTS ' ,IELMX,1,1,MESH)
        CALL ALLBLO(FRZLS      ,'FRAZIS')
        CALL ALLBLO(NBPS       ,'NBPARS')
        CALL BIEF_ALLVEC_IN_BLOCK(FRZLS,NC_FRA,1,'FS    ',
     &                            IELMX,1,1,MESH)
        CALL BIEF_ALLVEC_IN_BLOCK(NBPS,NC_FRA,1,'NBFRZS',
     &                            IELMX,1,1,MESH)
        CALL BIEF_ALLVEC(1,TEMPS,  'TEMPS ' ,IELMX,1,1,MESH)
        CALL BIEF_ALLVEC(1,SALS ,  'SALS  ' ,IELMX,1,1,MESH)
        IF(PRESENT(MESH3D)) THEN
          CALL BIEF_ALLVEC(1,NTOT3,  'NTOT3 ' ,IELM3,1,1,MESH3D)
          CALL BIEF_ALLVEC(1,CTOT3,  'CTOT3 ' ,IELM3,1,1,MESH3D)
          CALL BIEF_ALLVEC(1,ELEZ ,  'ELEZ  ' ,IELM3,1,1,MESH3D)
          CALL ALLBLO(FRZL3      ,'FRAZL3')
          CALL ALLBLO(NBP3       ,'NBPRT3')
          CALL BIEF_ALLVEC_IN_BLOCK(FRZL3,NC_FRA,1,'F3    ',
     &                              IELM3,1,1,MESH3D)
          CALL BIEF_ALLVEC_IN_BLOCK(NBP3,NC_FRA,1,'NBFRL3',
     &                              IELM3,1,1,MESH3D)
          CALL BIEF_ALLVEC(1,TEMP3,  'TEMP3 ' ,IELM3,1,1,MESH3D)
          CALL BIEF_ALLVEC(1,SAL3 ,  'SAL3  ' ,IELM3,1,1,MESH3D)
        ENDIF
      ENDIF

!
!     ICE CONCENTRATION AS COMPUTED FROM SURFACE ICE PARTICLES
      CALL BIEF_ALLVEC(1,ANFEM , 'COVFC ',IELMX,1,1,MESH)
!
!     ICE COVER DEFINITION - REQUIRED FOR A RESTART
      CALL BIEF_ALLVEC(1,THETA0, 'COVTH0',IELMX,1,1,MESH)
      CALL BIEF_ALLVEC(1,THETA1, 'COVTH1',IELMX,1,1,MESH)
      CALL BIEF_ALLVEC(1,BETA1 , 'COVBT1',IELMX,1,1,MESH)
      CALL BIEF_ALLVEC(1,VBB   , 'COVVBB',IELMX,1,1,MESH)
      CALL BIEF_ALLVEC(1,THIFEM, 'COVTHT',IELMX,1,1,MESH)
      CALL BIEF_ALLVEC(1,THIFEMS,'COVTHS',IELMX,1,1,MESH)
      CALL BIEF_ALLVEC(1,ICESTR, 'ICESTR',IELMX,1,1,MESH)
      CALL BIEF_ALLVEC(1,VZ    , 'VZ    ',IELMX,1,1,MESH)
      CALL BIEF_ALLVEC(1,TCR   , 'TCR   ',IELMX,1,1,MESH)
      CALL BIEF_ALLVEC(1,DCOVX , 'DCOVX ',IELMX,1,1,MESH)
      CALL BIEF_ALLVEC(1,DCOVY , 'DCOVY ',IELMX,1,1,MESH)
!
!     ICE CHARACTERISATION
      CALL BIEF_ALLVEC(3,ICETYPE, 'ITYPE ',IELMX,1,1,MESH)
      CALL BIEF_ALLVEC(3,ICETYPEP,'ITYPEP',IELMX,1,1,MESH)
      CALL BIEF_ALLVEC(3,ICELOC , 'ILOC  ',IELMX,1,1,MESH)
      CALL BIEF_ALLVEC(3,IT1,     'IT1   ',IELMX,1,1,MESH)
      CALL BIEF_ALLVEC(3,IT2,     'IT2   ',IELMX,1,1,MESH)
!
!     CLOGGING SECTION
!
      CALL ALLBLO(MSKSEC,'MSKSEC')
      IF(NSECLOG.GT.0) THEN
        CALL BIEF_ALLVEC_IN_BLOCK(MSKSEC,NSECLOG,1,'MSKS  ',
     &                            IELM0,1,1,MESH)
      ENDIF
!
!-----------------------------------------------------------------------
!
!     WORKING ARRAYS
!
      NTR = 6
!
!     ALLOCATES NTR WORKING ARRAYS
!     TB WILL CONTAIN ARRAYS T1,T2,...
!
      CALL ALLBLO(TB ,'TB    ')
      CALL BIEF_ALLVEC_IN_BLOCK(TB,NTR,1,'TB    ',IELMX,1,2,MESH)
      IF(PRESENT(MESH3D)) THEN
        CALL ALLBLO(TB3 ,'TB3   ')
        CALL BIEF_ALLVEC_IN_BLOCK(TB3,NTR,1,'TB    ',IELM3,1,2,MESH3D)
      ENDIF
!
!  BM1 AND BM2:
!
      CALL BIEF_ALLMAT(BM1,'BM1   ',IELMX,IELMX,CFG,'Q','Q',MESH)
      CALL BIEF_ALLMAT(BM2,'BM2   ',IELMX,IELMX,CFG,'Q','Q',MESH)
      CALL BIEF_ALLVEC(1,CV1,'CV1   ',IELMX,1,2,MESH)
      CALL BIEF_ALLVEC(1,CV2,'CV2   ',IELMX,1,2,MESH)
      CALL BIEF_ALLVEC(1,CV3,'CV3   ',IELMX,1,2,MESH)
      CALL BIEF_ALLVEC(1,CV4,'CV4   ',IELMX,1,2,MESH)
!
!     ALIAS FOR THE WORKING ARRAYS OF THE BLOCK: TB
!
!     FIRST 2 REQUIRED FOR THE CALL TO WRITE_MESH WITHIN OUTPUT_KHIONE
      T1 =>TB%ADR( 1)%P
      T2 =>TB%ADR( 2)%P
      IF(PRESENT(MESH3D)) THEN
        T1_3 =>TB3%ADR(1)%P
        T2_3 =>TB3%ADR(2)%P
      ENDIF
!
!     THESE 4 ARE USED TO COMPUTE VARIOUS ICE COVER ELEVATION
      T3 =>TB%ADR( 3)%P
      T4 =>TB%ADR( 4)%P
      T5 =>TB%ADR( 5)%P
      T6 =>TB%ADR( 6)%P
!
!-----------------------------------------------------------------------
!
!     ALLOCATE THE BLOCK WHICH CONNECTS A VARIABLE NAME TO ITS ARRAY
!     FOR GRAPHICAL OUTPUT
!
      CALL ALLBLO(VARSOR ,'VARSOR')
!
!     THERMAL BUDGET
!
! 01  SOLAR RADIATION UNDER CLEAR SKY
      CALL ADDBLO(VARSOR,PHCL)
! 02  SOLAR RADIATION UNDER CLOUDY SKY
      CALL ADDBLO(VARSOR,PHRI)
! 03  NET SOLAR RADIATION AFTER REFLECTION
      CALL ADDBLO(VARSOR,PHPS)
! 04  EFFECTIVE BACK RADIATION
      CALL ADDBLO(VARSOR,PHIB)
! 05  EVAPORATION HEAT FLUX
      CALL ADDBLO(VARSOR,PHIE)
! 06  CONDUCTIVITY HEAT FLUX
      CALL ADDBLO(VARSOR,PHIH)
! 07  PRECIPITATION HEAT FLUX
      CALL ADDBLO(VARSOR,PHIP)
!
!     ICE SHEET COVER
!
! 08  PROBABILITY OF FRAZIL DEPOSITION - OPEN WATER
      CALL ADDBLO(VARSOR,THETA0)
! 09  PROBABILITY OF FRAZIL DEPOSITION - ICE COVER
      CALL ADDBLO(VARSOR,THETA1)
! 10  RATE OF REENTRAINMENT OF SURFACE PER UNIT AREA
      CALL ADDBLO(VARSOR,BETA1)
! 11  SETTLING VELOCITY OF FRAZIL ICE IN THE TURBULENT FLOW
      CALL ADDBLO(VARSOR,VBB)
! 12  ICE CONCENTRATION AS COMPUTED FROM SURFACE ICE PARTICLES
      CALL ADDBLO(VARSOR,ANFEM)
! 13  SOLID ICE THICKNESS
      CALL ADDBLO(VARSOR,THIFEMS)
! 14  FRAZIL ICE THICKNESS EX:THIFEMF -> DEPRECATED
      CALL ADDBLO(VARSOR,T1)
! 15  UNDERCOVER ICE THICKNESS EX:HUN -> DEPRECATED
      CALL ADDBLO(VARSOR,T2)
! 16  COMPUTED ELEVATIONS WITHIN PRERES_KHIONE (WATER AND ICE COVER)
!     EQUIVALENT SURFACE ELEVATION
      CALL ADDBLO(VARSOR,T3)
! 17  TOP OF THE ICE COVER
      CALL ADDBLO(VARSOR,T4)
! 18  BOTTOM OF THE ICE COVER (ALSO THE FREE SURFACE))
      CALL ADDBLO(VARSOR,T5)
! 19  TOTAL ICE THICKNESS
      CALL ADDBLO(VARSOR,THIFEM)
! 20  ICE CHARACTERISATION
      CALL ADDBLO(VARSOR,ICETYPE)
! 21  NUMBER OF PARTICLES
      CALL ADDBLO(VARSOR,NTOT)
! 22  FRAZIL TOTAL CONCENTRATION
      CALL ADDBLO(VARSOR,CTOT)
      IF(PRESENT(MESH3D)) THEN
! 23    NUMBER OF PARTICLES AT SURFACE
        CALL ADDBLO(VARSOR,NTOTS)
! 24    FRAZIL TOTAL CONCENTRATION AT SURFACE
        CALL ADDBLO(VARSOR,CTOTS)
      ELSE
! 23    NUMBER OF PARTICLES AT SURFACE
        CALL ADDBLO(VARSOR,NTOT)
! 24    FRAZIL TOTAL CONCENTRATION AT SURFACE
        CALL ADDBLO(VARSOR,CTOT)
      ENDIF
!
      IF(PRESENT(MESH3D)) THEN
        CALL ALLBLO(VARSO3 ,'VARSO3')
! 1  NUMBER OF PARTICLES 3D
        CALL ADDBLO(VARSO3,NTOT3)
! 2  FRAZIL TOTAL CONCENTRATION
        CALL ADDBLO(VARSO3,CTOT3)
! 3  FRAZIL TOTAL CONCENTRATION
        CALL ADDBLO(VARSO3,ELEZ)
      ENDIF

!
      ILAST = 24
      IF(ILAST.NE.VARSOR%N) THEN
        WRITE(LU,*) 'MESSAGE TO DEVELOPPERS:'
        WRITE(LU,*) 'CHANGE ILAST INTO ',VARSOR%N
        WRITE(LU,*) 'IN POINT_KHIONE'
        CALL PLANTE(1)
        STOP
      ENDIF
!
!     TELEMAC-2D TRACER VALUES
!
      IF(THERMAL_BUDGET) THEN
        IF(PRESENT(MESH3D)) THEN
          DO I=1,NC_FRA
            CALL ADDBLO(VARSO3,FRZL3%ADR(I)%P)
          ENDDO
          DO I=1,NC_FRA
            CALL ADDBLO(VARSO3,NBP3%ADR(I)%P)
          ENDDO
          CALL ADDBLO(VARSO3,TEMP3)
          IF(SALINITY) THEN
            CALL ADDBLO(VARSO3,SAL3)
          ENDIF
        ENDIF
        DO I=1,NC_FRA
          CALL ADDBLO(VARSOR,FRZL%ADR(I)%P)
        ENDDO
        DO I=1,NC_FRA
          CALL ADDBLO(VARSOR,NBP%ADR(I)%P)
        ENDDO
        DO I=1,NC_FRA
          CALL ADDBLO(VARSOR,FRZLS%ADR(I)%P)
        ENDDO
        DO I=1,NC_FRA
          CALL ADDBLO(VARSOR,NBPS%ADR(I)%P)
        ENDDO
        CALL ADDBLO(VARSOR,TEMP)
        CALL ADDBLO(VARSOR,TEMPS)
        IF(SALINITY) THEN
          CALL ADDBLO(VARSOR,SAL)
          CALL ADDBLO(VARSOR,SALS)
        ENDIF
        IF(DYN_ICOVER) THEN
          CALL ADDBLO(VARSOR,DYNCOVC)
          CALL ADDBLO(VARSOR,DYNCOVT)
        ENDIF
      ENDIF
!
!-----------------------------------------------------------------------
!
!     DIFFERENTIATED VARIABLES
!
      IF( NADVAR.GT.0 ) THEN
        J = VARSOR%N + 1
        CALL ALLBLO(ADVAR ,'ADVAR ')
        CALL BIEF_ALLVEC_IN_BLOCK(ADVAR,NADVAR,1,'AD    ',IELMX,
     &                            1,2,MESH)
        DO I = 1,NADVAR
          CALL AD_GET_KHIONE(I,ADVAR%ADR(I)%P)
!
          IF( J.GT.MAXVAR ) THEN
            IF(LNG.EQ.1) THEN
              WRITE(LU,*) 'POINT : TROP DE DERIVEES A IMPRIMER'
            ENDIF
            IF(LNG.EQ.2) THEN
              WRITE(LU,*) 'POINT : TOO MANY DERIVATIVES TO PRINT OUT'
            ENDIF
            CALL PLANTE(1)
            STOP
          ENDIF
!
          IF( SORLEO(J).OR.SORIMP(J) ) THEN
            CALL ADDBLO(VARSOR,ADVAR%ADR(I)%P)
            J = J + 1
          ENDIF
!
        ENDDO
      ENDIF
!
!***********************************************************************
!
!-----------------------------------------------------------------------
!
      RETURN
      END
