reset_usr <- function ( xRange , yRange , asp = 1 ) {
    imageHold_mfg (
        x = xRange ,
        y = yRange ,
        z = matrix ( 1L ) ,
        asp = asp ,
        useRaster = TRUE ,
        col  =  NA ,
        xlab =  "" ,
        ylab =  "" ,
        bty  = "n" ,
        xaxt = "n" ,
        yaxt = "n" ) }
