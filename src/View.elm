module View exposing (view)
import Model exposing (Model)
import Update exposing (Msg(..))
import Html exposing (..)
import Html.Attributes exposing (..)

view : Model -> Html Msg
view model =
    div
    [ class "ui middle aligned center aligned grid" ]
    [ div
      [ class "column" ]
      [ h1 [ class "ui teal header" ] [ text "Hello world!" ] ]
    ]
