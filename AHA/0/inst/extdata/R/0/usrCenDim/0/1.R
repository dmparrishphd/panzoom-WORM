usrCenDim <- function ( FUN ) {
    USR <- par ( "usr" )
    vapply ( list ( USR [ 1 : 2 ] , USR [ 3 : 4 ] ) , FUN , 1 ) }
