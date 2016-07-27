module Main exposing (..)
import Html.App as App
import Html.Events exposing (..)
import Time exposing (Time ,second)
import Task
import View exposing (view)
import Update exposing (..)


main = App.program
       { init = init
       , view = view
       , update = update
       , subscriptions = subscriptions
       }


subscriptions model =
    Time.every second Tick
    
init = ({refreshSeconds = 0, playing = False, currentSeconds = 0}, Cmd.none)

initialMessage : Msg -> Cmd Msg
initialMessage msg = Task.perform identity identity (Task.succeed msg)
