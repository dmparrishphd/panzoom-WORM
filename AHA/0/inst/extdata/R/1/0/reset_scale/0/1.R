reset_scale <- function ( x , y = x ) {
    CEN <- usrCenter ()
    USR <- par ( "usr" )
    reset_usr ( USR [ 1 : 2 ] , USR [ 3 : 4 ] , asp = y / x )
    SCALES <- scales ()
    zoom ( mean ( SCALES / c ( y , x ) ) )
    panTo ( CEN [ 1 ] , CEN [ 2 ] ) }
