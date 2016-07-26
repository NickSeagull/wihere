module Model exposing (..)

type alias Model =
    { refreshMilliseconds : Int
    , playing : Bool
    , currentMilliseconds : Int
    }
