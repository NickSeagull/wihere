module View exposing (view)
import Model exposing (Model)
import Update exposing (Msg(..))
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

playingButton : Model -> Html Msg
playingButton model =
    let
        status = if model.playing then "active" else ""
        statusIcon = if model.playing then "stop" else "play"
    in
    button
    [ class <| "ui " ++ status ++ " icon button"
    , onClick TogglePlay
    ]
    [ i [ class <| statusIcon ++ " icon" ] [] ]

view : Model -> Html Msg
view model =
    div
    [ class "ui middle aligned center aligned grid"
    , id "main-container"
    ]
    [ div
      [ class "ui row" ]
      [ div
        [ class "ui column" ]
        [ div
          [ class "ui left icon input"]
          [ input [ type' "number", placeholder "Refresh seconds"] []
          , i [ class "alarm icon" ] []
          ]
        , div [ class "ui column"] [playingButton model]
        ]
      ]
    ]
