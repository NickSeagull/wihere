module Model exposing (..)

type alias Model =
    { refreshSeconds : Int
    , playing : Bool
    , currentSeconds : Int
    }
