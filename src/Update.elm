module Update exposing (..)
import Time exposing (Time)

type Msg =
    Tick Time

update msg model = ( model, Cmd.none )
