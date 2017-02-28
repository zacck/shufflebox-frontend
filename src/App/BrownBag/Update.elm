module App.BrownBag.Update exposing (..)

import Navigation
import Routing.Route exposing (Route(..), reverse)
import App.BrownBag.Models exposing (Presenter)
import App.BrownBag.Messages exposing (Msg(..))


update : Msg -> List Presenter -> ( List Presenter, Cmd Msg )
update msg brownBags =
    case msg of
        ListBrownBags ->
            ( brownBags, Navigation.newUrl (reverse BrownBagsRoute) )

        OnFetchBrownBags (Ok newBrownBags) ->
            ( newBrownBags, Cmd.none )

        OnFetchBrownBags (Err _) ->
            ( brownBags, Cmd.none )

        _ ->
            ( brownBags, Cmd.none )