zoom <- function ( factor = 1 ) {
    DIM <- usrDim ()
    SCALES <- scales ()
    CEN <- usrCenter ()
    HALF <- c ( -0.5 , 0.5 )
    reset_usr (
        x = CEN [ 1 ] + HALF * DIM [ 1 ] / factor ,
        y = CEN [ 2 ] + HALF * DIM [ 2 ] / factor ,
        asp = SCALES [ 1 ] / SCALES [ 2 ] ) }
