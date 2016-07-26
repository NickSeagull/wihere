module View exposing (view)
import Model exposing (Model)
import Update exposing (Msg(..))
import Html exposing (..)

view : Model -> Html Msg
view model = text "Hello"
