imageHold_mfg <- function ( ... ) {
    MFG <- par ( "mfg" )
    Return <- image ( ... )
    par ( mfg = MFG )
    invisible ( Return ) }
