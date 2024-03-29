      FUNCTION I2STR(I) RESULT(STR)
      ! ORIGINAL AUTHOR: Y. AUDOUIN

      IMPLICIT NONE

      INTEGER, INTENT(IN) :: I
      CHARACTER(LEN=10) :: STR

      STR = REPEAT(' ',10)
      IF (I.LT.10) THEN
        WRITE(STR,'(I1)') I
      ELSE IF (I.LT.100) THEN
        WRITE(STR,'(I2)') I
      ELSE IF (I.LT.1000) THEN
        WRITE(STR,'(I3)') I
      ELSE IF (I.LT.10000) THEN
        WRITE(STR,'(I4)') I
      ELSE IF (I.LT.100000) THEN
        WRITE(STR,'(I5)') I
      ELSE IF (I.LT.1000000) THEN
        WRITE(STR,'(I6)') I
      ELSE IF (I.LT.10000000) THEN
        WRITE(STR,'(I7)') I
      ELSE IF (I.LT.100000000) THEN
        WRITE(STR,'(I8)') I
      ELSE IF (I.LT.1000000000) THEN
        WRITE(STR,'(I9)') I
      ELSE
        WRITE(STR,'(I10)') I
      ENDIF

      END FUNCTION I2STR

