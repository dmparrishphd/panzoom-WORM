panTo <- function ( x , y ) {
    DIM <- usrDim ()
    SCALES <- scales ()
    HALF <- c ( -.5 , .5 )
    reset_usr (
        x = x + HALF * DIM [ 1 ] ,
        y = y + HALF * DIM [ 2 ] ,
        asp = SCALES [ 1 ] / SCALES [ 2 ] ) }
