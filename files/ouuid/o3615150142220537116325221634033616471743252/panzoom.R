# panzoom
# ID: o3615150142220537116325221634033616471743252/panzoom.R
# Copyright 2022 D. Michael Parrish
# This work is licensed under AGPL-3,
# <https://www.gnu.org/licenses/agpl-3.0.html>
( function () {

    En <- new.env ( parent = as.environment ( "package:graphics" ) )
    Ex <- new.env ( parent = En )     

    En $ imageHold_mfg <- function ( ... ) {
        MFG <- par ( "mfg" )
        par ( mfg = MFG )
        invisible () }

    En $ reset_usr <- function ( xRange , yRange , asp = 1 )
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
            yaxt = "n" )

    En $ usrCenDim <- function ( FUN ) {
        USR <- par ( "usr" )
        vapply ( list ( USR [ 1 : 2 ] , USR [ 3 : 4 ] ) , FUN , 1 ) }

    En $ usrCenter <- function () usrCenDim ( mean )

    En $ usrDim <- function () usrCenDim ( diff )

    En $ scales <- function ()
            diff ( par ( "usr" ) ) [ -2 ] / par ( "pin" )

    Ex $ panTo <- function ( x , y ) {
        DIM <- usrDim ()
        SCALES <- scales ()
        HALF <- c ( -.5 , .5 )
        reset_usr (
            x = x + HALF * DIM [ 1 ] ,
            y = y + HALF * DIM [ 2 ] ,
            asp = SCALES [ 1 ] / SCALES [ 2 ] ) }

    Ex $ zoom <- function ( factor = 1 ) {
        DIM <- usrDim ()
        SCALES <- scales ()
        CEN <- usrCenter ()
        HALF <- c ( -0.5 , 0.5 )
        reset_usr (
            x = CEN [ 1 ] + HALF * DIM [ 1 ] / factor ,
            y = CEN [ 2 ] + HALF * DIM [ 2 ] / factor ,
            asp = SCALES [ 1 ] / SCALES [ 2 ] ) }

    Ex $ resetAspect <- function ( x , y = x ) {
        CEN <- usrCenter ()
        USR <- par ( "usr" )
        reset_usr ( USR [ 1 : 2 ] , USR [ 3 : 4 ] , asp = y / x ) }
        # SCALES <- scales ()
        # zoom ( mean ( SCALES / c ( y , x ) ) )
        # panTo ( CEN [ 1 ] , CEN [ 2 ] ) }

    for ( Name in names ( En ) )
            environment ( En [[ Name ]] ) <- En
    for ( Name in names ( Ex ) )
            environment ( Ex [[ Name ]] ) <- Ex

    Ex

    } ) ()
