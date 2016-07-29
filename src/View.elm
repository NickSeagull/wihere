module View exposing (view)
import Model exposing (Model)
import Update exposing (Msg(..))
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String exposing (toInt)

playingButton : Model -> Html Msg
playingButton model =
    let
        status = if model.playing then "active" else ""
        statusIcon = if model.playing then "pause" else "play"
    in
    button
    [ class <| "ui " ++ status ++ " icon button"
    , onClick TogglePlay
    ]
    [ i [ class <| statusIcon ++ " icon" ] []
    ]

progressBar model =
    let
        playingColor = if model.playing then "success" else ""
    in
    div
      [ class "centered row" ]
      [ div
        [ class "sixteen wide column" ]
        [ div
          [ class <| "ui indicating progress " ++ playingColor
          , attribute "data-percent" "74"
          , id "progress-bar"
          ]
          [ div
            [ class "bar" ]
            []
          , div
            [ class "label" ]
            []
          ]
        ]
      ]

view : Model -> Html Msg
view model =
    div
    [ class "ui grid container"
    ]
    [ div
      [ class "row" ]
      []
    , div
      [ class "center aligned row" ]
      [ div
        [ class "sixteen wide column" ]
        [ div
          [ class "ui fluid massive transparent right action icon input"]
          [ input
            [ type' "number"
            , id "number"
            , placeholder "Seconds"
            , onInput saveRefreshRate
            , Html.Attributes.min "1"
            , disabled model.playing
            ] []
          , playingButton model
          ]
        ]
      ]
    , progressBar model
    ]

saveRefreshRate : String -> Msg
saveRefreshRate s =
    case toInt s of
        Ok number ->
            UpdateRefreshRate number
        Err _ ->
            UpdateRefreshRate 1
