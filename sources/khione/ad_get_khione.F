!                     ************************
                      SUBROUTINE AD_GET_KHIONE
!                     ************************
!
     &(IVAR,ADOBJ)
!
!***********************************************************************
! KHIONE   V7P3
!***********************************************************************
!
!brief    ASSOCIATE THE ARRAY ADOBJ%R TO THE APPROPRIATE
!         DIFFERENTED VARIBALE.
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!| IVAR       |-->| ONE SPECIFIC DIFERENTIABLE VARIABLE
!| ADOBJ      |<->| MOST LIKELY ONE OF THE VARSOR%ADR(I_ADVAR)%P
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
      USE BIEF
      USE DECLARATIONS_SPECIAL
      USE DECLARATIONS_KHIONE
!
      IMPLICIT NONE
!
!+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
!
      INTEGER, INTENT(IN)             :: IVAR
      TYPE(BIEF_OBJ)  , INTENT(INOUT) :: ADOBJ
!
!+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
!
      SELECT CASE (IVAR)
!     JUST TESTING IO OF DIFFERENTIATED VARIABLES
!
!   THIS IS JUST AN EXAMPLE, TO HELP USERS LINKING ADVAR WITH THEIR
!     OWN DERIVATIVES. HERE, ADVAR(1), (2) AND (3) ARE THE
!     DIFFERENTIATED VARIABLES OF TRACER(1), U AND V RESPECTIVELY.
!
#if defined COMPAD_DCO_T1S
!      CASE(1)
!        CALL DCO_T1S_GET( T%ADR(1)%P%R, ADOBJ%R, 1 )
!      CASE(2)
!        CALL DCO_T1S_GET( U%R, ADOBJ%R, 1 )
!      CASE(3)
!        CALL DCO_T1S_GET( V%R, ADOBJ%R, 1 )
!
!   JUST IN CASE T1S IS NOT AVAILABLE, HERE BELOW FOR TESTING
!     WITHOUT DIFFERENTIATED VARIABLES.
!
!#else
!      CASE(1)
!        ADOBJ%R = T%ADR(1)%P%R
!      CASE(2)
!        ADOBJ%R = U%R
!      CASE(3)
!        ADOBJ%R = V%R
#endif
      CASE DEFAULT
        WRITE(LU,*) 'WARNING: UNKNOWN DIFFERENTIATED VARIABLE ',IVAR
        WRITE(LU,*) '  UPDATE EITHER SUBROUTINE AD_GET_KHIONE'
        WRITE(LU,*) '  OR THE NUMBER OF DIFFERENTIATED  VARIABLES'
        WRITE(LU,*) '  -- OR ALGORITHMIC DIFFERENTIATION MIGHT NOT BE'
        WRITE(LU,*) '  CONFIGURED.'
      END SELECT
!
!-----------------------------------------------------------------------
!
      RETURN
      END SUBROUTINE AD_GET_KHIONE
