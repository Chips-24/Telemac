!                   ************************
                    SUBROUTINE DEALL_TOMAWAC
!                   ************************
!
!
!***********************************************************************
! TOMAWAC
!***********************************************************************
!
!brief    DEALLOCATES MEMORY.
!
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
      USE BIEF
      USE DECLARATIONS_TELEMAC
      USE OUT_HISTORY, ONLY : OUTHIST_END
      USE DECLARATIONS_TOMAWAC
      USE SURFACE_ROLLER, ONLY : END_SURF_ROL
!
      USE DECLARATIONS_SPECIAL
      IMPLICIT NONE
!
!
!
!***********************************************************************
!
      WRITE(LU,40)
40    FORMAT(1X,///,21X,'*********************************',/,
     &21X,              '*       MEMORY CLEANUP          *',/,
     &21X,              '*********************************',/)
!
!-----------------------------------------------------------------------
!
!
!-----------------------------------------------------------------------
!
!     DEALLOCATES THE 2D MESH STRUCTURE
!
      CALL DEALMESH(MESH)
!
!     DEALLOCATES THE 3D MESH STRUCTURE
!
      CALL DEALMESH(MESH3D)
!
      CALL BIEF_DEALLOBJ(IKLE_EXT)
!
!-----------------------------------------------------------------------
!
!     VARIABLES 4D TO ADVECT
!
      CALL BIEF_DEALLOBJ(SF)
!
!     COEFFICIENT B FOR ADVECTION
!
      CALL BIEF_DEALLOBJ(SB)
!
!     ARRAY OF DISCRETISED FREQUENCIES, AND OF DELTA F
!
      CALL BIEF_DEALLOBJ(SFR)
      CALL BIEF_DEALLOBJ(SDFR)
!
!     ARRAY OF VARIANCE DENSITY FREQUENCY SPECTRUM
!
      CALL BIEF_DEALLOBJ(SSPEC)
!
!     ARRAY OF DIRECTIONAL SPREADING FUNCTION VALUES
!
      CALL BIEF_DEALLOBJ(SFRA)
!
!     "PHYSICAL" VARIABLES OF SIZE NPOIN3
!
      CALL BIEF_DEALLOBJ(SXK)
      CALL BIEF_DEALLOBJ(SCG)
!
!     FOR SOURCE TERMS (BUT ALWAYS ALLOCATED, USED AS WORK ARRAYS)
!
      CALL BIEF_DEALLOBJ(STSDER)
      CALL BIEF_DEALLOBJ(STSTOT)
      CALL BIEF_DEALLOBJ(SDF_LIM)
!
!     FOR THE BOUNDARY CONDITIONS
!
      CALL BIEF_DEALLOBJ(SFBOR)
!
!     ARRAYS FOR NON-LINEAR INTERACTIONS
!
      CALL BIEF_DEALLOBJ(SCOEF)
!
!     ADVECTION FIELD
!
!
      CALL BIEF_DEALLOBJ(SSHP1)
      CALL BIEF_DEALLOBJ(SSHZ)
      CALL BIEF_DEALLOBJ(SSHF)
!
      CALL BIEF_DEALLOBJ(SCT)
      CALL BIEF_DEALLOBJ(SCF)
!
! ARRAYS OF SIZE NPOIN2
!
      CALL BIEF_DEALLOBJ(SZF)
      CALL BIEF_DEALLOBJ(SDEPTH)
!
      CALL BIEF_DEALLOBJ(SBETBR)
      CALL BIEF_DEALLOBJ(SBETWC)
!
      CALL BIEF_DEALLOBJ(SDZX)
      CALL BIEF_DEALLOBJ(SDZY)
!
!     NAMECODE IS IN DECLARATIONS_TELEMAC AND IS MONITORED BY
!     SUBROUTINE CONFIG_CODE
!
      CALL BIEF_DEALLOBJ(SDZHDT)
!
      CALL BIEF_DEALLOBJ(SUC)
      CALL BIEF_DEALLOBJ(SVC)
      CALL BIEF_DEALLOBJ(SDUX)
      CALL BIEF_DEALLOBJ(SDUY)
      CALL BIEF_DEALLOBJ(SDVX)
      CALL BIEF_DEALLOBJ(SDVY)
      CALL BIEF_DEALLOBJ(SVC1)
      CALL BIEF_DEALLOBJ(SUC1)
      CALL BIEF_DEALLOBJ(SVC2)
      CALL BIEF_DEALLOBJ(SUC2)
      CALL BIEF_DEALLOBJ(SZM1)
      CALL BIEF_DEALLOBJ(SZM2)
!
      CALL BIEF_DEALLOBJ(SUV)
      CALL BIEF_DEALLOBJ(SVV)
      CALL BIEF_DEALLOBJ(SVV1)
      CALL BIEF_DEALLOBJ(SUV1)
      CALL BIEF_DEALLOBJ(SVV2)
      CALL BIEF_DEALLOBJ(SUV2)
!
      CALL BIEF_DEALLOBJ(SCOSF)
      CALL BIEF_DEALLOBJ(STGF)
!
!     ARRAYS WITH THE RELATIVE POSITIONS OF THE DIRECTION PLANES,
!     AND WITH THE COS AND SIN TETA
      CALL BIEF_DEALLOBJ(STETA)
      CALL BIEF_DEALLOBJ(SCOSTE)
      CALL BIEF_DEALLOBJ(SSINTE)
!
!     POINTERS FOR WORKING ARRAYS (BY POINTS AND ELEMENTS)
!
      CALL BIEF_DEALLOBJ(ST0)
      CALL BIEF_DEALLOBJ(ST1)
      CALL BIEF_DEALLOBJ(ST2)
      CALL BIEF_DEALLOBJ(ST3)
      CALL BIEF_DEALLOBJ(ST4)
!
!     POINTERS FOR MATRICES, AM1 SYMMETRICAL MATRIX
      CALL BIEF_DEALLOBJ(AM1)
!
!     VARIOUS WORK ARRAYS
!
      CALL BIEF_DEALLOBJ(STRA35)
      CALL BIEF_DEALLOBJ(STRA36)
      CALL BIEF_DEALLOBJ(STRA37)
      CALL BIEF_DEALLOBJ(STRA38)
      CALL BIEF_DEALLOBJ(STRA39)
      CALL BIEF_DEALLOBJ(STRA40)
      CALL BIEF_DEALLOBJ(STRA41)
      IF(INCLUS(COUPLING,'TOMAWACT3D')) THEN
        CALL BIEF_DEALLOBJ(STRA42)
      ENDIF
      CALL BIEF_DEALLOBJ(STAUWA)
      CALL BIEF_DEALLOBJ(SUSOLD)
      CALL BIEF_DEALLOBJ(SDMOY)
      CALL BIEF_DEALLOBJ(SSPREA)
      CALL BIEF_DEALLOBJ(SFMOY)
      CALL BIEF_DEALLOBJ(SVARIA)
      CALL BIEF_DEALLOBJ(SXKMOY)
      CALL BIEF_DEALLOBJ(SFRM01)
      CALL BIEF_DEALLOBJ(SFRM02)
     
!
!     VARIOUS WORK ARRAYS
!
      CALL BIEF_DEALLOBJ(STRA01)
!
      CALL BIEF_DEALLOBJ(STOLD)
      CALL BIEF_DEALLOBJ(STNEW)
!
      CALL BIEF_DEALLOBJ(STWOLD)
      CALL BIEF_DEALLOBJ(SZ0OLD)
!
!     USER DEDICATED ARRAY (2-DIMENSIONAL * NPRIV)
!
      CALL BIEF_DEALLOBJ(SPRIVE)
!
!     ADDED FOR CHARACTERISTICS
!
      CALL BIEF_DEALLOBJ(TB)
!
!     ONLY FOR OUTPUTS, ALLOCATED WITHOUT MEMORY, THE MEMORY WILL
!     BE TAKEN IN ARRAYS OF BLOCK TB
!
      ALLOCATE(FORCEX%R(1))
      CALL BIEF_DEALLOBJ(FORCEX)
      ALLOCATE(FORCEY%R(1))
      CALL BIEF_DEALLOBJ(FORCEY)
      ALLOCATE(CONTXX%R(1))
      CALL BIEF_DEALLOBJ(CONTXX)
      ALLOCATE(CONTXY%R(1))
      CALL BIEF_DEALLOBJ(CONTXY)
      ALLOCATE(CONTYY%R(1))
      CALL BIEF_DEALLOBJ(CONTYY)
      ALLOCATE(PFREA5%R(1))
      CALL BIEF_DEALLOBJ(PFREA5)
      ALLOCATE(PFREA8%R(1))
      CALL BIEF_DEALLOBJ(PFREA8)
      ALLOCATE(SCDRA2%R(1))
      CALL BIEF_DEALLOBJ(SCDRA2)
      ALLOCATE(SVIFON%R(1))
      CALL BIEF_DEALLOBJ(SVIFON)
      ALLOCATE(SPOWER%R(1))
      CALL BIEF_DEALLOBJ(SPOWER)
      ALLOCATE(SPTMOY%R(1))
      CALL BIEF_DEALLOBJ(SPTMOY)
      ALLOCATE(SPTM01%R(1))
      CALL BIEF_DEALLOBJ(SPTM01)
      ALLOCATE(SPTM02%R(1))
      CALL BIEF_DEALLOBJ(SPTM02)
      ALLOCATE(SPPTPD%R(1))
      CALL BIEF_DEALLOBJ(SPPTPD)
      ALLOCATE(PPREA5%R(1))
      CALL BIEF_DEALLOBJ(PPREA5)
      ALLOCATE(PPREA8%R(1))
      CALL BIEF_DEALLOBJ(PPREA8)
!
!     BLOCK FOR GRAPHICAL OUTPUTS: VARSOR
!
      CALL BIEF_DEALLOBJ(VARSOR)
!
!.....BLOCK FOR VALIDATION
!
      IF(VALID) THEN
        CALL BIEF_DEALLOBJ(BST1)
      ENDIF
!
!V6P2 Diffraction : allocation of bief objects if diffraction
!                   is taken into account
      CALL BIEF_DEALLOBJ(SA)
      CALL BIEF_DEALLOBJ(SCCG)
      CALL BIEF_DEALLOBJ(SDIV)
      CALL BIEF_DEALLOBJ(SDELTA)
      CALL BIEF_DEALLOBJ(SDDX)
      CALL BIEF_DEALLOBJ(SDDY)
      CALL BIEF_DEALLOBJ(SA_RMSE)
      CALL BIEF_DEALLOBJ(SXKONPT)
!
!
      CALL BIEF_DEALLOBJ(SRK)
      CALL BIEF_DEALLOBJ(SRX)
      CALL BIEF_DEALLOBJ(SRY)
      CALL BIEF_DEALLOBJ(SRXX)
      CALL BIEF_DEALLOBJ(SRYY)
!
!-----------------------------------------------------------------------
!
!                     **********************
!                     * POINTER: ARRAY IA*
!                     **********************
!
!-----------------------------------------------------------------------
!
!
      CALL BIEF_DEALLOBJ(SLIFBR)
      CALL BIEF_DEALLOBJ(SIBOR)
      CALL BIEF_DEALLOBJ(SBOUNDARY_COLOUR)
!
! FOOT OF THE CHARACTERISTICS
!
      CALL BIEF_DEALLOBJ(SELT)
      CALL BIEF_DEALLOBJ(SETA)
      CALL BIEF_DEALLOBJ(SISUB)
      CALL BIEF_DEALLOBJ(SFRE)
!
! WORKING ARRAYS USED IN THE CALL TO INBIEF AND INIPIE
!
      CALL BIEF_DEALLOBJ(SITR31)
      CALL BIEF_DEALLOBJ(SITR32)
      CALL BIEF_DEALLOBJ(SITR33)
!
!     WORKING ARRAYS OF INTEGERS
!
      CALL BIEF_DEALLOBJ(SITR01)
!
!.....NON-LINEAR INTERACTIONS
!
      CALL BIEF_DEALLOBJ(SIAGNL)
!
!GM V6P1 - NEW SOURCE TERMS
!............MDIA method
!
      DEALLOCATE(XLAMDI)
      DEALLOCATE(XMUMDI)
      DEALLOCATE(IANMDI)
      DEALLOCATE(COEMDI)
!............GQM method
      DEALLOCATE(K_IF1)
      DEALLOCATE(K_IF2,K_IF3)
      DEALLOCATE(K_1P,K_1M)
      DEALLOCATE(K_1P2P,K_1P3M)
      DEALLOCATE(K_1P2M,K_1P3P)
      DEALLOCATE(K_1M2P,K_1M3M)
      DEALLOCATE(K_1M2M,K_1M3P)
      DEALLOCATE(TB_V14)
      DEALLOCATE(TB_V24,TB_V34)
      DEALLOCATE(TB_TPM,TB_TMP)
      DEALLOCATE(TB_FAC)
      DEALLOCATE(IDCONF)
!
!.......END NON LINEAR INTERACTIONS
!GM Fin
!
!.......RELATIVE SPECTRUM ->  ABSOLUTE SPECTRUM (TRANSF)
!
      CALL BIEF_DEALLOBJ(SITR11)
      CALL BIEF_DEALLOBJ(SITR12)
      CALL BIEF_DEALLOBJ(SITR13)
!
      CALL BIEF_DEALLOBJ(SNEIGB)
      CALL BIEF_DEALLOBJ(SNB_CLOSE)

      ! limwac
      IF(ALLOCATED(UV2D)) DEALLOCATE(UV2D)
      IF(ALLOCATED(VV2D)) DEALLOCATE(VV2D)
      IF(ALLOCATED(PROF)) DEALLOCATE(PROF)
      IF(ALLOCATED(FB_CTE)) DEALLOCATE(FB_CTE)
      ! rpi_invr
      IF(DEJA_RPI) THEN
        DEALLOCATE(RK_I)
        DEALLOCATE(RN)
        DEALLOCATE(RX_I)
        DEALLOCATE(RY_I)
        DEALLOCATE(RXX_I)
        DEALLOCATE(RYY_I)
        DEALLOCATE(RAD1)
        DEJA_RPI = .FALSE.
      ENDIF
      ! frmset
      IF(DEJA_FRMSET) THEN
        DEALLOCATE(ILM_POIN)
        DEALLOCATE(CLM)
        DEALLOCATE(KACC)
        DEALLOCATE(NB_C)
        DEALLOCATE(SUR_P)
        DEALLOCATE(STACK)
        DEALLOCATE(STACK2)
        DEALLOCATE(ALREADY_POM)
        DEALLOCATE(MINDIST)
        DEJA_FRMSET = .FALSE.
      ENDIF
      ! diffrac
      IF(DEJA_DIFFRAC)THEN
        DEALLOCATE(SQRDELTA)
        DEALLOCATE(SQRCCG)
        DEALLOCATE(FRDK)
        DEALLOCATE(FRDA)
        DEALLOCATE(SCDA)
        DEALLOCATE(L_DELTA)
        DEJA_DIFFRAC = .FALSE.
      ENDIF
      ! rpi_intr
      IF(DEJA_RPI_INTR) THEN
        DEALLOCATE(WU_OM_RPI)
        DEJA_RPI_INTR = .FALSE.
      ENDIF
      ! wac
      IF(DEJA_QT2) THEN
        DEALLOCATE(QINDI)
        DEJA_QT2 = .FALSE.
      ENDIF
      ! lecdon_tomawac
      DEALLOCATE(NOLEO)
      DEALLOCATE(XLEO)
      DEALLOCATE(YLEO)
!
      IF (SURF_ROL) THEN
        CALL END_SURF_ROL
      ENDIF
!
!     OUT_HISTORY
!
      CALL OUTHIST_END()
!
!***********************************************************************
!
! CHECKS AND WRITES OUT
!
      WRITE(LU,23)
   23 FORMAT(1X,///,21X,'*************************************',/,
     &21X,              '*    END OF MEMORY ORGANIZATION:    *',/,
     &21X,              '*************************************',/)
!
!-----------------------------------------------------------------------
!
      RETURN
      END
